function exchange(arr, i, j) {
	[arr[i], arr[j]] = [arr[j], arr[i]];
}

function partition(arr, left, right) {
	let pivot = arr[left];
	let pivotIndex = left;
	if (left >= right) {
		return;
	}
	while (left < right) {
		while (arr[right] > pivot && left < right) {
			right--;
		}
		while (arr[left] <= pivot && left < right) {
			left++;
		}
		if (left < right) {
			exchange(arr, left, right);
		}
	}
	// left === right
	exchange(arr, pivotIndex, left);
	return left;
}

function quickSort(arr, left, right) {
	left = typeof left !== 'number' || Number.isNaN(left) ? 0 : left;
	right = typeof right !== 'number' || Number.isNaN(right) ? arr.length - 1 : right;
	if (left < right) {
		let pivotIndex = partition(arr, left, right);
		quickSort(arr, left, pivotIndex - 1);
		quickSort(arr, pivotIndex + 1, right);
	}
	return arr;
}

quickSort([3, 1, 2]);