# PHP 8.2 Apache 이미지를 사용
FROM php:8.2-apache

# Install PDO MySQL driver
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www/html

# Apache 설정에서 환경변수를 PHP로 전달하도록 설정
RUN a2enmod env rewrite headers

# Apache 설정 파일 생성
RUN echo "<VirtualHost *:80> \n\
    DocumentRoot /var/www/html \n\
    SetEnv MYSQL_HOST \${MYSQL_HOST} \n\
    SetEnv MYSQL_DATABASE \${MYSQL_DATABASE} \n\
    SetEnv MYSQL_USER \${MYSQL_USER} \n\
    SetEnv MYSQL_PASSWORD \${MYSQL_PASSWORD} \n\
    <Directory /var/www/html> \n\
        AllowOverride All \n\
        Require all granted \n\
    </Directory> \n\
</VirtualHost>" > /etc/apache2/sites-available/000-default.conf

# Copy source files
COPY . .
