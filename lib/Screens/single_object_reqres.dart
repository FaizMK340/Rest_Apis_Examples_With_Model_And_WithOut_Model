import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_apis/Screens/single_object_without_model.dart';
import 'package:rest_apis/UsersModel/user_model_two.dart';
import 'package:http/http.dart' as http;

class SingleObjectReq extends StatefulWidget {
  const SingleObjectReq({super.key});

  @override
  State<SingleObjectReq> createState() => _SingleObjectState();
}

class _SingleObjectState extends State<SingleObjectReq> {
  UserModelTwo userModelTwo = UserModelTwo();
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
          if (userModelTwo.data != null && userModelTwo.support != null)
          ListTile(
            leading: Text(userModelTwo.data!.id.toString()),
            title: Text(userModelTwo.data!.email.toString()),
            subtitle: Text(userModelTwo.support!.text.toString()),


          ),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SingleObjectWithoutModel()));
          }, child: Text("Next Page"),
          ),
        ],
      ),
    );
  }

  Future<UserModelTwo?> singleObject() async {
    try {
      final response = await http
          .get(Uri.parse('https://reqres.in/api/users/2'));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          userModelTwo = UserModelTwo.fromJson(data);
        });

        return userModelTwo;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
}
