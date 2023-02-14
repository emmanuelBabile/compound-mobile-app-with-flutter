import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet1/cubit/day.cubit.dart';
import 'package:projet1/models/day.state.dart';


class DayPage extends StatelessWidget {
  const DayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _month = TextEditingController();
    TextEditingController _day = TextEditingController();
    TextEditingController _year = TextEditingController();
    DayCubit dayCubit = context.read<DayCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Find the day'), backgroundColor: Colors.blueGrey,),
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
              Flexible(child: TextField(
                controller: _month,
                style: TextStyle(fontSize: 24, color: Colors.blue),
                decoration: InputDecoration(
                  labelText: 'month',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              )
              ),
                SizedBox(width: 10,),

                Flexible(child: TextField(
                  controller: _day,
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                  decoration: InputDecoration(
                    labelText: 'day',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                )
                ),
                SizedBox(width: 10,),

                Flexible(child: TextField(
                  controller: _year,
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                  decoration: InputDecoration(
                    labelText: 'year',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                )
                ),
            ],),
            SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              dayCubit.emit(
                DayState(
                    month: int.parse(_month.text),
                    day: int.parse(_day.text),
                    year: int.parse(_year.text),
                )
              );
              dayCubit.nameofday();
            },
                child: Container(
                  width: 30,
                  child: Center(
                      child: Icon(Icons.arrow_downward_outlined, size: 30),
                  ),
                )
            ),

            SizedBox(height: 40,),

            BlocBuilder<DayCubit,DayState>(
                builder: (context,state){
                  if(state.day_name==""){
                    return Text('Enter a date', style: TextStyle(fontSize: 25, color: Colors.blue),);
                  }
                  else{
                    return Column(
                      children: [
                        Text('${state.month} / ${state.day} / ${state.year}', style: TextStyle(fontSize: 25, color: Colors.blue)),
                        SizedBox(height: 10,),
                        Text(state.day_name, style: TextStyle(fontSize: 25, color: Colors.blue),)
                      ],
                    );
                  }
                }

            )


          ],
        ),
      ),
    );
  }
}
