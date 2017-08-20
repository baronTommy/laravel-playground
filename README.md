# 環境

- ngixn
- mariadb
- php fpm
- composer
- app
  - laravel5.1

## コマンド

fish用

```bash
# 起動
docker-compose up --build -d;  docker-compose ps
```

```bash
# 全部削除
docker-compose stop;  docker-compose rm -f;  docker-compose ps
```

```bash
# composer で laravel インストール
docker run --rm -v (pwd):/app composer/composer create-project 'laravel/laravel=5.1.*' study_laravel
```

```bash
# mariadb データバックアップ
docker run --rm --volumes-from mariadb_datastore \
  -v (pwd):/backup busybox \
  tar cvf /backup/backup.tar var/lib/mysql -C /
```

```bash
# mariadb データリストア
# 停止
docker-compose stop mariadb
# リストア
docker run --rm --volumes-from mariadb_datastore \
  -v (pwd):/backup busybox \
  tar xvf /backup/backup.tar -C /
# 起動
docker-compose start mariadb
```

```bash
# nginx 設定反映
# conf修正
# settings/nginx/settings/default.conf
docker exec nginx cp /home/docker/sync_folder/settings/default.conf /etc/nginx/conf.d
docker exec nginx /etc/init.d/nginx reload
```

```bash
# composer 関連
docker run --rm -v (pwd):/app composer/composer require --dev ...
```

## phpstorm

### debug設定

#### 1

Run > Break at first line in PHP scripts　のチェックをOFF

#### 2

ifconfig -> en1 -> inet これを
`settings/php/settings/xdebug.ini` の `xdebug.remote_host` に設定

#### 3

`https://www.jetbrains.com/phpstorm/marklets/` cookie設定

#### 4

Debug port: -> 9001
