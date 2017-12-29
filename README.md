# MQL4-Env
MQL4 handles environment setting files for each account.


## Requirement
- [MQL4-SymbolSearch](https://github.com/KeisukeIwabuchi/MQL4-SymbolSearch)


## Install
1. Donwload Env.mqh and defines.mqh
2. Save the file to /MQL4/Include/mql4_modules/Env/


## Usage
### Prepare the environment file
1. Make a file (.txt or .ini) in /MQL4/Files/ 
2. Write the setting in the form of key = value in the created text file.

```
API_TOKEN=123456890-hogehogehoge
ACCOUNT=123
IS_DEBUG=true
```

### How to use
1. Includes Env.mqh
2. Read the configuration file.
3. Acquire value from environment setting file.

To get the value, execute the get method.
```
string api_token = Env::get<string>("API_TOKEN");
```

Env::get <type of value to retrieve> (initial value if key, key does not exist).  
Initial value can be omitted.  
If the initial value is omitted and a key does not exist, a value equivalent to NULL or NULL is returned.  
To get the bool type value, execute the getBoolValue method.
``` cpp
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
