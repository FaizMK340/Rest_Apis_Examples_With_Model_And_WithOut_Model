import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../UsersModel/user_model_four.dart';

class LastExample extends StatefulWidget {
  const LastExample({super.key});

  @override
  State<LastExample> createState() => _LastExampleState();
}

class _LastExampleState extends State<LastExample> {
  UserModelFour userModelFour = UserModelFour();

  Future<UserModelFour?> getData() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/unknown'));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          userModelFour = UserModelFour.fromJson(data);
        });
        return userModelFour;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black26,
        title: const Text("Last Example"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userModelFour.data!.length,
            
                itemBuilder: (context,index){
              return ListTile(
                leading: Text(userModelFour.page.toString()),
                title: Text(userModelFour.data![index].pantoneValue.toString()),
                subtitle: Text(userModelFour.support!.text.toString()),
              );
            }),
          )
        ],
      ),
    );
  }
}
