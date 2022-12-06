import 'dart:convert';

import 'package:firedart/firedart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mitwpuinventory/constants/global.dart';
import 'package:mitwpuinventory/main.dart';
import 'package:mitwpuinventory/pages/inbox_page.dart';
import 'package:mitwpuinventory/widgets/b_box.dart';
import 'package:mitwpuinventory/widgets/t_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);

   final TextEditingController _idController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();

  var jsonResponse;

  late bool loading;
  late String oneTimeToken;




  Future<http.Response> logIn(String email, String password,context) async {
    final uri =
    Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAe2CIRwDPjmgBduV6OhzMRMYgT-LVeE1M');
    final headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer token',
      'Accept': 'application/json',
    };
    Map<String, dynamic> body = {
      'email':"$email@gmail.com",
      'password': password,
      "returnSecureToken":true
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    jsonResponse = json.decode(response.body);
    box.write("token", jsonResponse['refreshToken']);
    print(box.read("token"));
Get.to(const InboxPage());
    // if(box.read("token").toString()!="null") {
    //   Firestore.instance
    //       .collection('login')
    //       .get()
    //       .then((QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((doc) {
    //       print(doc["first_name"]);
    //     });
    //   });
    //
    //  box.write("name",name);
    //   await Navigator.pushNamed(context, RouteNames.inbox);
    //
    // }else{
    //
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       // return object of type Dialog
    //       return AlertDialog(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20.0),
    //         ),
    //         title: new Text(
    //           "Location Share",
    //         ),
    //         actions: <Widget>[
    //
    //
    //           Padding(
    //             padding: const EdgeInsets.all(20.0),
    //             child: Text("Please check your id and password",style: TextStyle(fontSize: 25),),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Container(
    //               child: new Text("Close"),
    //
    //             ),
    //           ),
    //
    //         ],
    //       );
    //     },
    //   );
    // }
    // oneTimeToken = jsonResponse['idToken'];
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Expanded(child: SizedBox()),
            Expanded(
              child: Card(
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:const  EdgeInsets.only(left: 60,right: 60),
                      child: Image.asset("assets/mit.png"),
                    ),
                    SizedBox(height: 20),
                    textF(
                        lName: 'ID',
                        hName: 'SID',
                        controllers: _idController,
                        hei: 40,
                        wid: Get.width / 6),
                    textF(
                        lName: 'PIN',
                        hName: 'PIN',
                        controllers: _passwordController,
                        hei: 40,
                        wid: Get.width / 6),
                    GestureDetector(
                      onTap: () async{
                       logIn(_idController.text,_passwordController.text,context);
                     },
                      child: buttonBox(
                        height: 40,
                        width: 100,
                        color: Colors.blue,
                        text: "Go ➤ ",
                        fSize: 20,
                        fontW: FontWeight.bold,
                        fColor: Colors.white,
                        cen: true,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
