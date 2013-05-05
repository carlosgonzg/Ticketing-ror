$(document).ready(function(){
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data_completed = google.visualization.arrayToDataTable([
          ['Completed', 'Requests'],
          ['Yes',     $('#completed_request_div').data("completed")],
          ['No',      $('#completed_request_div').data("not-completed")]
        ]);

        var options_completed = {
          title: 'Completed Requests'
        };
	
	var data_by_type = google.visualization.arrayToDataTable([
          ['Type', 'Requests'],
          ['Hardware',     $('#request_by_type_div').data("hardware")],
          ['Software',      $('#request_by_type_div').data("software")],
	  ['Network',      $('#request_by_type_div').data("network")],
	  ['Login',      $('#request_by_type_div').data("login")],
	  ['Peripheral',      $('#request_by_type_div').data("peripheral")]
        ]);

        var options_by_type = {
          title: 'Requests By Type'
        };

        var data_urgent = google.visualization.arrayToDataTable([
          ['Urgent', 'Requests'],
          ['Yes',     $('#urgent_request_div').data("urgent")],
          ['No',      $('#urgent_request_div').data("not-urgent")]
        ]);	
	
        var options_urgent = {
          title: 'Requests By Urgency'
        };
	
        var chart_completed = new google.visualization.PieChart(document.getElementById('completed_request_div'));
        chart_completed.draw(data_completed, options_completed);
	
        var chart_by_type = new google.visualization.PieChart(document.getElementById('request_by_type_div'));
        chart_by_type.draw(data_by_type, options_by_type);

        var chart_urgent= new google.visualization.PieChart(document.getElementById('urgent_request_div'));
        chart_urgent.draw(data_urgent, options_urgent);	
      }
});
