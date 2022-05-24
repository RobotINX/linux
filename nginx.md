# nginx



## 参考资料

```html
https://nginx.org/en/docs/
https://juejin.cn/post/6844904144235413512
https://xuexb.github.io/learn-nginx/guide/
```

## nginx 配置语法

### nginx.conf结构图

```html
main        # 全局配置，对全局生效
├── events  # 配置影响 Nginx 服务器或与用户的网络连接
├── http    # 配置代理，缓存，日志定义等绝大多数功能和第三方模块的配置
│   ├── upstream # 配置后端服务器具体地址，负载均衡配置不可或缺的部分
│   ├── server   # 配置虚拟主机的相关参数，一个 http 块中可以有多个 server 块
│   ├── server
│   │   ├── location  # server 块可以包含多个 location 块，location 指令用于匹配 uri
│   │   ├── location
│   │   └── ...
│   └── ...
└── ...
```

### 语法规则

一个 Nginx 配置文件的结构就像 `nginx.conf` 显示的那样，配置文件的语法规则：

1. 配置文件由指令与指令块构成；
2. 每条指令以 `;` 分号结尾，指令与参数间以空格符号分隔；
3. 指令块以 `{}` 大括号将多条指令组织在一起；
4. `include` 语句允许组合多个配置文件以提升可维护性；
5. 使用 `#` 符号添加注释，提高可读性；
6. 使用 `$` 符号使用变量；
7. 部分指令的参数支持正则表达式；

### 典型配置

```shell
user  nginx;                        # 运行用户，默认即是nginx，可以不进行设置
worker_processes  1;                # Nginx 进程数，一般设置为和 CPU 核数一样
error_log  /var/log/nginx/error.log warn;   # Nginx 的错误日志存放目录
pid        /var/run/nginx.pid;      # Nginx 服务启动时的 pid 存放位置

events {
    use epoll;     # 使用epoll的I/O模型(如果你不知道Nginx该使用哪种轮询方法，会自动选择一个最适合你操作系统的)
    worker_connections 1024;   # 每个进程允许最大并发数
}

http {   # 配置使用最频繁的部分，代理、缓存、日志定义等绝大多数功能和第三方模块的配置都在这里设置
    # 设置日志模式
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;   # Nginx访问日志存放位置

    sendfile            on;   # 开启高效传输模式
    tcp_nopush          on;   # 减少网络报文段的数量
    tcp_nodelay         on;
    keepalive_timeout   65;   # 保持连接的时间，也叫超时时间，单位秒
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;      # 文件扩展名与类型映射表
    default_type        application/octet-stream;   # 默认文件类型

    include /etc/nginx/conf.d/*.conf;   # 加载子配置项
    
    server {
    	listen       80;       # 配置监听的端口
    	server_name  localhost;    # 配置的域名
    	
    	location / {
    		root   /usr/share/nginx/html;  # 网站根目录
    		index  index.html index.htm;   # 默认首页文件
    		deny 172.168.22.11;   # 禁止访问的ip地址，可以为all
    		allow 172.168.33.44； # 允许访问的ip地址，可以为all
    	}
    	
    	error_page 500 502 503 504 /50x.html;  # 默认50x对应的访问页面
    	error_page 400 404 error.html;   # 同上
    }
}
```

### 关于URI语法

server 块可以包含多个 location 块，location 指令用于匹配 uri，语法：

```shell
location [ = | ~ | ~* | ^~] uri {
	...
}
```

指令后面：

1. `=` 精确匹配路径，用于不含正则表达式的 uri 前，如果匹配成功，不再进行后续的查找；
2. `^~` 用于不含正则表达式的 uri； 前，表示如果该符号后面的字符是最佳匹配，采用该规则，不再进行后续的查找；
3. `~` 表示用该符号后面的正则去匹配路径，区分大小写；
4. `~*` 表示用该符号后面的正则去匹配路径，不区分大小写。跟 `~` 优先级都比较低，如有多个location的正则能匹配的话，则使用正则表达式最长的那个；

如果 uri 包含正则表达式，则必须要有 `~` 或 `~*` 标志。

## nginx内置变量

