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

## GitHub Pages gem の更新
gem自体を更新する場合に実行
```
# bundle update github-pages
```

## ファイルの更新フロー
- ファイル変更→アップデート
```
# ctrl + c
# bundle exec jekyll serve
```

## OGP
下記を_config.ymlに追記
```
defaults:
  - scope:
      path: ""
    values:
      image: /assets/images/default-card.png
```

## モバイル表示時のプロフィール画像
`/assets/css/style.scss`に下記を追記
```
.profile-picture {
  height: 85px;
  width: 85px;
  position: relative;
  margin: -10px 0 0 15px;
  float: right;
  border-radius: 50%;
  p & {
      padding: 0 0 0 0;
      margin: 0 0 0 4px;
  }
  @media print, screen and (min-width: 961px) {
      display: none !important;
  }
}
```

`index.md`に<`img class="profile-picture" src=" "`を追加

## Google Analytics

[テーマ未設定の GitHub Pages に Google Analytics を設定する](https://zenn.dev/key_luvless/articles/d6b14182c0b4e0)
