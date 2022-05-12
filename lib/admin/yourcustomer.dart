import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Shared/companents.dart';
import 'package:project/admin/customerprofile.dart';
import 'package:project/cubit/home/homecubit.dart';
import 'package:project/cubit/home/homestates.dart';
import 'package:project/models/usermodel.dart';

class yourcustomer extends StatelessWidget {
  // const yourcustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // homeCubit.get(context).getallusers();

    homeCubit.get(context).getcustomer();
    // FirebaseFirestore.instance
    //     .collection("driver")
    //     .doc(u_model!.uId)
    //     .collection("users")
    //     .get()
    //     .then((value) {});
    // print("object");
    // print(homeCubit.get(context).customer.length);

    return BlocConsumer<homeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          drawer: Drawer(
            child: SingleChildScrollView(
                child: Column(
              children: [header(context), MyDrawerList(context)],
            )),
          ),
          appBar: AppBar(),
          body: ConditionalBuilder(
            builder: (BuildContext context) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return cust(
                      context, homeCubit.get(context).customer[index], state);
                },
                itemCount: homeCubit.get(context).customer.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 1,
                    width: double.infinity,
                    color: Theme.of(context).backgroundColor,
                  );
                },
              );
            },
            condition: state is! getcustomerLoading,
            fallback: (BuildContext context) {
              return Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}

Widget cust(context, usermodel model, state) => Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              NavegatorPush(context, customerprof(model: model));
            },
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage("${model.profile}"),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${model.name}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "${model.bio}",
              style: TextStyle(fontSize: 14, color: Colors.grey[650]),
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {
            homeCubit.get(context).getnumberofRequest(model: model);
            var x = AlertDialog(
              title: Text(
                "The number Of child ",
                style: TextStyle(color: Colors.black),
              ),
              content: Container(
                  height: 140,
                  child: ConditionalBuilder(
                    builder: (BuildContext context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${homeCubit.get(context).nuberofreq}",
                            style: TextStyle(fontSize: 80),
                          ),
                          Icon(
                            Icons.child_care,
                            size: 80,
                          ),
                        ],
                      );
                    },
                    condition: state is! getnumberofRequestLoading,
                    fallback: (BuildContext context) {
                      return Center(child: CircularProgressIndicator());
                    },
                  )),
            );
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return x;
                });
          },
          child: Text(
            "Show",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
