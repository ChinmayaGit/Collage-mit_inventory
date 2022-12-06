
import 'package:mitwpuinventory/pages/receive%20_page.dart';
import 'package:mitwpuinventory/widgets/t_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../widgets/app_scaffold.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  var dropdownValue;
  final TextEditingController _enterController = TextEditingController();

  letterBox(context) {
    return GestureDetector(
      onTap: () {
        Get.to(const Receive());
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 8),
        child: Row(
          children: const [
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  "✅",
                  style: TextStyle(fontSize: 20),
                ))),
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  "⭐",
                  style: TextStyle(fontSize: 30),
                ))),
            Expanded(
              flex: 4,
              child: Text("From:Chinmaya"),
            ),
            Expanded(
              flex: 15,
              child: Text(
                  "Some info about this email hello say tahta anad if me and ..........."),
            ),
            Expanded(
              flex: 1,
              child: Center(child: Text("19:20")),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 5,
                        child: Center(
                          child: textF(
                            // lName: 'Enter',
                            hName: 'Search',
                            controllers: _enterController,
                            hei: 50,
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(20),
                          child: DropdownButtonHideUnderline(
                            child: GFDropdown(
                              padding: const EdgeInsets.all(15),
                              borderRadius: BorderRadius.circular(5),
                              border: const BorderSide(
                                  color: Colors.black38, width: 1),
                              dropdownButtonColor: Colors.white,
                              hint: const Text("Date"),
                              value: dropdownValue,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue as String?;
                                });
                              },
                              items: [
                                'Dept.',
                                'Name',
                                'Date ',
                                'Time',
                                'A-Z',
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
                    )
                  ],
                ),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
                letterBox(context),
                const Divider(),
              ],
            ),
          ),
        ));
  }
}
