// import 'package:mitwpuinventory/constants/colorSet.dart';
// import 'package:mitwpuinventory/pages/form_page.dart';
// import 'package:mitwpuinventory/widgets/b_box.dart';
// import 'package:mitwpuinventory/widgets/t_form.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'app_drawer.dart';
//
// class AppScaffold extends StatelessWidget {
//   const AppScaffold({required this.body, required this.pageTitle, Key? key})
//       : super(key: key);
//
//   final Widget body;
//   final  Function pageTitle;
//
//   @override
//   Widget build(BuildContext context) {
//     final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
//     return Row(
//       children: [
//         if (!displayMobileLayout)
//           const AppDrawer(
//             permanentlyDisplay: true,
//           ),
//         Expanded(
//           child: Scaffold(
//             floatingActionButton: FloatingActionButton.extended(
//               backgroundColor: Colors.purple,
//               onPressed: () {
//                 Get.to(FormPage());
//               },
//               icon: const Icon(Icons.mode_edit),
//               label: const Text('Compose'),
//             ),
//             backgroundColor: backGroundColor,
//             appBar: AppBar(
//               centerTitle: true,
//               backgroundColor: backGroundColor,
//               elevation: 0,
//               iconTheme: IconThemeData(color: fontOffColors),
//               // when the app isn't displaying the mobile version of app, hide the menu button that is used to open the navigation drawer
//               automaticallyImplyLeading: displayMobileLayout,
//               title: Text(
//                 "📩 " + "Email",
//                 style: TextStyle(color: fontOffColors),
//               ),
//               actions: [
//                 GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           // return object of type Dialog
//                           return AlertDialog(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             backgroundColor: backGroundColor,
//                             title: Center(
//                               child: Text(
//                                 "Info",
//                               ),
//                             ),
//                             actions: <Widget>[
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                               buttonBox(
//                                 width: Get.width / 2,
//                                 height: 100,
//                                 color: buttonBoxColors,
//                                 text:
//                                     "Total Outwards:9 \nTotal Received:0 \nTotal Pendind:9",
//                                 fSize: 20,
//                                 fontW: FontWeight.w500,
//                                 fColor: fontOnColors,
//                                 cen: true,
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: const Icon(Icons.notifications)),
//                 SizedBox(
//                   width: 50,
//                 ),
//               ],
//             ),
//             drawer: displayMobileLayout
//                 ? const AppDrawer(
//                     permanentlyDisplay: false,
//                   )
//                 : null,
//             body: Padding(
//               padding: const EdgeInsets.only(left: 18.0, right: 18.0),
//               child: Container(
//                   decoration: ShapeDecoration(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18.0),
//                       ),
//                       color: Colors.white),
//                   child: body),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
