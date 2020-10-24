oderInTimeNums = [77];
totalOrdersNums = [100];
offsetHeight = 10;

option = {
	tooltip: {
		formatter: "{a} <br/>{b}:{c} <br/>总订单数:" + totalOrdersNums
	},
	animation: true,
	series: [{
		name: '准时订单',
		type: 'gauge',
		min: 0,
		max: totalOrdersNums,
		startAngle: 200,
		endAngle: -20,
		splitNumber: 5,
		radius: '90%',
		axisLine: {
			lineStyle: { // 属性lineStyle控制线条样式
				color: [
					[0.2, '#9dffff'],
					[0.8, '#9dffff'],
					[1, '#9dffff']
				],
				//color: [[0.09, 'lime'],[0.82, '#1e90ff'],[1, '#ff4500']],
				width: offsetHeight,
				shadowColor: '#9dffff',
				shadowBlur: 4 * offsetHeight,

			}
		},
		axisLabel: { // 坐标轴刻度数字
			distance: offsetHeight * 2,
			textStyle: { // 属性lineStyle控制线条样式
				fontWeight: 'bolder',
				color: '#fff',
				shadowColor: '#fff', //默认透明
				shadowBlur: offsetHeight
			}
		},
		axisTick: { // 坐标轴刻度分隔线
			length: offsetHeight * 1.25, // 属性length控制线长
			lineStyle: { // 属性lineStyle控制线条样式
				color: 'auto',
				shadowColor: '#fff', //默认透明
				shadowBlur: offsetHeight
			}
		},
		splitLine: { // 分隔线
			length: offsetHeight * 2, // 属性length控制线长
			lineStyle: { // 属性lineStyle（详见lineStyle）控制线条样式
				width: offsetHeight * .25,
				color: '#fff',
				shadowColor: '#fff', //默认透明
				shadowBlur: offsetHeight
			}
		},
		pointer: { // 指针
			shadowColor: '#fff', //默认透明
			shadowBlur: offsetHeight * 0.5,
		},
		title: {
			offsetCenter: [0, '70%'],
			borderWidth: 1,
			borderColor: '#3d4b6e',
			shadowColor: '#3d4b6e', //默认透明
			shadowBlur: offsetHeight * 0.5,
			width: offsetHeight * 16.67,
			height: offsetHeight * 2.5,
			borderRadius: offsetHeight * 1.25,
			textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				fontWeight: 'bolder',
				fontSize: offsetHeight,
				color: '#fff',
				lineHeight: 2.5 * offsetHeight,
				shadowColor: '#fff', //默认透明
				shadowBlur: offsetHeight,
				textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
					fontWeight: 'bolder',
					color: '#6dc5ce'
				},
				rich: {}
			}

		},
		detail: {
			backgroundColor: 'transparent',
			offsetCenter: [0, '40%'], // x, y，单位px
			textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
				fontWeight: 'bolder',
				fontSize: offsetHeight * 1.25,
				color: '#6dc5ce'
			},
			formatter: function () {
				return 'Hello world!'
			},
			rich: {}
		},
		data: [{ value: oderInTimeNums, name: '准时订单' }]
	}]
};