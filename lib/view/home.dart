import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: 90,
        height: 50,
        child: Column(
          children: [
            Container(
              child: Text('dssvd'),
            )
          ],
        ),
      ),
    );
  }
}
