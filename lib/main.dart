import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shohojeeto/models/package_model.dart';
import 'package:shohojeeto/providers/package_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shohojeeto/screen/package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {

 

     return  MaterialApp(
       debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(create: ( context)=> getPackages(),
          builder: (context,child){
          return const Package_page();
          },

        ),
      );

  }
}

