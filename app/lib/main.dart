import 'package:app/another_screen.dart';
import 'package:app/home.dart';
import 'package:flutter/material.dart';
import 'package:app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => Movies(), child: Provider()));
}

class Provider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
