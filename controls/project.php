<?php class project extends sn {

function __construct() {
	session_start();
}

public static function engine() {
	if (signin::check()) {
		load("index.tpl");
		if (app::pears()) {
			assign('monitor',app::monitor());
			innerHTML("#monitor",fetch("monitor.tpl"));
		}
		echo html();
	} else {
		load("index.tpl");
		innerHTML("#signin",fetch("signin.tpl"));
		//echo sql::$request;
		echo html();
	}
}	

public static function signin($j=array()) {
	if (signin::check()) {
		if (app::pears()) {
			assign('monitor',app::monitor());
			$j['monitor']=fetch("monitor.tpl");
		}
		$j['response']=true;
	} else {
		$j['response']=false;
	}
	$j['callback']="afterSignin";
	return $j;
}

} ?>
