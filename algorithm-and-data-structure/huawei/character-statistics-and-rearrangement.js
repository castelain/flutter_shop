/** 
 * 【字符统计及重排】
 * 给出⼀个仅包含字⺟的字符串，不包含空格，统计字符串中各个字⺟（区分⼤⼩写）出现的次数，并按照字⺟出现次数从⼤到⼩的顺序输出各个
字⺟及其出现次数。如果次数相同，按照⾃然顺序进⾏排序，且⼩写字⺟在⼤写字⺟之前。
 *
 * 输⼊描述:
 * 输⼊⼀⾏，为⼀个仅包含字⺟的字符串。
 * 输出描述：
 * 按照字⺟出现次数从⼤到⼩的顺序输出各个字⺟和字⺟次数，⽤英⽂分号分隔，注意末尾的分号；字⺟和次数间⽤英⽂冒号分隔。
 * 
 * 示例1：
 * 输⼊: xyxyXX
 * 输出：x:2;y:2;X:2
 * 
*/

function analyseChars(str) {
	let map = new Map();
	let result = "";
	// 字符按大小写排序(小写字母在大写字母之前: 降序排列)
	let tempArr = str.split('');
	tempArr.sort(); // 默认是按字母顺序排列(大写字母在小写字母之前)
	let lowerCaseIndex = 0; // 记录小写字母首次出现的位置
	for (let i = 0; i < tempArr.length; i++) {
		if (tempArr[i].charCodeAt() > 'Z'.charCodeAt()) {
			lowerCaseIndex = i;
			break;
		}
	}
	tempArr = [...tempArr.slice(lowerCaseIndex), ...tempArr.slice(0, lowerCaseIndex)];
	// 字符统计
	for (let i = 0; i < tempArr.length; i++) {
		map.has(tempArr[i]) ? map.set(tempArr[i], map.get(tempArr[i]) + 1) : map.set(tempArr[i], 1);
	}
	// 字符次数排序(降序排列)
	let arr = Array.from(map);
	arr.sort((a, b) => b[1] - a[1]);
	// 结果格式化
	arr.forEach(value => {
		result += `${value[0]}:${value[1]};`
	});
	result = result.slice(0, result.length - 1);
	return result;
}

console.log(analyseChars('xyxyXX'));
console.log(analyseChars('YyYxyXX'));
console.log(analyseChars('YyYxyx'));
console.log(analyseChars('asdcSADCE'));