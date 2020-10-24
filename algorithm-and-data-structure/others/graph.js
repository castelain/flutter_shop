// 无向无权图
function Graph(v) {
	this.vertices = v; // 顶点数
	this.edges = 0; // 边数
	this.adjacencyList = []; // 邻接表数组

	this.visited = []; // 记录顶点的访问情况：true -> 已访问; false -> 未访问

	for (let i = 0; i < this.vertices; i++) {
		// 初始化邻接表数组
		this.adjacencyList[i] = [];
		// 初始化顶点访问与否记录数组
		this.visited[i] = false;
	}

	this.addEdg = addEdg;
	this.showGraph = showGraph;

	this.dfs = dfs;
	this.bfs = bfs;
}

// 在邻接表数组中，添加边[vertives[i], vertices[j]]
function addEdg(v, w) {
	this.adjacencyList[v].push(w);
	this.adjacencyList[w].push(v);
	this.edges++;
}

// 打印图，其实是打印出图的邻接表数组
function showGraph() {
	console.log('该无向无权图的邻接表数组如下：')
	for (let i = 0; i < this.vertices; i++) {
		let str = `${i} ->`;
		for (let item of this.adjacencyList[i]) {
			str += ` ${item}`;
		}
		console.log(str);
	}
}

// 深度优先遍历
function dfs(i) {
	this.visited[i] = true;
	console.log(`访问了顶点${i}...`);
	for (let item of this.adjacencyList[i]) {
		if (!this.visited[item]) {
			this.dfs(item);
		}
	}
}



// 广度优先遍历
function bfs(i) {
	// 重置访问数组
	for (let i = 0; i < this.vertices; i++) {
		// 初始化顶点访问与否记录数组
		this.visited[i] = false;
	}
	let queue = [];
	this.visited[i] = true;
	console.log(`访问了顶点${i}...`)
	queue.push(i);
	while (queue.length > 0) {
		let v = queue.shift();
		for (let item of this.adjacencyList[v]) {
			if (!this.visited[item]) {
				this.visited[item] = true;
				console.log(`访问了顶点${item}...`)
				queue.push(item);
			}
		}
	}
}


// just for test
// 创建一个有 6 个顶点的无向无权图
let graph = new Graph(6);
// 添加顶点之间的边
graph.addEdg(0, 1);
graph.addEdg(1, 4);
graph.addEdg(2, 4);
graph.addEdg(2, 5);
graph.addEdg(3, 4);
// 打印出图的邻接表数组
graph.showGraph();

// 深度优先搜索图
console.log('深度优先搜索：');
graph.dfs(0);

console.log('==============================')

console.log('广度优先搜索：');
graph.bfs(0);