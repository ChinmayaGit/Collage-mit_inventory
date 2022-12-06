
import 'package:mitwpuinventory/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Receive extends StatelessWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Name of Sender"),centerTitle: true,actions: [
      //   Icon(Icons.archive),
      //   SizedBox(width: 20,),
      //   Icon(Icons.delete),
      //   SizedBox(width: 20,),
      //   Icon(Icons.warning_rounded),
      //   SizedBox(width: 40,)
      // ],),

      body: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 350,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
                color: Colors.black,
              ),
              child: Row(
                children: const [
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Icon(
                      Icons.archive,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Icon(
                      Icons.warning_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.print,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.forward_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Center(child: Text("Internal Outward No: 7846  ️")),
                ),
                Expanded(
                  child: Center(child: Text("Note status:on Going ️")),
                ),
                Expanded(
                  child: Center(child: Text("Received Date:2022-10-14 ")),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(child: Text("Sender name:Sir  ️")),
                ),
                Expanded(
                  child: Center(child: Text("Dept:MCA  ")),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    color: Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Subject:\nScholarship  ✏️",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                    width: Get.width / 1.2,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      color: Colors.black12,
                    ),
                    child: Text(
                        "This student should get Scholarship because ..........  ✏️")),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(18.0, 8, 18, 8),
                        child: Text(" Approve "),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(18.0, 8, 18, 8),
                        child: Text("Declines"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 8, 18, 8),
                    child: Text(" 🔁 Replay "),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 8, 18, 8),
                    child: Text("⏩ Forward"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
