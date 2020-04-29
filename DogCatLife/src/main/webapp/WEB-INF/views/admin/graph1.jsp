<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="../../code/highcharts.js"></script>
<script src="../../code/modules/series-label.js"></script>
<script src="../../code/modules/exporting.js"></script>
<script src="../../code/modules/export-data.js"></script>
<script src="../../code/modules/accessibility.js"></script>

<!--[if lt IE 9]>
<script src="https://code.highcharts.com/modules/oldie-polyfills.js"></script>
<![endif]-->  
<script src="https://code.highcharts.com/highcharts.js"></script>
<!--[if lt IE 9]>
<script src="https://code.highcharts.com/modules/oldie.js"></script>
<![endif]-->

<figure class="highcharts-figure">
    <div id="container1"></div>
</figure>

<script type="text/javascript">
	Highcharts.chart('container1', {
		chart: {
			height:270,
			width:600,
			type:'line'
		},
		
	    title: {
	        text: ''
	    },
	
	    /* subtitle: {
	        text: '부제목'
	    }, */

	    // y축 제목, 단위 설정, 배경
	     yAxis: {
	        title: {
	            text: ''
	        },
	        labels: {
	        	formatter: function() {
	        		return this.value + ' 개';
	        	}
	        },
	        gridLineWidth: 1
	    },
	    /* yAxis: [{
	    	title: {
	            text: ''
	        },
	        labels: {
	        	formatter: function() {
	        		return this.value;
	        	}
	        },
	        gridLineWidth: 1
	    }, {
	        title: {
	            text: '댓글 수'
	        },
	        labels: {
	        	formatter: function() {
	        		return '댓글 : ' + this.value + ' 개';
	        	}
	        },
	        gridLineWidth: 1,
	        opposite: true
	    }], */
	    
	
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
	            pointStart: Date.UTC(new Date().getFullYear(), new Date().getMonth(), new Date().getDate() - 6), // 시작일
	            pointIntervalUnit: 'day' // 하루단위
	        }
	    },
	
	    series: [{
	    	/* yAxis: 0, */
	        name: '글',
	        data: [<%=contentscountlist.get(0)%>, <%=contentscountlist.get(1)%>, <%=contentscountlist.get(2)%>, <%=contentscountlist.get(3)%>, <%=contentscountlist.get(4)%>, <%=contentscountlist.get(5)%>, <%=contentscountlist.get(6)%>]
	    }, {
	    	/* yAxis: 1, */
	        name: '댓글',
	        data: [<%=commentscountlist.get(0)%>, <%=commentscountlist.get(1)%>, <%=commentscountlist.get(2)%>, <%=commentscountlist.get(3)%>, <%=commentscountlist.get(4)%>, <%=commentscountlist.get(5)%>, <%=commentscountlist.get(6)%>]
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
