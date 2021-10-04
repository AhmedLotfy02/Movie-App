import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/controllers/appcontroller.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'models/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late Future<List<Post>> futurePostsData;
  @override
  void initState() {
    super.initState();
    futurePostsData = AppController.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json PlaceHolder'),
        actions: [
          IconButton(
              onPressed: () async {
                var result = await AppController.getPosts();
                print(result);
              },
              icon: Icon(Icons.send))
        ],
      ),
      body: FutureBuilder<List<Post>>(
          future: futurePostsData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data![index].title}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${snapshot.data![index].body}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
