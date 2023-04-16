 把文件下载生成镜像 docker build -t ax2009live/postfix:v1.0 .
 
用法请请参考 https://github.com/catatnight/docker-postfix

跟 catatnight/docker-postfix 对比，修改如下
<pre>
/etc/postfix/main.cf 
增加 message_size_limit = 51200000      邮件大小 10M 限制修改为 50M；
增加 smtp_tls_security_level = may      postfix与外部邮件服务器连接时使用tls，
</pre>

<pre>
在 Postfix 上做 SMTP 中继，并隐藏原邮件服务器的信息
/etc/postfix/main.cf   增加 header_checks = regexp:/etc/postfix/header_checks
/etc/postfix/header_checks 添加 “ /^Received:/ IGNORE ” 
隐藏下图蓝色框内的信息</pre>

![image](https://user-images.githubusercontent.com/41521020/232178581-8c41553a-bf8b-42ec-9b73-e7c0bbcafcbd.png)


