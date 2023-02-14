import 'package:animations/animations.dart';
import 'package:projet1/models/zoomedphotos.dart';
import 'package:flutter/material.dart';
import 'package:projet1/models/photos.state.dart';
import 'package:projet1/repositories/photos.data.dart';


class PhotoPage extends StatefulWidget{
  const PhotoPage({Key? key}) : super(key: key);

  @override
  _PhotoPageState createState() => _PhotoPageState();
}
class _PhotoPageState extends State<PhotoPage> {
  TextEditingController _ctr = TextEditingController();
  late int page=1;
  late Future<List<Photos>>photos;
  ContainerTransitionType _transition = ContainerTransitionType.fadeThrough;

  @override
  void initState() {
    setState(() {
      photos=getPhotos('basketball', page);
    });
//
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Photos"),  titleTextStyle: TextStyle(fontSize: 20), backgroundColor: Colors.blueGrey,),
        body: Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(
              children: [

                TextField(
                  controller: _ctr,
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      labelText: 'Keyword'),
                ),
                ElevatedButton(onPressed:(){
                  setState(() {
                    photos=getPhotos(_ctr.text, page);
                  });},
                  child:Icon(Icons.search, size: 30,),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed:(){
                      setState(() {
                        page--;
                        photos=getPhotos(_ctr.text, page);
                      });},
                      child:Icon(Icons.navigate_before_outlined, size: 30,),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                      ),
                    ),
                    ElevatedButton(onPressed:(){
                      setState(() {
                        page++;
                        photos=getPhotos(_ctr.text, page);
                      });},
                      child:Icon(Icons.navigate_next_outlined, size: 30,),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: FutureBuilder <List<Photos>>(
                        future: photos,
                        builder: (context,snp) {
                          if (snp.hasData) {
                            return GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 3/4
                                ),
                                itemCount: snp.data!.length,
                                itemBuilder: (context, index) {
                                  return OpenContainer(
                                      transitionType: _transition,
                                      transitionDuration: Duration(seconds: 1),
                                      closedBuilder: (context, action) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                15),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  snp.data![index].url),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                      openBuilder: (context, action) {
                                        return ZoomedPhotos(
                                          image: snp.data![index].url,
                                          author: snp.data![index].name,
                                        );
                                      }
                                   );
                                  }
                                );
                          }
                          else {
                            return Container(
                              child: Column(
                                children: [
                                  const SizedBox(height: 10,),
                                  Text('Aucune donnée présente', style: TextStyle(color: Colors.blueGrey, fontSize: 20),),
                                ],
                              ),
                            );
                          }
                        }
                    )
                ),
                const SizedBox(height: 5,),

              ]
          ),

        ));
  }
}

