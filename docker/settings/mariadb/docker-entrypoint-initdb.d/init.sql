-- DB作成
CREATE DATABASE study_laravel;
CREATE DATABASE study_laravel_test;

-- ユーザー作成
CREATE USER 'study_laravel_user_1'@'%' IDENTIFIED BY 'study_laravel_user_1_pw';

-- DBとユーザの操作権限設定
GRANT ALL PRIVILEGES ON study_laravel.* TO 'study_laravel_user_1'@'%';
GRANT ALL PRIVILEGES ON study_laravel_test.* TO 'study_laravel_user_1'@'%';

-- -- table作成
-- use study_laravel;
-- CREATE TABLE IF NOT EXISTS users (
--   `id` INTEGER UNSIGNED AUTO_INCREMENT,
--   `name` VARCHAR(255)  COMMENT 'user name',
--   PRIMARY KEY(`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'test table';

-- -- テストデータ
-- insert into users(name) values ("abc");
-- insert into users(name) values ("efg");
-- select * from users;
