let Mock = require('mockjs')

// String
let str1 = Mock.mock({
	'string|1-10': '*'
})
console.log(JSON.stringify(str1, null, 2))

let str2 = Mock.mock({
	'string|2': '###'
})
console.log(JSON.stringify(str2, null, 2))

// Number
let num1 = Mock.mock({
	'number|+1': 202
})
console.log(JSON.stringify(num1, null, 2))

let num2 = Mock.mock({
	'number|1-100': 100
})
console.log(JSON.stringify(num2, null, 2))

