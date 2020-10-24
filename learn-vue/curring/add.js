// 实现一个add方法，使计算结果能够满足如下预期：
// add(1)(2)(3).toString() => 6;
// add(1, 2, 3)(4).toString() => 10;
// add(1)(2)(3)(4)(5).toString() => 15;
// add(1, 2, 3)(4) == 10 => true

function add() {
	let args = [...arguments];
	let adder = function () {
		args.push(...arguments);
		return adder;
	}
	adder.toString = function () {
		return args.reduce((a, b) => a + b);
	}
	return adder;
}
