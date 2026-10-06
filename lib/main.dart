import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MyApp());
  loadData();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Networking"), backgroundColor: Colors.blue),
      ),
    );
  }
}
Future<http.Response> getData() async{
  const url = 'https://about.google/static/data/locations.json';
  return await http.get(Uri.parse(url));
}
void loadData(){
  getData().then((response){
    if(response.statusCode >= 200){
      print(response.body);
    }else{
      print(response.statusCode);
    }
  }).catchError((error){
    error.toString();
  });
}