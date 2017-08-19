# nginx

dockerとして動作確認

## 良く使うコマンド

```bash
# 差分確認
diff settings/nginx/settings/default.conf settings/nginx/settings/default.conf.origin

# 対話
docker exec -ti nginx bash

# 消す
docker rm -f -v nginx
```

## オリジナルのconf.dを、ホストにバックアップして比較

```bash
cd ~/synced_folder/server/docker

# 起動
docker run -d -t -p 80:80 --name=nginx \
  -v ~/synced_folder/server/docker/settings/nginx/settings:/home/docker/sync_folder/settings \
  nginx

# 共有ディレクトリにコピー
docker exec nginx cp /etc/nginx/conf.d/default.conf /home/docker/sync_folder/settings/default.conf.origin

# 消す
docker rm -f nginx
```

## 修正したのconf.dを、反映

```bash
docker run -d -t -p 80:80 --name=nginx \
  -v ~/synced_folder/server/docker/settings/nginx/settings:/home/docker/sync_folder/settings \
  nginx

docker exec nginx cp /home/docker/sync_folder/settings/default.conf /etc/nginx/conf.d
docker exec nginx /etc/init.d/nginx reload
```
