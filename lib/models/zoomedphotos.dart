import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZoomedPhotos extends StatelessWidget {
  String image;
  String author;

  ZoomedPhotos({required this.image, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 250,),
            Container(
              width: 400,
              height: 300,
              child: GestureDetector(
                child: Image.network(image),
                onTap: (){
                  Navigator.pop(context);
                },
             ),
            ),
            SizedBox(height: 40,),
            Text(author, style: TextStyle(color: Colors.blueGrey, fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

