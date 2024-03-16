import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_apis/Screens/list_array.dart';


class SingleObjectWithoutModel extends StatefulWidget {
  const SingleObjectWithoutModel({super.key});

  @override
  State<SingleObjectWithoutModel> createState() => _SingleObjectWithoutModelState();
}

class _SingleObjectWithoutModelState extends State<SingleObjectWithoutModel> {

  
  dynamic loadedData2;
  Future<dynamic> singleObjectWithoutModel() async{
    try{
      final response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
      var data = jsonDecode(response.body);

      if(response.statusCode==200){
        setState(() {
          loadedData2=data;
        });
      }


    }catch(e){
      print(e.toString());
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleObjectWithoutModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadedData2==null?CircularProgressIndicator():Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(loadedData2['data']['email'].toString()),
          Text(loadedData2['support']['text'].toString()),

          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ListArrayone()));
          }, child: Text("Next Page"),
          ),

        ],
      ),
    );
  }
}
