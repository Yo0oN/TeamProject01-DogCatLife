<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.highcharts-figure, .highcharts-data-table table {
	    min-width: 360px; 
	    max-width: 800px;
	    margin: 1em auto;
	}
	
	.highcharts-data-table table {
		font-family: Verdana, sans-serif;
		border-collapse: collapse;
		border: 1px solid #EBEBEB;
		margin: 10px auto;
		text-align: center;
		width: 100%;
		max-width: 500px;
	}
	.highcharts-data-table caption {
	    padding: 1em 0;
	    font-size: 1.2em;
	    color: #555;
	}
	.highcharts-data-table th {
		font-weight: 600;
	    padding: 0.5em;
	}
	.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
	    padding: 0.5em;
	}
	.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
	    background: #f8f8f8;
	}
	.highcharts-data-table tr:hover {
	    background: #f1f7ff;
	}

</style>
<script src="https://code.highcharts.com/highcharts.js"> </script>
<script src="resources/chart/code/modules/accessibility.js"></script>
<script src="resources/chart/code/modules/series-label.js"></script>
<script src="resources/chart/code/modules/exporting.js"></script>
<script src="resources/chart/code/modules/export-data.js"></script>

<!--[if lt IE 9]>
<script src="https://code.highcharts.com/modules/oldie-polyfills.js"></script>
<![endif]-->  
<script src="https://code.highcharts.com/highcharts.js"></script>
<!--[if lt IE 9]>
<script src="https://code.highcharts.com/modules/oldie.js"></script>
<![endif]-->
</head>
<body>

<figure class="highcharts-figure">
    <div id="container"></div>
    <p class="highcharts-description">
       	그래프 설명
    </p>
</figure>

<script type="text/javascript">
	Highcharts.chart('container', {
	
	    title: {
	        text: '가입 / 탈퇴 통계'
	    },
	
	    subtitle: {
	        text: '부제목'
	    },

	    // y축 제목, 단위 설정, 배경
	    yAxis: {
	        title: {
	            text: ''
	        },
	        labels: {
	        	formatter: function() {
	        		return this.value + ' 명';
	        		// return this.value + ' %';
	        	}
	        },
	        gridLineWidth: 1
	    },
	
	    xAxis: {
	        accessibility: {
	            //rangeDescription: 'Range: 2010 to 2017'
	        },
	        gridLineWidth: 1,
	        type: 'datetime' // 단위는 날짜
	    },
	
	    legend: {
	        layout: 'vertical',
	        align: 'right',
	        verticalAlign: 'middle'
	    },
	
	    plotOptions: {
	        series: {
	            pointStart: Date.UTC(2020, 4, 19), // 시작일
	            pointIntervalUnit: 'day' // 하루단위
	        }
	    },
	
	    series: [{
	        name: '가입',
	        data: [5, 10, 0, 3, 5, 1, 7]
	    }, {
	        name: '탈퇴',
	        data: [1, 0, 6, 1, 2, 0, 5]
	    } ],
	
	    responsive: {
	        rules: [{
	            condition: {
	                maxWidth: 500
	            },
	            chartOptions: {
	                legend: {
	                    layout: 'horizontal',
	                    align: 'center',
	                    verticalAlign: 'bottom'
	                }
	            }
	        }]
	    }
	
	});
</script>
</body>
</html>