import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mitwpuinventory/constants/global.dart';
import 'package:mitwpuinventory/login.dart';
import 'package:mitwpuinventory/pages/form_page.dart';
import 'package:mitwpuinventory/pages/admin.dart';
import 'package:mitwpuinventory/pages/receive%20_page.dart';
import 'package:mitwpuinventory/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'pages/starred_page.dart';
import 'pages/inbox_page.dart';
import 'pages/draft_page.dart';
import 'pages/sent_page.dart';
import 'widgets/app_route_observer.dart';
import 'package:firedart/firedart.dart';

const apiKey = 'AIzaSyA5XkEF8uMPQuVdK3R9T4xuKrIJGbE4Lwc';
const projectId = 'inventory-aa13f';
final FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.initialize(projectId);
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Responsive app with navigation drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          box.read("token").toString() == "null" ? Login() : const InboxPage(),
    );
  }
}
