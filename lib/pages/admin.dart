// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firedart/auth/user_gateway.dart';
// import 'package:firedart/firedart.dart';
import 'dart:convert';

import 'package:firedart/firedart.dart';
import 'package:mitwpuinventory/constants/global.dart';
import 'package:mitwpuinventory/main.dart';
import 'package:mitwpuinventory/widgets/b_box.dart';
import 'package:mitwpuinventory/widgets/t_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

// import 'package:firebase_auth_desktop/firebase_auth_desktop.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  var dropdownValue;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController textarea = TextEditingController();

  late bool _success;
  late String _userEmail;
  var jsonResponse;

  late bool loading;
  late String oneTimeToken;

  Future<http.Response> signUp(
    String email,
    String password,
  ) async {
    final uri = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAe2CIRwDPjmgBduV6OhzMRMYgT-LVeE1M");
    final headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer token',
      'Accept': 'application/json',
    };
    Map<String, dynamic> body = {
      "email": "$email@gmail.com",
      "password": password,
      // "returnSecureToken":true,
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );
    print(response.statusCode);
    print(response.body);

    jsonResponse = json.decode(response.body);
    box.write("token", jsonResponse['refreshToken']);

    oneTimeToken = jsonResponse['refreshToken'];
    print(oneTimeToken);
    // box.write("token", token);
    if (box.read('token') != null) {
      Fluttertoast.showToast(
          msg: 'Account Created Successfully',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      ;
      setState(() {
        loading = false;
      });
    } else if (response.statusCode != 200) {
      setState(() {
        loading = false;
      });

      Fluttertoast.showToast(
          msg: 'Account Already existing \n or missing data',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return response;
  }

  // final url = "https://hilearner.herokuapp.com/auth/individual/login";
  // var jsonResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              buttonBox(
                  height: 40,
                  width: 120,
                  color: Colors.blue,
                  text: "Id: ",
                  fSize: 20,
                  fontW: FontWeight.bold,
                  fColor: Colors.white),
              const SizedBox(
                width: 20,
              ),
              textF(
                  lName: 'Enter',
                  hName: 'Enter',
                  controllers: _idController,
                  hei: 40,
                  wid: Get.width / 6),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              buttonBox(
                  height: 40,
                  width: 120,
                  color: Colors.blue,
                  text: "Password: ",
                  fSize: 20,
                  fontW: FontWeight.bold,
                  fColor: Colors.white),
              const SizedBox(
                width: 20,
              ),
              textF(
                  lName: 'Enter',
                  hName: 'Enter',
                  controllers: _passwordController,
                  hei: 40,
                  wid: Get.width / 6),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: Get.width / 2,
                margin: const EdgeInsets.all(20),
                child: DropdownButtonHideUnderline(
                  child: GFDropdown(
                    padding: const EdgeInsets.all(15),
                    borderRadius: BorderRadius.circular(5),
                    border: const BorderSide(color: Colors.black38, width: 1),
                    dropdownButtonColor: Colors.white,
                    hint: const Text("Select Organization"),
                    value: dropdownValue,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue as String?;
                      });
                    },
                    items: [
                      'Scholarship',
                      'financial ',
                      'administration',
                      'Sports'
                    ]
                        .map((value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                color: Colors.blue.shade50,
              ),
              child: TextField(
                controller: textarea,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "   Enter Remarks",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.blue.shade500))),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              signUp(
                  _idController.text,_passwordController.text
              );
              _register();
            },
            child: buttonBox(
              height: 40,
              width: 100,
              color: Colors.blue,
              text: "Create ➤ ",
              fSize: 20,
              fontW: FontWeight.bold,
              fColor: Colors.white,
              cen: true,
            ),
          ),
        ],
      ),
    );
  }

void _register() async {
  Firestore.instance
      .collection("login").document(box.read("token"))
      .set({
    "email": _idController.text,
   "token":box.read("token"),
    "Organization":dropdownValue,
    "remark":textarea.text,
    "time": DateTime.now(),
  });
}
}
