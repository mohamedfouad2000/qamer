import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Shared/companents.dart';
import 'package:project/admin/addSource.dart';
import 'package:project/admin/addadrtoaroad.dart';
import 'package:project/admin/addmarker.dart';
import 'package:project/admin/addnewdriver.dart';
import 'package:project/admin/addroad.dart';
import 'package:project/cubit/admincubit/admincubit.dart';
import 'package:project/cubit/admincubit/adminstates.dart';

class adminhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return admincubit()..getdrivers();
      },
      child: BlocConsumer<admincubit, adminStates>(
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        NavegatorPush(context, AddnewRoad());
                      },
                      child: Text("Add A New Road")),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        NavegatorPush(context, addDtoR());
                      },
                      child: Text("Add  A Driver To Road ")),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        NavegatorPush(context, addNewdrivers());
                      },
                      child: Text("Accept Driver")),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        NavegatorPush(context, AddMarker());
                      },
                      child: Text("Set A School")),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        NavegatorPush(context, addSource());
                      },
                      child: Text("Set A Sourcs")),
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
