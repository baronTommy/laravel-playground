# mariadb

docker単体での操作

コンテナ作成時に設定を読みこませる必要がある
/etc/mysql/conf.d/ ディレクトリ以下に *.cnfが存在すればそれを読み込む」(mysql)

## 良く使うコマンド

```bash
# 差分確認
diff settings/mariadb/settings/my.cnf settings/mariadb/settings/my.cnf.origin

# 対話形式
docker exec -ti mariadb bash
```

``` sql
-- 確認系
select * from db_1.users;

-- カラムコメント
SHOW FULL COLUMNS FROM db_1.users;

-- create表示
SHOW CREATE TABLE db_1.users;

-- テーブルコメント
select table_name, table_comment from information_schema.tables where table_name='users';

-- その他
show variables like '%time_zone%';
show variables like "chara%";
```

### オリジナルのmy.cnfを、ホストにバックアップして比較

```bash
cd ~/synced_folder/server/docker

# 起動
docker run \
  --name mariadb \
  -e MYSQL_ROOT_PASSWORD=asdf \
  -v ~/synced_folder/server/docker/settings/mariadb/settings:/home/docker/sync_folder/settings \
  -d \
  mariadb:latest;

# 共有ディレクトリにコピー
docker exec mariadb cp /etc/mysql/my.cnf /home/docker/sync_folder/settings/my.cnf.origin

# 消す
docker rm -f mariadb
```

### 設定反映

```bash
cd ~/synced_folder/server/docker

docker run \
  --name mariadb \
  -e MYSQL_ROOT_PASSWORD=asdf \
  -v ~/synced_folder/docker/dockerfiles/mariadb/settings:/etc/mysql/conf.d \
  -v ~/synced_folder/server/docker/settings/mariadb/docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d \
  -d \
  mariadb:latest;
```
