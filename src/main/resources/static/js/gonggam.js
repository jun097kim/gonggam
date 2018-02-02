Handlebars.registerHelper('oneBased', function(number) {
	return number + 1;
});

Handlebars.registerHelper('formatDate', function(dateStr) {
	if (dateStr == null) { return; }
	const now = new Date(dateStr);
	
	const year = now.getFullYear();
	const month = ('0' + (now.getMonth() + 1)).slice(-2);
	const date = ('0' + (now.getDate() + 1)).slice(-2);
	const hours = ('0' + now.getHours()).slice(-2);
	const minutes = ('0' + now.getMinutes()).slice(-2);
	
	return year + '.' + month + '.' + date + '. '
		+ hours + ':' + minutes;
});

const replaceData = function (arr, $target, $template) {
	const template = Handlebars.compile($template.html());
	$target.html(template(arr));
}
