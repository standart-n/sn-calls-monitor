<?php class app extends sn {

public static $asterisk;
public static $peersStatus;
public static $phone;
public static $search;
public static $src;
public static $dst;
public static $prev;
public static $next;
public static $skip;
public static $page;
public static $pages;
public static $limit;
public static $records;
public static $id;
public static $message;

public static $server;
public static $port;
public static $login;
public static $password;

function __construct() {
	self::$server='127.0.0.1';
	self::$port='5038';
	self::$login='admin';
	self::$password='';
	self::$id=0;
	self::$message='';
	self::$prev=false;
	self::$next=false;
	self::$skip=0;
	self::$page=1;
	self::$limit=20;
}

public static function data($p="",$f="") {
	$p=project."/settings/asterisk.json";
	if (file_exists($p)) { $f=file_get_contents($p); }	
	if ($f!="") { 
		$j=json_decode($f);
		if (isset($j->connection)) {
			if ((isset($j->connection->server)) && (isset($j->connection->port))) {
				if ((isset($j->connection->login)) && (isset($j->connection->password))) {
					if (($j->connection->server!='') && ($j->connection->port!='')) {
						if (($j->connection->login!='') && ($j->connection->password!='')) {
							self::$server=$j->connection->server;
							self::$port=$j->connection->port;
							self::$login=$j->connection->login;
							self::$password=$j->connection->password;
							return true;
						}
					}
				}
			}
		}
	}
	return false;
}

public static function pears() {
	if (self::data()) {
		require project.'/external/AsteriskManager.php';
		self::$asterisk = new Net_AsteriskManager(array('server'=>self::$server,'port'=>self::$port));
		try {
			self::$asterisk->connect();
		} catch (PEAR_Exception $e) {
			echo $e;
		}
		try {
			self::$asterisk->login(self::$login,self::$password);
		} catch(PEAR_Exception $e) {
			echo $e;
		}
		try {
			self::$peersStatus=self::$asterisk->getSipPeers();
		}  catch (PEAR_Exception $e) {
			echo $e;
		}
		if (isset(self::$peersStatus)) { return true; }
	}
	return false;
}

public static function monitor($ms=array(),$i=-1) {
	if (isset(self::$peersStatus)) {
		foreach (explode("\r\n\r\n",self::$peersStatus) as $line) { $i++;
			foreach (array("phone","type","status","ip","user","profile","profile_id") as $key) {
			  $ms[$i][$key]="-";
			}
			foreach (explode("\r\n",$line) as $str) {
				$v=explode(":",$str);
				if (isset($v[0])) { $var=$v[0]; } else { $var=""; }
				if (isset($v[1])) { $val=trim($v[1]); } else { $val=""; }
				switch ($var) {
					case "ObjectName":
						if (preg_match('/^([0-9]+)$/i',$val)) {
							$val=preg_replace('/^([0-9]+)$/i','$1',$val);
							$ms[$i]['phone_color']='info';
						} else {
							$ms[$i]['phone_color']='';
						}
						$ms[$i]['phone']=$val;
						self::$phone=$val;
					break;
					case "Channeltype":
						$ms[$i]['type']=$val;
					break;
					case "Status":
						if (preg_match('/^OK \(([0-9]+) ms\)$/i',$val)) {
							$val=preg_replace('/^OK \(([0-9]+) ms\)$/i','$1 ms',$val);
							$ms[$i]['status_color']='success';
						} else {
							$ms[$i]['status_color']='important';
						}
						$ms[$i]['status']=$val;
					break;
					case "IPaddress":
						$ms[$i]['ip']=$val;
					break;
				}
			}

			if (isset(self::$phone)) { 
				if ((self::$phone!="") && (self::$phone!="-")) {
					if (query(sql::comp(),$mr)) {
						foreach ($mr as $r) {
							if (isset($r->USER_ID)) {
								$ms[$i]['user']=toUTF($r->SUSER);
								$ms[$i]['profile']=toUTF($r->SPROFILE);
								$ms[$i]['profile_id']=toUTF($r->PROFILE_ID);
							}
						}
					}
				}
			}
			self::$phone='-';
		}
	}
	if (sizeof($ms)>0) { return $ms; }
	print_r($ms);
	return false;
}

} ?>