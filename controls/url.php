<?php class url extends sn {
	
public static $key;
public static $action;
public static $callback;
public static $page;
public static $id;
public static $message;
public static $login;
public static $password;


function __construct() {

	if (isset($_REQUEST["key"])) {
		self::$key=trim(strval($_REQUEST["key"]));
	}

	if (isset($_REQUEST["page"])) {
		self::$page=trim(strval($_REQUEST["page"]));
	}
	if (isset($_REQUEST["action"])) {
		self::$action=trim(strval($_REQUEST["action"]));
	}
	if (isset($_REQUEST["callback"])) {
		self::$callback=trim(strval($_REQUEST["callback"]));
	}
	if (isset($_REQUEST["login"])) {
		self::$login=strtolower(trim(strval($_REQUEST["login"])));
	}
	if (isset($_REQUEST["password"])) {
		self::$password=trim(strval($_REQUEST["password"]));
	}

	if (isset($_REQUEST["id"])) {
		self::$id=trim(intval($_REQUEST["id"]));
	}
	if (isset($_REQUEST["message"])) {
		self::$message=trim(strval($_REQUEST["message"]));
	}
	
}


} ?>