```shell
    # argument name in the request line. 
    # 请求URL中的参数名称。
    $arg_name 
    
    # arguments in the request line. 
    # 请求URL中包含的参数。
    $args 

    # 二进制形式的客户端地址，ipv4通常是4比特长度，ipv6通常为16比特长度。
    $binary_remote_addr 
    
    # 发送给客户端的不包含响应头的字节数；这个变量兼容Apache的mod_log_config模块的“%B”参数。
    $body_bytes_sent 
    
    # number of bytes sent to a client(1.3.8,1.2.5). 
    # 发送给客户端的字节数。
    $bytes_sent 

    # connection serial number(1.3.8,1.2.5). 
    # 连接序列号。
    $connection 
    
    # current number of requests made through a connection(1.3.8,1.2.5). 
    # 当前通过连接发出的请求数。
    $connection_requests 
    
    # “Content-Length” request header field. 
    # 请求头中的Content-Length字段。
    $content_length 
    
    # “Content-Type” request header field. 
    # 请求头中的Content-Type字段。
    $content_type 
    
    # the name cookie. 
    # cookie的名称。
    $cookie_name 
    
    # root or alias directive’s value for the current request. 
    # 当前请求的根目录或别名的值。
    $document_root 
   
    # same as $uri. 
    # 与$uri全局变量相同。
    $document_uri 
    
    # in this order of precedence:host name from the request line, or host name from the “Host” request header field, or the server name matching a request. 
    # 请求URL中的主机名字段，或请求头中的Host字段，或匹配请求的server_name（nginx配置）。
    $host 
    
    # host name. 
    # 主机名称。
    $hostname 
    
    # arbitrary request header field; the last part of a variable name is the field name converted to lower case with dashes replaced by underscores. 
    # 任意请求头字段；变量名的最后一部份是转换为小写的字段名，通过下划线相连。
    $http_name 
    
    # “on” if connection operates in ssl mode, or an empty string otherwise. 
    # 如果是https请求方式则值为on，否则为空字符串。
    $https 
    
    # http请求信息里的HEADER字段。
    $http_HEADER 
    
    # 与$host相同，但如果请求信息中没有Host行，则可能不同。
    $http_host 
    
    # 客户端的cookie信息。
    $http_cookie 
    
    # 引用地址。
    $http_referer 
    
    # 客户端代理信息。
    $http_user_agent 
    
    # 最后一个访问服务器的IP地址。
    $http_via 
    
    # 相当于网络访问路径。
    $http_x_forwarded_for 
    
    # “?” if a request line has arguments, or an empty string otherwise. 
    # 如果URL包含参数则为？，否则为空字符串。
    $is_args 
    
    # setting this variable enables response rate limiting. 
    # nginx配置中的limit_rate配置项的值，影响响应速度限制。
    $limit_rate 
    
    # current time in seconds with the milliseconds resolution(1.3.9,1.2.6) 
    # 当前时间，单位为毫秒。
    $msec 
    
    # nginx version.
    $nginx_version 
    
    # PID of the worker process. 
    # 工作进程的PID。
    $pid 
    
    # “p” if request was pipelined, “.” otherwise(1.3.12,1.2.7).
    $pipe 
    
    # 来自代理协议头的客户端地址，否则为空字符串。 
    # proxy_protocol在nginx配置listen参数时设定。
    $proxy_protocol_addr 
    
    # client port from the PROXY protocol header, or an empty string otherwise(1.11.0). 
    # 来自代理协议头的客户端端口，其它与$proxy_protocol_addr相同。
    $proxy_protocol_port 
    
    #  same as $args.
    $query_string 
   
    # 对应于当前请求的根目录或别名值的绝对路径名，所有符号连接都解析为真实路径。
    $realpath_root 
    
    # client address. 
    # 客户端地址。
    $remote_addr 
    
    # client port. 
    # 客户端端口。
    $remote_port 
    
    # user name supplied with the Basic authentication. 
    # 用于基本验证的用户名。
    $remote_user 
    
    # full original request line. 
    # 完整的原始请求URL。
    $request 
    
    # request body. 
    # 请求体，当proxy_pass,fastcgi_pass,uwsgi_pass和scgi_pass指令将请求体读入缓存中时此变量值可用。
    $request_body 
    
    # name of a temporary file with the request body. 
    # 请求主体的临时文件的名称。
    $request_body_file 
    
    # “OK” if a request has completed, or an empty string otherwise. 
    # 如果请求完成则值为OK，否则为空字符串。
    $request_completion 
    
    # file path for the current request, based on the root or alias directives, and the request URI. 
    # 当前请求的文件路径，基于根目录或别名指令，以及请求URI。
    $request_filename 
    
    # unique request identifier generated from 16 random bytes, in hexadecimal(1.11.0). 
    # 16位随机字节生成的唯一标识符。
    $request_id 
    
    # request length (including request line, header, and request body)(1.3.12,1.2.7). 
    # 请求长度，包含请求行，请求头，以及请求的消息体。
    $request_length 
    
    # request method, usually “GET” or “POST”. 
    # 请求方法，通常为GET或POST。
    $request_method 
    
    # 以毫秒为单位的请求处理时间；从客户端读取第1个字节之后的时间。
    $request_time 
   
    # full original request URI (with arguments). 
    # 完整的原始请求URI（带有参数）。
    $request_uri 
    
    # request scheme, “http” or “https”. 
    # 请求方案，http或https。
    $scheme 
    
    # 任意的响应头字段；变量名的最后一部份是转换为小写的字段名，通过下划线相连。
    $sent_http_name 
    
    # 响应结束时发送的任意字段；变量名的最后一部份是转换为小写的字段名，通过下划线相连。
    $send_trailer_name 
    
    # 响应请求的服务器地址。
    $server_addr 
    
    # 响应请求的服务器名称。
    $server_name 
    
    # 响应请求的服务器端口。
    $server_port 
    
    $server_protocol 
    
    # response status(1.3.2,1.2.2) 
    # 响应状态。
    $status 
    
    # 客户端TCP连接的相关信息，在支持TCP_INFO套接字选项的系统上可用。
    $tcpinfo_rtt 
    $tcpinfo_rttvar 
    $tcpinfo_snd_cwnd 
    $tcpinfo_rcv_space 
    
    # local time in the ISO 8601 standard format(1.3.12,1.2.7). 
    # ISO 8601标准格式下的本地时间。
    $time_iso8601 
    
    # local time in the Common Log Format(1.3.12,1.2.7). 
    # 通用日志格式的本地时间。
    $time_local 
    
    # 当前请求的URI。
    $uri 
```

## 配置实例

```html
https://xuexb.github.io/learn-nginx/example/
```

