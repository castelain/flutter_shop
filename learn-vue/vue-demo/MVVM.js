// 观察者模式
class Watcher {
	constructor(vm, expr, callback) {
		this.vm = vm;
		this.expr = expr;
		this.callback = callback;
		this.oldValue = this.get();
	}
	get() {
		Dep.target = this;
		let value = CompileUtil.getValue(this.vm, this.expr);
		Dep.target = null;
		return value;
	}
	update() {
		let newValue = CompileUtil.getValue(this.vm, this.expr)
		if (this.oldValue !== newValue) {
			this.callback(newValue)
		}
	}
}
// 发布/订阅
class Dep {
	constructor() {
		// 存储所有的观察者
		this.subs = [];
	}
	// 订阅
	addSub(watcher) {
		this.subs.push(watcher);
	}
	// 发布
	notify() {
		this.subs.forEach((watcher) => {
			watcher.update()
		})
	}
}

// 实现数据劫持
// 观察类 将传入的数据的定义都改为 defineProperty 的方式
class Observer {
	constructor(data) {
		this.observer(data);
	}
	observer(data) {
		if (data && typeof data === 'object') {
			for (let key in data) {
				this.defineReactive(data, key, data[key]);
				this.observer(data[key]);
			}
		}
	}
	defineReactive(obj, key, value) {
		this.observer(value);
		let dep = new Dep();
		Object.defineProperty(obj, key, {
			get() {
				// 添加观察者
				Dep.target && dep.addSub(Dep.target);
				return value;
			},
			set: (newValue) => {
				if (newValue !== value) {
					// 将新值转为 get set 形式后再进行赋值
					this.observer(newValue);
					value = newValue;
					// 通知观察者
					dep.notify();
				}
			}
		})
	}
}
// 编译类
class Complier {
	constructor(el, vm) {
		// 获取 elementNode
		this.el = this.isElementNode(el) ? el : document.querySelector(el);
		this.vm = vm;
		// 将 elementNode 放到内存中的文档块中
		let fragement = this.node2Fragement(this.el);
		// 基于数据编译模板
		this.compile(fragement);
		// 将编译好的数据放回到页面
		this.el.appendChild(fragement);
	}
	// 判断传入的 el 是否为 dom 节点
	isElementNode(el) {
		return el.nodeType === 1;
	}
	// 把节点移到内存中
	node2Fragement(el) {
		let fragement = document.createDocumentFragment();
		let firstChild;
		while (firstChild = el.firstChild) {
			fragement.appendChild(firstChild);
		}
		return fragement;
	}
	// 编译内存中的 dom 节点 编译主方法
	compile(node) {
		let childNodes = node.childNodes;
		[...childNodes].forEach(child => {
			if (this.isElementNode(child)) {
				this.compileElement(child);
				// 递归 遍历深层元素
				this.compile(child);
			} else {
				this.compileText(child);
			}
		})
	}
	// 编译元素
	compileElement(node) {
		let attributes = node.attributes;
		[...attributes].forEach((attr) => {
			let { name, value: expr } = attr;
			if (this.isDirective(name)) {
				let eventName;
				let [, directive] = name.split('-');
				[directive, eventName] = directive.split(':');
				CompileUtil[directive](node, expr, this.vm, eventName);
			}
		});
	}
	// 判断传入的属性是否为指令
	isDirective(attrName) {
		return attrName.startsWith('v-');
	}
	// 编译文本
	compileText(node) {
		let content = node.textContent;
		if (/\{\{.+?\}\}/.test(content)) {
			CompileUtil['text'](node, content, this.vm);
		}
	}
}

// 编译工具方法包
CompileUtil = {
	setValue(vm, expr, value) {
		expr.split('.').reduce((data, current, index, arr) => {
			if (index === arr.length - 1) {
				return data[current] = value;
			}
			return data[current];
		}, vm.$data)
	},
	getValue(vm, expr) {
		return expr.split('.').reduce((data, current) => {
			if (typeof data === 'object') {
				// console.log(current, data[current])
				return data[current.trim()]
			}
			return data;
		}, vm.$data);
	},
	getContentValue(vm, expr) {
		return expr.replace(/\{\{(.+?)\}\}/g, (...args) => {
			return this.getValue(vm, args[1]);
		});
	},
	model(node, expr, vm) {
		let fn = this.updater.modelUpdater;
		// console.log(expr)
		// 给输入框添加一个观察者
		new Watcher(vm, expr, (newValue) => { fn(node, newValue) });
		node.addEventListener('input', (event) => {
			this.setValue(vm, expr, event.target.value);
		})
		let value = this.getValue(vm, expr);
		fn(node, value);
	},
	text(node, expr, vm) {
		let fn = this.updater.textUpdater;
		let value = expr.replace(/\{\{(.+?)\}\}/g, (...args) => {
			// 给每个 {{}} 都加上观察者 
			new Watcher(vm, args[1], () => {
				fn(node, this.getContentValue(vm, expr))
			})
			return this.getValue(vm, args[1]);
		});
		fn(node, value);
	},
	html(node, expr, vm) {
		let fn = this.updater.htmlUpdater;
		let value = this.getValue(vm, expr);
		new Watcher(vm, expr, () => {
			fn(node, this.getValue(vm, expr));
		})
		fn(node, value);
	},
	on(node, expr, vm, eventName) {
		node.addEventListener(eventName, (e) => {
			vm[expr].call(vm, e);
		})
	},
	updater: {
		modelUpdater(node, value) {
			node.value = value
		},
		textUpdater(node, value) {
			node.textContent = value;
		},
		htmlUpdater(node, value) {
			node.innerHTML = value;
		}
	}
}

// 基类
class Vue {
	constructor(options) {
		this.$el = options.el;
		this.$data = options.data;
		let computed = options.computed;
		let methods = options.methods;

		if (this.$el) {
			// 以 defineProperty 的形式定义数据属性
			new Observer(this.$data);
			// 把 vm 上数据的获取都代理到 vm.$data 上  vm.person => vm.$data.person
			this.proxyVm(this.$data);
			// 计算属性挂在 vm.$data 上
			for (let key in computed) {
				Object.defineProperty(this.$data, key, {
					get: () => {
						return computed[key].call(this);
					}
				})
			}
			// 方法挂在 vm上
			for (let key in methods) {
				Object.defineProperty(this, key, {
					get: () => {
						return methods[key];
					}
				})
			}
			// 基于数据编译模板
			new Complier(this.$el, this);
		}
	}
	proxyVm(data) {
		for (let key in data) {
			Object.defineProperty(this, key, {
				get() {
					return data[key];
				},
				set(newValue) {
					if (data[key] !== newValue) {
						data[key] = newValue;
					}
				}
			})
		}
	}
}