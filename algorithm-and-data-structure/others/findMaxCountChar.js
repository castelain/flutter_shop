function findMaxCountChar(str) {
	let map = new Map();
	let maxChar = '';
	let maxCount = 0;
	for (let i = 0; i < str.length; i++) {
			map.has(str[i]) ? map.set(str[i], map.get(str[i]) + 1) : map.set(str[i], 1);
	}
	for (let key of map.keys()) {
			if (map.get(key) > maxCount) {
					maxCount = map.get(key);
					maxChar = key;
			}
	}
	console.log('出现次数最多的字符：', maxChar, ' 出现次数：', maxCount);
	return maxChar;
}