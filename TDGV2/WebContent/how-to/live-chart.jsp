<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../WEB-INF/pages/template.jsp">
	<jsp:param value="Dynamic / Live Chart" name="pageTitle"/>
	<jsp:param value="<div id='chartContainer'/>" name="content"/> 	
</jsp:include>

<script type="text/javascript">

   $(function () {
       //var dps = [{ x: 1, y: 10 }, { x: 2, y: 13 }, { x: 3, y: 18 }, { x: 4, y: 20 }, { x: 5, y: 17 }, { x: 6, y: 10 }, { x: 7, y: 13 }, { x: 8, y: 18 }, { x: 9, y: 20 }, { x: 10, y: 17 }];   //dataPoints.
var dps = [];
       var chart = new CanvasJS.Chart("chartContainer", {
           title: {
               text: "Dynamic / Live Chart"
           },
           data: [{
               type: "line",
               dataPoints: dps
           }]
       });

       chart.render();

       var xVal = dps.length + 1;
       var yVal = 15;
       var updateInterval = 500;

       var updateChart = function () {
           yVal = yVal + Math.round(5 + Math.random() * (-5 - 5));
           //alert(yVal);
           dps.push({ x: xVal, y: yVal });
           xVal++;

           chart.render();
       };
       setInterval(function () { updateChart() }, updateInterval);
   });
</script>