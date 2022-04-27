# What is this?

漏洞修复在线评测样例靶机

# How to use?

```
git clone https://github.com/monster414/CTF_FIX_Example
cd CTF_FIX_Example
docker build . -t "CTF_FIX_Example"
```
在CTFd中使用该镜像即可（需要CTFd Whale）

**Frp Redirect Port:22**

# Description about challenge

```
FIX /var/www/html/index.php
{"SSH_Account" : "ctf:123456"}
/check to check
/check.py is payloads and expected response
/flag is flag
```
具体机制看一眼`check.py`就行

# Solve

```php
<?php
	if((preg_match("/[\x{00}-\x{1f}a-zA-Z\x{7b}-\x{ff}]/", $_GET["exp"])) === 0)
	{
		$sum = eval("return ".$_GET["exp"].";");
		echo $sum;
	}
?>
```

# Docker制作参考(魔改)

https://github.com/CTFTraining/qwb_2019_supersqli

https://github.com/ctfhub-team/base_web_httpd_mysql_php_74