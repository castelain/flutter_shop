/**
 *【找朋友】
 * 在学校中，N个⼩朋友站成⼀队， 第i个⼩朋友的身⾼为height[i]，
第i个⼩朋友可以看到的第⼀个⽐⾃⼰身⾼更⾼的⼩朋友j，那么j是i的好朋友(要求j > i)。
请重新⽣成⼀个列表，对应位置的输出是每个⼩朋友的好朋友位置，如果没有看到好朋友，请在该位置⽤0代替。
⼩朋友⼈数范围是 [0, 40000]。

 * 输⼊描述：
 * 第⼀⾏输⼊N，N表示有N个⼩朋友
	第⼆⾏输⼊N个⼩朋友的身⾼height[i]，都是整数
 * 
 * 输出描述：
 * 输出N个⼩朋友的好朋友的位置
 * 
 * 示例1：
 * 输⼊：
 * 2
	100 95
 * 
 * 输出：
 * 0 0
 */

function findFriends(n, heights) {
	let heightArr = heights.split(' ');
	let resultArr = [];
	if (n === 0) {
		return 0;
	}
	for (let i = 0; i < n; i++) {
		let index = queryFriend(heightArr[i], i + 1, heightArr.slice(i + 1));
		resultArr.push(index);
	}
	return resultArr.join(' ');
}

// 查询出指定身高在指定数组中的朋友位置
function queryFriend(height, index, heightArr) {
	if (heightArr.length === 0) {
		return 0;
	}
	for (let i = 0; i < heightArr.length; i++) {
		if (Number(heightArr[i]) > Number(height)) {
			return index + i + 1;
		}
	}
	return 0;
}

console.log(findFriends(2, '100 95')); // 0 0
console.log(findFriends(1, '22')); // 0
console.log(findFriends(0, '')); // 0
console.log(findFriends(4, '100 95 120 110'));  // 3 3 0 0