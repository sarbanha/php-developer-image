server {
        listen *:80;
        server_name <DOMAIN>;
        root /var/www/<WEBROOT>;
	index index.php index.html;
            
        add_header X-Frame-Options "SAMEORIGIN";
        add_header X-Content-Type-Options "nosniff";


        location = /favicon.ico { access_log off; log_not_found off; }
        location = /robots.txt  { access_log off; log_not_found off; }

        location / {
            try_files $uri $uri/ /index.php?$query_string;
        }

	include default.d/php<PHP-VER>.conf;

}
