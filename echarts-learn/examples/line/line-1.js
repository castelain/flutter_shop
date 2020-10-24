offsetHeight = 10;
colorsArr = ['rgba(149,204,255,1)', 'rgba(255,219,149,1)', '#95ffe7', '#ff6262'];
xAxisDataArr = ['a','b','c','d','e'];
seriesDataArr = [
    {
        name: 'a',
        value: 1
    },
    {
        name: 'b',
        value: 2
    },
    {
        name: 'c',
        value: 1
    },
    {
        name: 'd',
        value: 2
    },
    {
        name: 'e',
        value: 1
    }
]
tempLegendArr = ['a'];

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
        legend: {
            data: tempLegendArr,
            left: 'center',
            bottom: offsetHeight
        },
        color: ['#fdfeff'],
        xAxis: {
            show: true,
            data: xAxisDataArr,
            axisLabel: {
                inside: false,
                textStyle: {
                    color: '#71b1c5',
                    fontSize: offsetHeight
                },
                /*interval: 0,*/
                /*rotate: 45,*/
                /*formatter: function() {
                    var tempStr = arguments[0];
                    return tempStr.substr(0, 5) + '...';
                },*/
                rich: {}
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
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
            splitLine: {show: true, lineStyle: {type: 'dotted', color: '#ccc', width: '0.1'}},
            axisLabel: {
                textStyle: {
                    color: '#71b1c5',
                    fontSize: offsetHeight
                }
            }
        },
        series: [{
            type: 'line',
            interval: 1,
            smooth: true,
            symbol: 'circle',
            symbolSize:offsetHeight*0.7,
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 1,
                        color: 'rgba(34, 74, 135 , 0)'
                    }, {
                        offset: 0,
                        color: 'rgba(34, 74, 135 , 1)'
                    }])
                },
                
            },
            itemStyle: {
                normal: {
                    shadowColor: '#1a2f71',
                    shadowBlur: offsetHeight,
                },
                emphasis: {
                    shadowColor: '#1a2f71',
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
                    formatter: function() {
                        return arguments[0].name+' - '+arguments[0].value * 100 + '%';
                    },
                    textStyle: {
                        color: '#71b1c5',
                        fontSize: offsetHeight
                    }
                }
            },
            data: seriesDataArr,
            markPoint: {
                data: [
                    {
                        name: '最大值',
                        type: 'max'
                    }, 
                    {
                      type: 'min',
                      name: '最小值',
                    }
                ],
                symbol: 'pin',
                symbolSize: offsetHeight * 2,
                label: {
                    normal: {
                        show: true,
                        position: 'bottom',
                        distance: offsetHeight * 3,
                        color: 'purple'
                    },
                    emphasis: {
                        show: true,
                        position: 'top',
                        distance: offsetHeight * 3,
                        color: 'blue'
                    }

                },
                itemStyle: {
                    color: 'purple'
                }
            },
        }]
    };