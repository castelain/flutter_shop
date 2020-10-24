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

insertionSort([3, 1, 6, 5, 7]);