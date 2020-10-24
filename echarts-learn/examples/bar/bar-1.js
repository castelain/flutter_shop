offsetHeight=10;
xAxisDataArr=['a', 'b', 'c', 'd', 'e'];
colorsArr = ['rgba(149,204,255,1)', 'rgba(255,219,149,1)', '#95ffe7', '#ff6262'];
dataArr= [
    {
        name: 'a',
        value: 1
    },
    {
        name: 'a',
        value: 2
    },
    {
        name: 'a',
        value: 3
    },
    {
        name: 'a',
        value: 4
    },
    {
        name: 'a',
        value: 5
    },
];

option = {
    grid: {
        bottom: 4 * offsetHeight,
        left: '15%',
        top: 2.5 * offsetHeight,
        right: 2.5 * offsetHeight
    },
    tooltip: {
        trigger: 'item',
        formatter: function () {
            var tempObj = arguments[0];
            return tempObj.name + ':' + tempObj.value
        }
    },
    xAxis: {
        data: xAxisDataArr,
        axisLabel: {
            inside: false,
            textStyle: {
                color: '#71b1c5',
                fontSize: offsetHeight
            },
            // interval: 0,
            // rotate: 45,
            // formatter: function() {
            //     var tempStr = arguments[0];
            //     return tempStr.substr(0, 5) + '...';
            // },
            // rich: {}
        },
        axisTick: {
            show: false
        },
        axisLine: {
            show: true,
            lineStyle: {color: '#71b1c5', width: '0.7'},
        },
        z: 10
    },
    yAxis: {
        show: true,
        min: 0,
        axisLine: {
            show: false,
            lineStyle: {color: '#999'},
        },
        axisTick: {
            show: false,
        },
        splitLine: {show: true, lineStyle: {type: 'dashed', color: '#ccc', width: '0.1'}},
        axisLabel: {
            textStyle: {
                color: '#71b1c5',
                fontSize: offsetHeight
            }
        }
    },
    series: [{
        type: 'bar',
        // itemStyle: {
        //     normal: {color: colorsArr[0]}
        // },
        itemStyle: {
            normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                    {offset: 1, color: '#95ccff'},
                    {offset: 0, color: '#ffffff'}
                ]),
                shadowColor: 'rgba(0,144,255,0.5)',
                shadowBlur: offsetHeight,
            },
            emphasis: {
                // color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                //     {offset: 1, color: '#ffffff'},
                //     {offset: 0, color: '#95ccff'}
                // ]),
                color: {
                  type: 'linear',
                  x: 0,
                  y: 0,
                  x2: 0,
                  y2: 1,
                  colorStops: [
                    {
                        offset: 0,
                        color: '#95ccff'
                    },
                    {
                        offset: 1,
                        color: '#ffffff'
                    }
                  ]
                },
                shadowColor: 'rgba(0,144,255,0.7)',
                shadowBlur: offsetHeight,
            }
        },
        label: {
            normal: {
                show: false,
                position: 'top',
                /*formatter: function() {
                    return arguments[0].value * 100 + '%';
                },*/
                textStyle: {
                    color: '#71b1c5',
                    fontSize: offsetHeight
                }
            },
            emphasis: {
                show: true,
                position: 'top',
                // formatter: function() {
                //     return arguments[0].value * 100 + '%';
                // },
                textStyle: {
                    color: '#71b1c5',
                    fontSize: offsetHeight
                }
            }
        },
        data:dataArr
    }]
};