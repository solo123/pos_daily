function show_diagram(canvas_id, data_id, data_index){
	var label_index  = 1;
  var ctx = $('#' + canvas_id).get(0).getContext("2d");
	var tb = $('#' + data_id + ' table');
	var data_lb = get_table_data(tb, 1);
	var data_dt = get_table_num(tb, data_index+1);
  var data = {
  	labels : data_lb,
	  datasets : [
		{
			fillColor : "rgba(220,220,220,0.5)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
			data : data_dt
		}
	]
  }

	tt = data;
  var options = {};
	new Chart(ctx).Bar(data, options);
}

function get_table_data(tb, column_num){
	return tb.find('tbody tr td:nth-child(' + column_num + ')').map(function(){return $(this).text()});
}
function get_table_num(tb, column_num){
	return tb.find('tbody tr td:nth-child(' + column_num + ')').map(function(){return parseFloat($(this).text().replace(/,/g, ''))});
}

