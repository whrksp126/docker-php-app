<?php
try {
    $host = getenv('MYSQL_HOST');
    $dbname = getenv('MYSQL_DATABASE');
    $user = getenv('MYSQL_USER');
    $pass = getenv('MYSQL_PASSWORD');
    echo "단(근)디... <br>";
    echo "연결 시도 중... <br>";
    echo "Host: " . ($host ?: 'not set') . "<br>";
    echo "Database: " . ($dbname ?: 'not set') . "<br>";
    echo "User: " . ($user ?: 'not set') . "<br>";
    
    $dsn = "mysql:host=$host;dbname=$dbname";
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "MySQL 연결 성공! ";
} catch(PDOException $e) {
    echo "연결 실패: " . $e->getMessage();
}