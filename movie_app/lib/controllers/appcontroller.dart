import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/models/post.dart';  
import 'package:http/http.dart' as http;
class AppController{
static String url='https://jsonplaceholder.typicode.com/posts';
  static Future<List<Post>> getPosts() async{
    final response= await http.get(Uri.parse(url));
    return   List<Post>.from(jsonDecode(response.body).map((e)=>{
                  Post(userId:e['userId'],id:e['id'],title:e['title'],body:e['body'])
                 
                }));
  }
}