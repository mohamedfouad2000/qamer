import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Shared/cashehelber.dart';
import 'package:project/Shared/companents.dart';
import 'package:project/admin/addSource.dart';
import 'package:project/admin/addadrtoaroad.dart';
import 'package:project/admin/addmarker.dart';
import 'package:project/admin/addnewdriver.dart';
import 'package:project/admin/addroad.dart';
import 'package:project/cubit/admincubit/admincubit.dart';
import 'package:project/cubit/admincubit/adminstates.dart';
import 'package:project/login/login.dart';

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
            // drawer: Drawer(
            //   child: SingleChildScrollView(
            //       child: Column(
            //     children: [header(context), MyDrawerList(context)],
            //   )),
            // ),
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
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        casheHelber.removeData(key: 'uId').then((value) {
                          Nav(context, loginscreen());
                        });
                      },
                      child: Text("Logout")),
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
