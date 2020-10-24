/**
 * 【九宫格按键输⼊】
九宫格按键输⼊，有英⽂和数字两个模式，默认是数字模式，数字模式直接输出数字，英⽂模式连续按同⼀个按键会依次出现这个按键上的字⺟，如果输⼊“/”或者其
他字符，则循环中断，输出此时停留的字⺟。
数字和字⺟的对应关系如下，注意: 
	0只对应空格： 1（,.） 2（abc） 3（def） 4（ghi） 5（jkl） 6（mno） 7（pqrs）  8（tuv）  9（wxyz）  # 0（空格）
	/ 输⼊⼀串按键，要求输出屏幕显示
1、# ⽤于切换模式，默认是数字模式，执⾏#后切换为英⽂模式；
2、/ 表示延迟，例如在英⽂模式下，输⼊22/222，显示为bc，数字模式下/没有效果；
3、英⽂模式下，多次按同⼀键，例如输⼊22222，显示为b；
 *
 * 输⼊描述：
 * 输⼊范围为数字0~9和字符 ‘#’、‘/’，输出屏幕显示，例如，
在数字模式下，输⼊1234，显示 1234
在英⽂模式下，输⼊1234，显示 ,adg
 * 输出描述：
 * 输出屏幕显示的字符
 * 
 * 示例1：
 * 输⼊: 2222/22
 * 输出: 222222
 * 
 */

function translateKeyInput(str) {
	// 标识是否为英文模式
	let isEnglishMode = false;
	// 单段模式输入串
	let subStr = "";
	// 记录最后的结果
	let result = "";
	for (let i = 0; i < str.length; i++) {
		let char = str[i];
		if (char === '#') {
			if (i !== 0) {
				result += isEnglishMode ? translateEnglishMode(subStr) : translateNumberMode(subStr);
			}
			isEnglishMode = !isEnglishMode;
			subStr = "";
		} else {
			subStr += char;
		}
	}
	if (subStr) {
		result += isEnglishMode ? translateEnglishMode(subStr) : translateNumberMode(subStr);
	}
	return result;
}

// 数字模式转换
function translateNumberMode(str) {
	let arr = str.split('')
	// 移除 / 后的数组
	let arrWithoutSymbols = arr.filter(item => item !== '/');
	return arrWithoutSymbols.join('');
}

// 英文模式转换
function translateEnglishMode(str) {
	let arr = str.split('/');
	let collects = [' ', ',.', 'abc', 'def', 'ghi', 'jkl', 'mno', 'pqrs', 'tuv', 'wxyz'];
	let result = "";
	for (let i = 0; i < arr.length; i++) {
		let collectNo = Number(arr[i][0]);
		let itemIndex = collects[collectNo].length - 1;
		if (arr[i].length % collects[collectNo].length !== 0) {
			itemIndex = arr[i].length % collects[collectNo].length - 1;
		}
		result += collects[collectNo][itemIndex];
	}
	return result;
}

console.log(translateKeyInput('2222/22'));
console.log(translateKeyInput('1234'));
console.log(translateKeyInput('#2222'));
console.log(translateKeyInput('22222'));
console.log(translateKeyInput('#22/222'));
