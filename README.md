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
2. 環境設定ファイルを読み込む
3. 環境設定ファイルから値を取得する

値を取得するにはgetメソッドを実行する。
```
string api_token = Env::get<string>("API_TOKEN");
```
Env::get<取得する値の型>)(key, keyが存在しない場合の初期値)の形式で実行する。  
初期値は省略可能。  
初期値を省略し、尚且つkeyが存在しない場合はNULLまたはNULLに相当する値が返る。  
bool型の値を取得する場合は、getBoolValueメソッドを実行する。  


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
![image](https://cloud.githubusercontent.com/assets/14832366/25302730/e479bf20-277f-11e7-8f48-45e134246543.png)
