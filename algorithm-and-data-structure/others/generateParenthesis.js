/**
 * 数字 n 代表生成括号的对数，请你设计一个函数，
 * 用于能够生成所有可能的并且 有效的 括号组合。
 * 
 * @param {number} n
 * @return {string[]}
 */
var generateParenthesis = function (n) {
	let result = [];
	generate(0, 0, '');
	return result;

	function generate(left, right, str) {
		if (left === n && right === n) {   // left: 0, right: 0; left: 1, right: 0; left: 2, right: 0;left:3, right: 0;left: 3, right: 1; left: 3, right: 2; left: 3,right: 3;
			result.push(str); // ['((()))']; 
		}
		if (left < right) { // 
			return;
		}
		if (left < n) { // 0 < 3; 1 < 3; 2 < 3; 3 < 3
			generate(left + 1, right, str + "(");  // generate(1,0,'('); generate(2,0,'(('); generate(3,0,'(((')
		}
		if (left > right) { // 3 > 0; 3 > 1; 3 > 2;
			generate(left, right + 1, str + ")"); // generate(3,1,'((()'); generate(3,2,'((())'); generate(3,3,'((()))')
		}
	}
};

console.log(generateParenthesis(3));