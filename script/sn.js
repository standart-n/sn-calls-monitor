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
