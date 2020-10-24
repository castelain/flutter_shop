self.onmessage = function (event) {
	let data = event.data

	self.postMessage(data.sort((a, b) => a - b))
}

self.onerror = function (event) {
	this.console.log('Error: ', event.filename, ' lineNo: ', event.lineno, ' message: ', event.message)
}