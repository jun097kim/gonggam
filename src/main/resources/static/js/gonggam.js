Handlebars.registerHelper('oneBased', function(number) {
	return number + 1;
});

Handlebars.registerHelper('formatDate', function(dateStr) {
	if (dateStr == null) { return; }
	var now = new Date(dateStr);
	
	var year = now.getFullYear();
	var month = ('0' + (now.getMonth() + 1)).slice(-2);
	var date = ('0' + (now.getDate() + 1)).slice(-2);
	var hours = ('0' + now.getHours()).slice(-2);
	var minutes = ('0' + now.getMinutes()).slice(-2);
	
	return year + '.' + month + '.' + date + '. '
		+ hours + ':' + minutes;
});

function replaceData(arr, $target, $template) {
	var template = Handlebars.compile($template.html());
	$target.html(template(arr));
}

function initModal($modal) {
	$modal.find('input').each(function() {
		$(this).val('');
	});
}