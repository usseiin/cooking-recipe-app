import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Network Error..."),
      ),
    );
  }
}
