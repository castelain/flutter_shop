function clearArray(arr) {
	if (arr.length <= 0) {
			return;
	}
	// return [...new Set(arr)];

	// arr.sort();
	// let result = [arr[0]];
	// for (let i = 0; i < arr.length - 1; i++) {
	//     if (arr[i] !== arr[i + 1]) {
	//         result.push(arr[i + 1]);
	//     }
	// }
	// return result;

	let result = [];
	for (let i = 0; i < arr.length; i++) {
			if (result.indexOf(arr[i]) === -1) {
					result.push(arr[i]);
			}
	}
	return result;
}