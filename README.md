# wsl-private-isu

## これはなに

WSL2上にprivate-isuの環境を構築するスクリプトです。

## 事前準備

WSL2上でsystemdを動作させるためWSLのバージョン0.67.6以降を用意してください。

## 構築

PowerShell上で以下を実行します。

```
# ダウンロード
git clone https://github.com/matsuu/wsl-private-isu.git

# ディレクトリに移動
cd wsl-private-isu

# 一時的にPowerShell実行を許可
Set-ExecutionPolicy RemoteSigned -Scope Process

# 構築スクリプト実行(引数はDistro名、インストールパス)
.\build.ps1 private-isu .\private-isu
```

## 実行

```
wsl.exe ~ -d private-isu /bin/bash -l
```

### サイト表示確認

http://localhost/

### ベンチマーク実行

```
cd ~/private-isu/benchmarker
bin/benchmarker -u userdata -t http://127.0.0.1
```

## 関連

* [catatsuy/private-isu](https://github.com/catatsuy/private-isu)

## TODO

* エラー制御
  * 二重実行の防止
* `/etc/resolv.conf` 周りの調整
* PowerShellなんもわからん
