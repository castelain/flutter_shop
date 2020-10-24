/** 
 * 【计算堆栈中的剩余数字】
向⼀个空栈中依次存⼊正整数， 假设⼊栈元素n(1<=n<=2^31-1)按顺序依次为nx...n4、n3、n2、n1,
每当元素⼊栈时，如果n1=n2+...+ny(y的范围
[2,x]，1<=x<=1000)，则n1~ny全部元素出栈，重新⼊栈新元素m(m=2*n1)。
如：依次向栈存⼊6、1、2、3, 当存⼊6、1、2时，栈底⾄栈顶依次为[6、1、2]；
当存⼊3时，3=2+1，3、2、1全部出栈，重新⼊栈元素6(6=2*3)，此时栈中有元素6；
因为6=6，所以两个6全部出栈，存⼊12，最终栈中只剩⼀个元素12。
 * 
 * 输⼊描述：
 * 使⽤单个空格隔开的正整数的字符串，如"5 6 7 8"， 左边的数字先⼊栈，输⼊的正整数个数为x，1<=x<=1000。
 * 
 * 输出描述：
 * 最终栈中存留的元素值，元素值使⽤空格隔开，如"8 7 6 5"， 栈顶数字在左边。
 * 
 * 示例1：
 * 输入：5 10 20 50 85 1
 * 输出：1 170
 * 
*/

function findRestNumbers(str) {
	let arr = str.split(' ');
	let stack = [];
	for (let i = 0; i < arr.length; i++) {
		let n1 = Number(arr[i]);
		stack = checkStack(stack, n1);
	}
	return stack.reverse().join(' ');
}

function checkStack(stack, num) {
	let hasEqualSum = false;
	if (stack.length === 0) {
		stack.push(num);
	} else {
		let sum = 0;
		for (let j = stack.length - 1; j >= 0 && sum < num; j--) {
			sum += stack[j];
			if (sum === num) {
				stack.splice(j);
				hasEqualSum = true;
				break;
			}
		}
		hasEqualSum ? checkStack(stack, num * 2) : stack.push(num);
	}
	return stack;
}

console.log(findRestNumbers('5 10 20 50 85 1'));
console.log(findRestNumbers('6 3 2 1 6'));
console.log(findRestNumbers('6 3 2 1'));
console.log(findRestNumbers('6 1 2 3'));
