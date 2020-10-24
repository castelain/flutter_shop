// 堆排序
// 将初始待排序关键字序列(R1,R2….Rn)构建成大顶堆，此堆为初始的无序区；
// 将堆顶元素R[1]与最后一个元素R[n]交换，此时得到新的无序区(R1,R2,……Rn-1)和新的有序区(Rn),且满足R[1,2…n-1]<=R[n]；
// 由于交换后新的堆顶R[1]可能违反大顶堆的性质，因此需要对当前无序区(R1,R2,……Rn-1)调整为新堆，
// 然后再次将R[1]与无序区最后一个元素交换，得到新的无序区(R1,R2….Rn-2)和新的有序区(Rn-1,Rn)。不断重复此过程直到有序区的元素个数为n-1，则整个排序过程完成。

function exchange(arr, i, j) {
	[arr[i], arr[j]] = [arr[j], arr[i]];
}

function shiftDown(arr, i, length) {
	for (let j = 2 * i + 1; j < length; j = 2 * j + 1) {
		if (j + 1 < length && arr[j] < arr[j + 1]) {
			j++;
		}
		if (arr[j] > arr[i]) {
			exchange(arr, i, j);
			i = j;
		} else {
			break;
		}
	}
}

function heapSort(arr) {
	// 从下至上，从右至左将数据初始化为大顶堆
	for (let i = Math.floor(arr.length / 2 - 1); i >= 0; i--) {
		// i 为非叶子节点
		shiftDown(arr, i, arr.length);
	}

	// 将栈顶元素与未排序数列最后一个数据交换，交换后需要将剩下数据组成的数调整为大顶堆
	for (let i = arr.length - 1; i > 0; i--) {
		exchange(arr, 0, i);
		shiftDown(arr, 0, i);
	}

	return arr;
}

heapSort([4, 6, 8, 5, 9, 1, 2, 5, 3, 2]);
