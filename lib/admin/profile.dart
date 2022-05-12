import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project/Shared/companents.dart';
import 'package:project/admin/showRoad.dart';
import 'package:project/cubit/admincubit/admincubit.dart';
import 'package:project/cubit/home/homecubit.dart';
import 'package:project/cubit/home/homestates.dart';
import 'package:project/home/Home.dart';
import 'package:project/models/drivermodel.dart';
import 'package:project/screens/feed.dart';

class profile extends StatelessWidget {
  drivermodel model;
  profile({required this.model});
  int number = 0;

  @override
  Widget build(BuildContext context) {
    homeCubit.get(context).checkRequest(m: model, context: context);
    homeCubit.get(context).setprofil(model);
    homeCubit.get(context).getUserData();

    // homeCubit.get(context).getprofiledata(model);
    print(homeCubit.get(context).isRequest);

    return BlocConsumer<homeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        print("siusiusua uisuidasuidui uiuia ${model.cuurent}");
        return Scaffold(
            appBar: AppBar(),
            drawer: Drawer(
              child: SingleChildScrollView(
                  child: Column(
                children: [header(context), MyDrawerList(context)],
              )),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                  child: ConditionalBuilder(
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          child: Container(
                            alignment: Alignment(0.0, 2.5),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage("${model.profile}"),
                              radius: 60.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "${model.name}",
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.blueGrey,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${model.bio}",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black45,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        " From ${model.from} ",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black45,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        " To ${model.to} ",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black45,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Phone ${model.phone}",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black45,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          // await homeCubit.get(context).setprofil(model);
                          NavegatorPush(
                              context,
                              showRoad(
                                model: model,
                              ));
                        },
                        child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 8.0),
                            elevation: 2.0,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 30),
                                child: Text(
                                  "Show A Road",
                                  style: TextStyle(
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w300),
                                ))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "People ${model.cuurent} /${model.n_o_passengers}",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black45,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              contactViaWhatsApp(
                                  context: context,
                                  phoneNumber: '+20 101 095 2433',
                                  description: 'Hy Man ');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.blue, Colors.green]),
                                borderRadius: BorderRadius.circular(80.0),
                              ),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 100.0,
                                  maxHeight: 40.0,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Contact me",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ),
                          // if (model.isset == true)
                          homeCubit.get(context).isRequest != true
                              ? RaisedButton(
                                  onPressed: () {
                                    var x = AlertDialog(
                                      title: Text(
                                        "Chosse The Number Of Child",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      content: Container(
                                        height: 140,
                                        child: ListView.separated(
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: TextButton.icon(
                                                    onPressed: () {
                                                      homeCubit
                                                          .get(context)
                                                          .requestTODriver(
                                                              model,
                                                              context,
                                                              index + 1);
                                                      Nav(context, Home());
                                                    },
                                                    icon: Icon(
                                                      Icons.child_care,
                                                      color: Colors.black,
                                                    ),
                                                    label: Text(
                                                      " ${index + 1} child",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                          itemCount: model.n_o_passengers -
                                              model.cuurent,
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return Container(
                                              height: 1,
                                              width: double.infinity,
                                              color: Colors.grey,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return x;
                                        });
                                    // homeCubit
                                    //     .get(context)
                                    //     .requestTODriver(model, context, 5);
                                    // Nav(context, Home());

                                    // print( u_model);
                                    // homeCubit.get(context).setDriverToRoad(model, context);
                                    // NavegatorPush(context, request(model: model,));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Colors.blue, Colors.green]),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 100.0,
                                        maxHeight: 40.0,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Request Bus",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                )
                              : RaisedButton(
                                  onPressed: () {
                                    homeCubit.get(context).canselRequest(
                                        m: model, context: context);
                                    Nav(context, Home());
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Colors.blue, Colors.green]),
                                      borderRadius: BorderRadius.circular(80.0),
                                    ),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 100.0,
                                        maxHeight: 40.0,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Cansel req ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                      // RatingBar.builder(
                      //   initialRating: 3,
                      //   minRating: 1,
                      //   direction: Axis.horizontal,
                      //   allowHalfRating: true,
                      //   itemCount: 5,
                      //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      //   itemBuilder: (context, _) => Icon(
                      //     Icons.star,
                      //     color: Colors.amber,
                      //   ),
                      //   onRatingUpdate: (rating) {
                      //     print(rating);
                      //   },
                      // )
                    ],
                  );
                },
                condition: state is! setprofilloading,
                fallback: (BuildContext context) {
                  return Center(child: CircularProgressIndicator());
                },
              )),
            ));
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
