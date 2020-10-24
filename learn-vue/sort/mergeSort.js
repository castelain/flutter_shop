// 归并排序
// 归并排序是建立在归并操作上的一种有效的排序算法。
// 该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。
// 将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。
// 若将两个有序表合并成一个有序表，称为2-路归并。 

function merge(left, right) {
	let result = [];
	while (left.length > 0 && right.length > 0) {
		if (left[0] <= right[0]) {
			result.push(left.shift());
		} else {
			result.push(right.shift());
		}
	}
	return result.concat(left, right);
}

function mergeSort(arr) {
	if (arr.length <= 1) {
		return arr;
	}
	let middleIndex = Math.floor(arr.length / 2);
	return merge(mergeSort(arr.slice(0, middleIndex)), mergeSort(arr.slice(middleIndex)));
}

mergeSort([3, 1, 6, 5, 7]);