import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custome_buttom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/top image.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset('assets/play-button.png'),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: Stack(children: [
                      Image.asset(
                        'assets/side image.png',
                        height: 150,
                        width: 95,
                      ),
                      const Icon(
                        Icons.bookmark_sharp,
                        size: 30,
                        color: Color(0xff514F4F),
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.white70,
                        size: 25,
                      )
                    ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Positioned(
                bottom: 20,
                left: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dora and the lost city of gold',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '2019  PG-13  2h 7m',
                      style: TextStyle(
                        color: Color(0xffB5B4B4),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                color: const Color(0xff282A28),
                width: double.infinity,
                height: 24,
                child: Padding(
                  padding: const EdgeInsets.only(right: 220, top: 10, left: 10),
                  child: Text(
                    "New Releases",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: const Color(0xff282A28),
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Expanded(
                              child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(12), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(48), // Image radius
                              child: Stack(children: [
                                Image.asset('assets/movie 0ne.png'),
                                const Icon(
                                  Icons.bookmark_sharp,
                                  size: 30,
                                  color: Color(0xff514F4F),
                                ),
                                const Icon(
                                  Icons.add,
                                  color: Colors.white70,
                                  size: 25,
                                )
                              ]),
                            ),
                          ) // Placeholder image asset
                              ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                color: const Color(0xff282A28),
                width: double.infinity,
                height: 25,
                child: const Padding(
                  padding: EdgeInsets.only(right: 200, top: 10, left: 10),
                  child: Text(
                    "Recomended",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                color: const Color(0xff282A28),
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Expanded(
                              child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(12), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(48), // Image radius
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Image.asset('assets/movie 0ne.png'),
                                    Container(
                                      height: 70,
                                      width: 100,
                                      color: Colors.black26,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 20,
                                                color: (Color(0xffFFBB3B)),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                '7.7',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'DeadPool 2',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text('2018  R  1h 59m',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10))
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const Icon(
                                  Icons.bookmark_sharp,
                                  size: 30,
                                  color: Color(0xff514F4F),
                                ),
                                const Icon(
                                  Icons.add,
                                  color: Colors.white70,
                                  size: 25,
                                ),
                              ]),
                            ),
                          ) // Placeholder image asset
                              ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
