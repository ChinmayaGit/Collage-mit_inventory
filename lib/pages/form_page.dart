import 'package:firedart/firedart.dart';
import 'package:mitwpuinventory/constants/colorSet.dart';
import 'package:mitwpuinventory/widgets/b_box.dart';
import 'package:mitwpuinventory/widgets/t_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _inNoController = TextEditingController();
  final TextEditingController _staffController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _senderController = TextEditingController();
  final TextEditingController _subController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  var dropdownValue;

  @override
  Widget build(BuildContext context) {
    DateTime dateToday = DateTime.now();
    String date = dateToday.toString().substring(0, 16);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Form"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 300,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        // bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Internal Outward No:",
                        style: TextStyle(
                            color: fontOnColors,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      textF(
                        // lName: 'Enter',
                        hName: 'Enter',
                        controllers: _inNoController,
                        hei: 40,
                        wid: 200,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Note Status:",
                        style: TextStyle(
                            color: fontOffColors,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      textF(
                          hName: 'Enter',
                          controllers: _noteController,
                          hei: 40,
                          wid: 200),
                    ],
                  ),
                ),
                Container(
                    height: 100,
                    width: 300,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          // bottomRight: Radius.circular(30.0),
                        ),
                      ),
                      color: Colors.blue,
                    ),
                    child: Text(
                      " Date:\n $date",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              width: Get.width / 1.8,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.blue),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Staff ID:",
                            style: TextStyle(
                                color: fontOnColors,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          textF(
                              lName: 'Enter',
                              hName: 'Enter',
                              controllers: _staffController,
                              hei: 50,
                              wid: 300),
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 3,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Sender Staff Name:",
                            style: TextStyle(
                                color: fontOnColors,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          textF(
                              lName: 'Enter',
                              hName: 'Enter',
                              controllers: _senderController,
                              hei: 50,
                              wid: 300),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "         Select Dept. : ",
                            style: TextStyle(
                                color: fontOffColors,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            child: DropdownButtonHideUnderline(
                              child: GFDropdown(
                                borderRadius: BorderRadius.circular(5),
                                border: const BorderSide(
                                    color: Colors.black38, width: 1),
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
                        ),
                        Expanded(child: SizedBox())
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "       Note Subject : ",
                            style: TextStyle(
                                color: fontOffColors,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: textF(
                            // lName: 'Enter',
                            hName: 'Enter',
                            controllers: _subController,
                            hei: 50,
                          ),
                        ),
                        Expanded(child: SizedBox())
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Note Description : ",
                          style: TextStyle(
                              color: fontOffColors,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: textF(
                          // lName: 'Enter',
                          hName: 'Enter',
                          controllers: _desController,
                          hei: Get.height / 2.5,
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.to(const SetCategory());
                        Firestore.instance
                            .collection("messages")
                            .add({
                          "internalNo": _inNoController,
                          "staffName": _staffController,
                          "staffSenderName": _senderController,
                          "Dept": dropdownValue,
                          "sub": _subController,
                          "des": _desController,
                          "date": DateTime.now(),
                        });

                      },
                      child: buttonBox(
                        height: 40,
                        width: 140,
                        color: Colors.blue,
                        text: "Send ➤",
                        fSize: 20,
                        fontW: FontWeight.bold,
                        fColor: Colors.white,
                        cen: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
