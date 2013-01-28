(function($){

	var methods={
		init:function(options)
		{
			if (!options) { options={}; }
			def={
				'content':{},
				'result':
				{
					'key':''
				}
			};
			$.extend(true,def,options);
			return this.each(function(){
				$(this).data('sn',def);
				$(this).snTriggers();
				$(this).snEvents({'href':'#autoload'});
			});
		}
	};		

	$.fn.sn=function(sn){
		if (!sn) { sn={}; }
		if ( methods[sn]) {
			return methods[sn].apply(this,Array.prototype.slice.call(arguments,1));
		} else if (typeof sn==='object' || !sn) {
			return methods.init.apply(this,arguments);
		} else {
			$.error('Метод '+sn+' не существует');
		}    
		
	};		
})(jQuery);
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
(function($){

	var methods={
		init:function(options)
		{
			return this.each(function(){
				$(this).snConf('main');
			});
		},
		main:function()
		{
			var sn=$(this).data('sn');
			$.ajax({
				url:'sn-project/settings/main.json',
				async:false,
				dataType:"json",
				success:function(s){
					$.extend(true,sn,s);
					$(this).data('sn',sn);
				}
			});
		}
	};

	$.fn.snConf=function(sn){
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
(function($){
	var methods={
		init:function(options)
		{
			return this.each(function(){
				var def={
					'href':"none"
				};
				$.extend(true,def,options);
				var th=$(this);
				var sn=$(this).data('sn');
				var href=def.href;
				switch (href.replace(/(.*)#(.*)/,"$2")){
					case "autoload":
					break;
					case "signin":
						$("#signin-error").hide();
						$("#signin-info").show();
						$(this).snAjax('sendRequest',{'action':'signin','debug':false});
					break;
					case "afterSignin":
						$("#signin-info").hide();
						if (sn.result) {
							if (sn.result.response) {
								if (sn.result.monitor) {
									$("#monitor").html(sn.result.monitor);
								}
/*								if (sn.result.pagination) {
									$("#pagination").html(sn.result.pagination);
									$(this).snTriggers('pagination');
								}
*/
								$("#signin").empty();
							} else {
								$("#inputLogin").val('');
								$("#inputPassword").val('');
								$("#signin-error").show();
							}
						}
					break;
/*					case "submit":
						$(this).snAjax('sendRequest',{'action':'submit','debug':false});
					break;
					case "afterSubmit":
						if (sn.result) {
							if (sn.result.table) {
								$("#table").html(sn.result.table);
								$(this).snTriggers('sort');
								$(this).snTriggers('detail');
								$(this).snPlayer('onClickPlay');
							}
						}
					break;
*/
					case "close":
						$(this).hide();
					break;
				}
			});
		}
	};

	$.fn.snEvents=function(sn){
		if (!sn) { sn={}; }
		if ( methods[sn]) {
			return methods[sn].apply(this,Array.prototype.slice.call(arguments,1));
		} else if (typeof sn==='object' || !sn) {
			return methods.init.apply(this,arguments);
		} else {
			$.error('Метод '+sn+' не существует');
		}		
	};		
})(jQuery);
(function($){

	var methods={
		init:function(options)
		{
/*			if ($("#monitor").html()!=="")	{
				$(this).snTriggers('monitor');
			}
*/
			if ($("#pagination").html()!=="")	{
				$(this).snTriggers('pagination');
			}
			if ($("#signin").html()!=="")	{
				$(this).snTriggers('signin');
			}
		},
		signin:function()
		{
			th=$(this);
			$("#fSignin").on("submit",function(e){
				e.preventDefault();
				th.snEvents({'href':'#signin'});
			});
		},
		pagination:function()
		{
			th=$(this);
			$("a#prev").on("click",function(e){
				e.preventDefault();
				$("#page").val(($("#page").val()*1)-1);
				th.snAjax('sendRequest',{'action':'signin','debug':false});
			});
			$("a.list").on("click",function(e){
				e.preventDefault();
				$("#page").val($(this).data("page"));
				th.snAjax('sendRequest',{'action':'signin','debug':false});
			});
			$("a#next").on("click",function(e){
				e.preventDefault();
				$("#page").val(($("#page").val()*1)+1);
				th.snAjax('sendRequest',{'action':'signin','debug':false});
			});
		}
	};

	$.fn.snTriggers=function(sn){
		if (!sn) { sn={}; }
		if ( methods[sn]) {
			return methods[sn].apply(this,Array.prototype.slice.call(arguments,1));
		} else if (typeof sn==='object' || !sn) {
			return methods.init.apply(this,arguments);
		} else {
			$.error('Метод '+sn+' не существует');
		}
		
	};
})(jQuery);
