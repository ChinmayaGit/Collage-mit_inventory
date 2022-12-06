import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class DraftPage extends StatelessWidget {
  const DraftPage({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('This is the settings page'),
      ),
    );
  }
}
