import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_apis/Screens/single_object_reqres.dart';
import 'package:rest_apis/UsersModel/user_model_one.dart';
import 'package:http/http.dart' as http;


//Single object With Model jsonPlaceholder {}


class SingleObject extends StatefulWidget {
  const SingleObject({super.key});

  @override
  State<SingleObject> createState() => _SingleObjectState();
}

class _SingleObjectState extends State<SingleObject> {
  UserModelOne userModelOne = UserModelOne();
  Map<String, dynamic>? loadDataOne;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          singleObject();
        },
        child: const Icon(Icons.send),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black26,
        title: const Text("Single Object"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text(userModelOne.id.toString()),
            title: Text(userModelOne.title.toString()),
            subtitle: Text(userModelOne.body.toString()),
             
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SingleObjectReq()));
          }, child: Text("Next Page"),
          ),
        ],
      ),
    );
  }

  Future<UserModelOne?> singleObject() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          userModelOne = UserModelOne.fromJson(data);
        });

        return userModelOne;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
}
