# MQL4-configuration-file
MQL4で口座ごとの環境設定ファイルを扱う。

## Install
1. Env.mqh と SymbolSearch.mqh をダウンロード
2. \<Your Data Folder\>/MQL4/Includesの中に保存

## Usage
### 環境設定ファイルの準備
1. \<Your Data Folder\>/MQL4/Filesの中にテキストファイルを作成する（.txtや.iniなど）
2. 作成したテキストファイルにkey=valueの形式で設定を記述する
sample.ini
```
API_TOKEN=123456890-hogehogehoge
ACCOUNT=123
IS_DEBUG=true
```

### プログラム内での使い方
1. Env.mqhを読み込む
```
#include <Env.mqh>
```
2. 環境設定ファイルを読み込む
```
int OnInit() {
  Env::loadEnvFile("sample.ini");
  
  return(INIT_SUCCEEDED);
}
```
3. 環境設定ファイルから値を取得する
値を取得するにはgetメソッドを実行する。
Env::get<取得する値の型>)(key, 初期値)の形式
初期値は省略可能。
bool型の値を取得する場合は、getBoolValueメソッドを実行する。
```
string api_token = Env::get<string>("API_TOKEN");
```

## Sample
sample.mq4
```
#property strict

#include <Env.mqh>


int OnInit(){
   Env::loadEnvFile("sample.ini");
   Comment("API_TOKEN = ", Env::get<string>("API_TOKEN"), "\n",
           "USER_NAME = ", Env::get<string>("USER_NAME", "MQL4"), "\n",
           "ACCOUNT = ", Env::get<int>("ACCOUNT", 0), "\n",
           "IS_DEBUG = ", Env::getBoolValue("IS_DEBUG", false));

   return(INIT_SUCCEEDED);
}


void OnTick(){
   
}
```

