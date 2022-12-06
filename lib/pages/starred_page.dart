import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class StarredPage extends StatelessWidget {
  const StarredPage({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Text('This is the gallery page'),
      ),
    );
  }
}
