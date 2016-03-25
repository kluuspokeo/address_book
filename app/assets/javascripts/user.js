$(document).ready(function(){
	//new user forms
	$('a', '.new_user_form').on('click', function(e){
		switch(e.target.className)
		{
			case "add":
				if (_template = $("#"+$(e.target).data('template')).html()) {
					$(_template).insertBefore(this);
				}
				e.preventDefault();
				break;
			case "close": //NYI
				$(e.target).parentsUntil('div').remove();
				e.preventDefault();
				break;
		}
	});
});