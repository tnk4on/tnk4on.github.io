# tnk4on.github.io
## ドキュメント
- https://docs.github.com/ja/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll

## コンテナの起動
```
% podman run -d --rm -v $PWD:/srv/jekyll -p 4000:4000 --name jekyll quay.io/tnk4on/jekyll sleep inf
% podman exec -it jekyll bash
```

## サイトの作成
初回のみ
```
# jekyll new --skip-bundle .
```

### Gemfileの更新
- https://pages.github.com/versions/
`gem "github-pages", "~> GITHUB-PAGES-VERSION", group: :jekyll_plugins`
`gem "github-pages", "~> 228", group: :jekyll_plugins`

## サーバーの起動
```
# bundle install
# bundle exec jekyll serve
```

## ファイルの更新フロー
- ファイル変更→アップデート
```
# ctrl + c
# bundle update github-pages
# bundle exec jekyll serve
```
