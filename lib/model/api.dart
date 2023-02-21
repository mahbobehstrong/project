class Api{

 static String baseURL="https://jsonplaceholder.typicode.com/";

 static String makeApi({required String address}){
   return "$baseURL$address";
 }

 static String makeApiTest(String address){
   return "$baseURL$address";
 }
}