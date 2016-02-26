$(function(){
	setInterval(function(){
		$("#dynamic").html("<%= j render ('devices', device: @devices_log) %>");
	}, 500);
});