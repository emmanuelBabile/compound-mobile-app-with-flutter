import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 130,),
            Center(child: Image.asset('assets/images/flutterlogo.png', width: 300,),),
            SizedBox(height: 80,),
            Text("PROJET", style: TextStyle(color: Colors.blueGrey, fontSize: 40, fontWeight: FontWeight.bold),),
            SizedBox(height: 70,),
            Text("DEVELOPPEMENT MOBILE", style: TextStyle(color: Colors.blueGrey, fontSize: 25, fontWeight: FontWeight.bold),),
            Text("AVEC FLUTTER", style: TextStyle(color: Colors.blueGrey, fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
