import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled4/models/post_model.dart';

class ApiService {

//  HTTP Apis

  static const String BASE = "jsonplaceholder.typicode.com";
  static const String USER = "/posts";

//  HTTP requests

  static Future<List<Post>?> GET(String api,Map<String,String> params) async{
    var q =  Uri.https(BASE,api,params);
    var response = await get(q);

    if(response.statusCode==200){
      return postFromJson(response.body);
    }
  }

//  HTTP params

  static Map<String, String> paramsEmpty(){
    Map<String,String> params = {};
    return params;
  }

  static Post parseUser(String json){
    dynamic j = jsonDecode(json);
    var data = Post.fromJson(j);
    return data;
  }

}