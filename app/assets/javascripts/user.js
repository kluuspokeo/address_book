
$(document).ready(function(){
	//new user forms
	$('body').on('click', 'a[href="#"]', function(e){
		var _target = $(e.target);
		switch(e.target.className)
		{
			case "add":
				var _template = $("#"+_target.data('template')).html();
				if (_template) {
					$(_template).insertBefore(this);
				}
				break;
			case "close": //NYI
				_target.parents('div').fadeOut(250, function() {
					this.remove();
				});
				break;
			case "edit":
				var _type = _target.parents('.edit_fields').data('type');
				switch(_type) {
					case "address":
					case "phone_number":
					case "email_address":
						var _inputs = $('input', _target.parents('.edit_fields')),
							_params = {},
						_inputs.each(function(i,el){
							_params[el.className] = el.value;
						});
						
						break
				}

				console.log(_params);
				break;
			case "delete":
				var _type = _target.data('type'),
					_id = _target.data('id');
				switch (_type) {
					case "phone_number":
					case "address":
					case "email_address":
					if(confirm("Are you sure?")) {
						$.ajax({
							"url": "/"+_type+"/"+_id,
							"method": "DELETE",
							"success": function(d){
								_target.parents('.'+_type).fadeOut(250);
							},
							"error": function(d) {
								alert('error occured. try again later');
							}
						});
					}
					break;
				}
				
		}
		e.preventDefault();
	});
});