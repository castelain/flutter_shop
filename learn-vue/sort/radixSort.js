// 基数排序
// 基数排序是一种非比较型整数排序算法，其原理是将整数按位数切割成不同的数字，然后按每个位数分别比较。
// 由于整数也可以表达字符串（比如名字或日期）和特定格式的浮点数，所以基数排序也不是只能使用于整数。

let counter = [];
function radixSort(arr, maxDigit) {
	let mod = 10;
	let dev = 1;
	for (let i = 0; i < maxDigit; i++, dev *= 10, mod *= 10) {
		for (let j = 0; j < arr.length; j++) {
			let bucket = parseInt((arr[j] % mod) / dev);
			if (counter[bucket] == null) {
				counter[bucket] = [];
			}
			counter[bucket].push(arr[j]);
		}
		let pos = 0;
		for (let j = 0; j < counter.length; j++) {
			let value = null;
			if (counter[j] != null) {
				while ((value = counter[j].shift()) != null) {
					arr[pos++] = value;
				}
			}
		}
	}
	return arr;
}

radixSort([4, 6, 8, 5, 9, 1, 2, 5, 3, 2], 1);
