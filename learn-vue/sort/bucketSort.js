// 桶排序
// 桶排序是计数排序的升级版。
// 它利用了函数的映射关系，高效与否的关键就在于这个映射函数的确定。
// 桶排序 (Bucket sort)的工作的原理：假设输入数据服从均匀分布，将数据分到有限数量的桶里，
// 每个桶再分别排序（有可能再使用别的排序算法或是以递归方式继续使用桶排序进行排）

function insertionSort(arr) {
	// 遍历无序数列
	for (let i = 1; i < arr.length; i++) {
		// 待插入的一个无序数据
		let current = arr[i];
		// 默认第一个数据为有序的
		let j = i - 1;
		// 从后往前遍历有序数列
		while (j >= 0 && current < arr[j]) {
			// 将有序数列中大于无序数据的部分从后往前依次向后移动
			arr[j + 1] = arr[j];
			j--;
		}
		arr[j + 1] = current;
	}
	return arr;
}

function bucketSort(arr, size) {
	let bucketSize = size || 5;
	let result = [];
	if (arr.length <= 1) {
		return arr;
	}
	let minValue = arr[0];
	let maxValue = arr[0];
	// 找到数组中的最大值和最小值
	for (let i = 1; i < arr.length; i++) {
		if (minValue > arr[i]) {
			minValue = arr[i];
		} else if (maxValue < arr[i]) {
			maxValue = arr[i];
		}
	}

	let bucketCount = Math.floor((maxValue - minValue) / bucketSize) + 1;
	let buckets = new Array(bucketCount);
	// 初始化桶
	for (let i = 0; i < bucketCount; i++) {
		buckets[i] = [];
	}
	// 将数据分配到桶中
	for (let i = 0; i < arr.length; i++) {
		let bucketIndex = Math.floor((arr[i] - minValue) / bucketSize);
		buckets[bucketIndex].push(arr[i]);
	}
	// 使用插入排序，对桶内数据进行排序
	for (let i = 0; i < buckets.length; i++) {
		insertionSort(buckets[i]);
		// 将排序完成的数据放进 result 数组中
		result = [...result, ...buckets[i]];
	}
	return result;
}

bucketSort([4, 6, 8, 5, 9, 1, 2, 5, 3, 2]);
