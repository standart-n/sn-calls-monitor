<?php class sql extends sn {
	
public static $request;

function __construct() {

}

public static function comp($s="") {
	$s.="SELECT * FROM VW_USER_COMP WHERE (PHONE='".app::$phone."') AND (TRUNC_DATE=current_date) ORDER by TRUNC_DATE DESC";
	self::$request=$s;
	return $s;
}

} ?>
