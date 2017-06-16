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
