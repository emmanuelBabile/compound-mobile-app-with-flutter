import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet1/cubit/day.cubit.dart';
import 'package:projet1/screens/curvedNavigation.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>DayCubit()),

      ],
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        // theme: ThemeData(brightness: Brightness.dark,primaryColor:Colors.green),
        home: HomePage(),
      ),
    );
  }
}
