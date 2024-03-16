import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_apis/Screens/list_array_without_model.dart';

import '../UsersModel/user_model_three.dart';

class ListArrayone extends StatefulWidget {
  const ListArrayone({super.key});

  @override
  State<ListArrayone> createState() => _ListArrayoneState();
}

class _ListArrayoneState extends State<ListArrayone> {
  List<UserModelThree> emptyList = [];

  Future<List<UserModelThree>?> listUser() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setState(() {
          for (Map<String, dynamic> i in data) {
            emptyList.add(UserModelThree.fromJson(i));

          }
        });
        return emptyList;
      }
      return emptyList;
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: emptyList.length,
                itemBuilder: (context,index){
              return ListTile(
                leading: Text(emptyList[index].id.toString()),
                title: Text(emptyList[index].name.toString()),
                subtitle: Text(emptyList[index].body.toString()),
              );
            }),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ListArrayWithoutModel()));
          }, child: Text("Next Page"),
          ),
        ],
      ),
    );
  }
}
