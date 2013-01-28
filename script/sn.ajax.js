(function($){

	var methods={
		init:function(options)
		{
			return this.each(function(){

			});
		},
		sendRequest:function(options)
		{
			if (!options) { options={}; }
			var def={
				'type':'json',
				'debug':false,
				'action':'submit',
				'login':$('#inputLogin').val(),
				'password':$('#inputPassword').val(),
				'page':$('#page').val(),
				'id':'',
				'message':''
			};
			$.extend(true,def,options);
			if (def.debug) { def.type='text'; }
			var sn=$(this).data('sn');
			$.ajax({
				url:'index.php',
				type:'POST',
				data:{
					action:def.action,
					page:def.page,
					login:def.login,
					password:def.password,
					id:def.id,
					message:def.message,
					key:sn.result.key
				},
				dataType:def.type,
				timeout:10000,
				beforeSend:function(){
					$("#loading").show();
				},
				success:function(s){
					if (typeof s==='object') { 
						$.extend(true,sn.result,s); 
					} else { 
						if (def.debug) { alert(s); }
						sn.result=s;
					}
					$(this).data('sn',sn);
					if (typeof sn.result==='object') {
						if (sn.result.alert) { alert(sn.result.alert); }
						if (sn.result.callback) { $(this).snEvents({'href':'#'+sn.result.callback}); }
					}
					$("#loading").hide();
				},
				error:function(XMLHttpRequest,textStatus,error){ 
					//$("#loading").hide();
					//alert(textStatus);
				}
			});
		}
	};		

	$.fn.snAjax=function(sn){
		if (!sn) { sn={}; }
		if (methods[sn]) {
			return methods[sn].apply(this,Array.prototype.slice.call(arguments,1));
		} else if (typeof sn==='object' || !sn) {
			return methods.init.apply(this,arguments);
		} else {
			$.error('Метод '+sn+' не существует');
		}    
		
	};		
})(jQuery);
