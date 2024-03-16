import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListArrayWithoutModel extends StatefulWidget {
  const ListArrayWithoutModel({Key? key}) : super(key: key);

  @override
  _ListArrayWithoutModelState createState() => _ListArrayWithoutModelState();
}

class _ListArrayWithoutModelState extends State<ListArrayWithoutModel> {
  List<dynamic> emptyList2 = [];

  Future<void> listArrayWithoutModel() async {
    try {
      final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          emptyList2 = data;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    listArrayWithoutModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: emptyList2.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(emptyList2[index]['email'].toString()),
                  // You can display other fields here similarly
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
