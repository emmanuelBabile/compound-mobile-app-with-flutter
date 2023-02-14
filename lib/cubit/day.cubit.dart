import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet1/models/day.state.dart';

class DayCubit extends Cubit <DayState> {
  DayCubit() : super (DayState(month: 1, day: 1, year: 1900));
  final f = [0,3,3,6,1,4,6,2,5,0,3,5];
  final jours = ["Sunday", "Monday", "Tuesday","Wednesday","Thursday", "Friday", "Saturday"];
  void nameofday(){
    if (state.year >= 0 && state.month >= 1 && state.month <= 12 && state.day >= 1 && state.day <= 31){
      var t1 = state.year - 1900;
      var t2 = (t1/4).floor();
      var x = (state.day + t1 + t2 + f[state.month - 1]) % 7;
      state.day_name = jours[x];
      emit(state);
    }
    else{
      state.day_name = "Invalid date";
    }
  }
}