import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet1/models/text.movies.dart';


class tvMovies extends StatelessWidget {
final List tv;

const tvMovies({ Key? key, required this.tv}) : super(key: key);
@override
Widget build(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ModifiedText(
          text: 'Popular TV Shows',
          size: 26, color: Colors.blueGrey,
        ),
        SizedBox(height: 10),
        Container(
          // color: Colors.red,
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    // color: Colors.green,
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        tv[index]['backdrop_path']),
                                fit: BoxFit.cover),
                          ),
                          height: 140,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: ModifiedText(
                              size: 15,
                              text: tv[index]['original_name'] != null
                                  ? tv[index]['original_name']
                                  : 'Loading', color: Colors.black,),
                        )
                      ],
                    ),
                  );
                }))
      ],
    ),
  );
}
}