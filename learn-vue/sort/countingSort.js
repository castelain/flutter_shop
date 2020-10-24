// 计数排序
// 计数排序不是基于比较的排序算法，其核心在于将输入的数据值转化为键存储在额外开辟的数组空间中。
//  作为一种线性时间复杂度的排序，计数排序要求输入的数据必须是有确定范围的整数。

function countingSort(arr, maxValue) {
	maxValue = maxValue || Math.max(...arr);
	let countingArr = new Array(maxValue + 1);
	let result = [];
	for (let i = 0; i < arr.length; i++) {
		if (!countingArr[arr[i]]) {
			// 初始化键值对应的计数值
			countingArr[arr[i]] = 0;
		}
		// 键值对应的数据出现，计数值加一
		countingArr[arr[i]]++;
	}
	for (let i = 0; i < countingArr.length; i++) {
		while (countingArr[i] > 0) {
			result.push(i);
			countingArr[i]--;
		}
	}
	return result;
}

countingSort([4, 6, 8, 5, 9, 1, 2, 5, 3, 2], 9);
