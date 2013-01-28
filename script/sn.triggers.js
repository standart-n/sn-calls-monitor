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
