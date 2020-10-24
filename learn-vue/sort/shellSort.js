// 希尔排序
// 先将整个待排序的记录序列分割成为若干子序列分别进行直接插入排序，具体算法描述：

// 选择一个增量序列t1，t2，…，tk，其中 ti > tj，tk = 1；
// 按增量序列个数 k，对序列进行 k 趟排序；
// 每趟排序，根据对应的增量ti，将待排序列分割成若干长度为m 的子序列，分别对各子表进行直接插入排序。仅增量因子为1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。

function shellSort(arr) {
	for (let gap = Math.floor(arr.length / 2); gap > 0; gap = Math.floor(gap / 2)) {
		for (let i = gap; i < arr.length; i++) {
			let current = arr[i];
			let j = i;
			while (j - gap >= 0 && arr[j - gap] > arr[j]) {
				arr[j - gap + 1] = arr[j - gap];
				j = j - gap;
			}
			arr[j] = current;
		}
	}
	return arr;
}

shellSort([3, 1, 6, 5, 7]);