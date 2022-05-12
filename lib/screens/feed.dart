import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/Shared/companents.dart';
import 'package:project/admin/Show.dart';
import 'package:project/admin/tagrebi.dart';
import 'package:project/admin/yourcustomer.dart';
import 'package:project/bottomscreen/becomedriver/becameadriver.dart';
import 'package:project/cubit/home/homecubit.dart';
import 'package:project/cubit/home/homestates.dart';

class feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> photo = [
      'https://cdn.shopify.com/s/files/1/0126/3108/1019/files/vision2_grande.png?v=1540488529',
      'https://assetscdn1.paytm.com/images/catalog/view_item/788861/1629292559088.jpg',
      'https://miro.medium.com/max/700/1*S-95TWd9jgxT87cKkZWnFg.jpeg',
      'https://img.freepik.com/free-vector/multinational-kids-going-school-arabic-japanese-chinese-group-happy-smile-childhood-vector-illustration_1284-42348.jpg?w=826&t=st=1652232179~exp=1652232779~hmac=711092c1cc09cb6c36f7bb95ed171d1d677444bd3487b5cc762c53019d220f15',
      'https://cdn.vectorstock.com/i/1000x1000/80/79/mother-driving-with-her-children-vector-21668079.webp',
      'https://en.pimg.jp/048/651/103/1/48651103.jpg',
      'https://media.istockphoto.com/vectors/people-driving-car-with-phrase-i-drive-fast-vector-id838063602?s=612x612',
      'https://i.pinimg.com/originals/1f/7f/b6/1f7fb622f260cbc4002d210c0ff0b71a.jpg',
      'https://cdn2.adrianflux.co.uk/wp-learner-driver/uploads/2019/10/AF5948-LDH-How-long-does-it-take-to-learn-to-drive--930x507.png',
      'https://cdn2.adrianflux.co.uk/wp-learner-driver/uploads/2019/10/Learner-Driver-Linkable-Asset-Illustration.png'
    ];
    // print("Uid is ${u_model}");
    // homeCubit.get(context).getUserData();
    return BlocConsumer<homeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 250.0,
                    autoPlay: true,
                    aspectRatio: 90,
                  ),
                  items: photo.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          // height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            image: DecorationImage(
                                image: NetworkImage("$i"),
                                fit: BoxFit.cover,
                                scale: 1),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 22,
                ),
                if (u_model?.isdriver == false)
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.teal,
                      // gradient: const LinearGradient(
                      //     colors: [Colors.blue, Colors.green]),
                    ),
                    child: TextButton(
                        onPressed: () {
                          NavegatorPush(context, becameadriverscreen());
                        },
                        child: Text(
                          "Became a Driver",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),
                if (u_model?.isdriver == true)
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.teal,
                      // gradient: const LinearGradient(
                      //     colors: [Colors.blue, Colors.green]),
                    ),
                    child: TextButton(
                        onPressed: () {
                          NavegatorPush(context, yourcustomer());
                        },
                        child: Text(
                          "show Your Customer",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                  ),

                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.teal,
                  ),
                  child: TextButton(
                      onPressed: () {
                        // homeCubit.get(context).getsiusiu();
                        homeCubit.get(context).getUserData();
                      },
                      child: Text(
                        "Siu ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.teal,
                  ),
                  child: TextButton(
                    onPressed: () {
                      NavegatorPush(context, mapshow());
                    },
                    child: Text(
                      "GEt A School Ya Ragel ya sIu",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                // GridView.count(
                //   shrinkWrap: true,
                //   childAspectRatio: 1 / 1.77,
                //   physics: NeverScrollableScrollPhysics(),
                //   crossAxisCount: 3,
                //   mainAxisSpacing: 10,
                //   crossAxisSpacing: 10,
                //   children: [
                //     Container(
                //       color: Colors.teal,
                //       child: TextButton(
                //           onPressed: () {
                //             NavegatorPush(context, becameadriverscreen());
                //           },
                //           child: Text(
                //             "Became a Driver",
                //             style: Theme.of(context).textTheme.bodyLarge,
                //           )),
                //     ),
                //     Container(
                //       color: Colors.tealAccent,
                //       child: TextButton(
                //           onPressed: () {
                //             homeCubit.get(context).getUserData();
                //           },
                //           child: Text(
                //             "Siu ",
                //             style: Theme.of(context).textTheme.bodyLarge,
                //           )),
                //     ),
                //     Container(
                //       color: Colors.teal,
                //       child: TextButton(
                //         onPressed: () {
                //           NavegatorPush(context, mapshow());
                //         },
                //         child: Text(
                //           "GEt A School Ya Ragel ya sIu",
                //           style: Theme.of(context).textTheme.bodyLarge,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
