-- DB作成
CREATE DATABASE db_1;

-- ユーザー作成
CREATE USER 'user_1'@'%' IDENTIFIED BY 'user_1_pw';

-- DBとユーザの操作権限設定
GRANT ALL PRIVILEGES ON db_1.* TO 'user_1'@'%';

-- table作成
CREATE TABLE IF NOT EXISTS db_1.users (
  `id` INTEGER UNSIGNED AUTO_INCREMENT,
  `name` VARCHAR(255)  COMMENT 'user name',
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'test table';

-- テストデータ
insert into db_1.users(name) values ("abc");
insert into db_1.users(name) values ("efg");
-- select * from db_1.users;
