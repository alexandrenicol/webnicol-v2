# webnicol-v2

## install Elm

```bash
curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
gunzip elm.gz
chmod +x elm
sudo mv elm /usr/local/bin/
```

## dev

```bash
npm run sass-watch
npm run elm-watch
npm run serve
```

## build

```bash
npm run elm-build
npm run build
```
