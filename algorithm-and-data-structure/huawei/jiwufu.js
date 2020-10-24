/**
 * 【集五福】
 * 集五福作为近年来⼤家喜闻乐⻅迎新春活动，集合爱国福、富强福、和谐福、友善福、敬业福即可分享超⼤红包
以0和1组成的⻓度为5的字符串代表每个⼈所得到的福卡，每⼀位代表⼀种福卡，1表示已经获得该福卡，单类型福卡不超过1张，随机抽取⼀个不超过10⼈团队，求
该团队最多可以集⻬多少套五福
 * 
 * 输⼊描述：
输⼊类似11010,00110，由0、1组成的⻓度为5的字符串，代表指定团队中每个⼈福卡获得情况
注意1：1⼈也可以是⼀个团队
注意2：多⼈之间的福卡以英⽂逗号隔开

	* 输出描述：
输出该团队能凑⻬多少套五福

	* 输入：
	* 11001,11100
	* 输出：
	* 0
 */

function getWufu(str) {
	let arr = str.split(',')
	let n = arr.length;
	let standard = 11111;
	if (n === 0) {
		return 0;
	} else if (n === 1) {
		if (Number(str) === standard) {
			return 1;
		} else {
			return 0;
		}
	} else {
		let map = new Map();
		for (let i = 0; i < n; i++) {
			let temp = arr[i].split('');
			for (let j = 0; j < temp.length; j++) {
				map.set(j, map.has(j) ? map.get(j) + Number(temp[j]) : Number(temp[j]));
			}
		}
		let tempArr = Array.from(map);
		tempArr.sort((a, b) => a[1] - b[1]);
		return tempArr[0][1];
	}
}

console.log(getWufu('11001,11100'));
console.log(getWufu('11001,11111'));
console.log(getWufu('11001,11111,00111'));