/**
 * 【求解连续数列】
 * 已知连续正整数数列{K}=K1,K2,K3...Ki的各个数相加之和为S，i=N (0<S<100000, 0<N<100000), 求此数列K。
 * 
 * 输⼊描述：
 * 输⼊包含两个参数，1）连续正整数数列和S，2）数列⾥数的个数N。
 * 
 * 输出描述：
 * 如果有解输出数列K，如果⽆解输出-1
 * 
 * 示例1:
 * 输入：525 6
 * 输出：85 86 87 88 89 90
 */

// 结果数列为等差数列
// 等差数列的求和公式为: Sum = n(a1+an)/2
// an = a1 + (n - 1)d
// 推导 a1 : a1 = 2 * Sum / n - an
// a1 = 2 * Sum / n - a1 - nd + d
// a1 = 2 * Sum / n - a1 - n + 1
// 2 * a1 = 2 * Sum / n - n + 1
// a1 = (2 * Sum / n - n + 1) / 2
// 因为待求数列为连续正整数数列, 所以 d = 1
// 因为 a1 为正整数,
// 所以, 仅当 2 * Sum / n - n 为奇数时, 满足条件的连续正整数序列才存在
function findContinousSequence(str) {
	let arr = str.split(' ');
	let [sum, n] = [Number(arr[0]), Number(arr[1])];
	// 仅当 2 * Sum / n - n 为奇数时, 满足条件的连续正整数序列才存在
	if ((2 * sum / n - n) % 2 === 1) {
		let startNum = (2 * sum / n - n + 1) / 2;
		let result = `${startNum}`;
		for (let i = 1; i < n; i++) {
			result += ` ${startNum + i}`;
		}
		return result;
	} else {
		return -1;
	}
}

console.log(findContinousSequence('525 6'));
console.log(findContinousSequence('722 6'));
console.log(findContinousSequence('722 1'));
console.log(findContinousSequence('722 2'));