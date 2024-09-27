import 'package:flutter/material.dart';
import '../../movie_details_screen/movie_details_ui/movie_details_screen.dart';
import '../../search_screen/search.dart';
import '../home_screen_api/api/api.dart';
import '../home_screen_api/model/movie_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'MovieDetailsScreen';
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 140,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      child: Image.asset(
                        'assets/top image.png',
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed(SearchScreen.routeName);
                      },
                    ),
                    Image.asset('assets/play-button.png'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Stack(children: [
                    Icon(
                      Icons.bookmark_sharp,
                      size: 30,
                      color: Color(0xff514F4F),
                    ),
                    Image.asset(
                      'assets/side image.png',
                      height: 150,
                      width: 95,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.white70,
                      size: 25,
                    ),
                  ]),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        'Dora and the lost city of gold ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '2019  PG-13  2h 7m',
                        style: TextStyle(
                          color: Color(0xffB5B4B4),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 7),
              Container(
                color: Color(0xff282A28),
                height: 190,
                child: FutureBuilder(
                    future: upcomingMovies,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final movies = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15),
                            child: Text(
                              "New Releases",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                final movie = movies[index];
                                return Container(
                                  width: 120,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            12), // Image border
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(
                                              48), // Image radius
                                          child: Stack(children: [
                                            InkWell(
                                              child: Image.network(
                                                  "https://image.tmdb.org/t/p/original/${movie.posterPath}"),
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailsScreen()));
                                              },
                                            ),

                                            Icon(
                                              Icons.bookmark_sharp,
                                              size: 30,
                                              color: Color(0xff514F4F),
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: Colors.white70,
                                              size: 27,
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
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xff282A28),
                height: 320,
                child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final movies = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15),
                            child: Text(
                              "Recommended",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                final movie = movies[index];
                                return Container(
                                  width: 120,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            12), // Image border
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(
                                              48), // Image radius
                                          child: Column(
                                            children: [
                                              Stack(children: [
                                                InkWell(
                                                  child: Image.network(
                                                      "https://image.tmdb.org/t/p/original/${movie.posterPath}"),
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailsScreen()));
                                                  },
                                                ),
                                                Icon(
                                                  Icons.bookmark_sharp,
                                                  size: 30,
                                                  color: Color(0xff514F4F),
                                                ),
                                                Icon(
                                                  Icons.add,
                                                  color: Colors.white70,
                                                  size: 25,
                                                )
                                              ]),
                                              Container(
                                                height: 110,
                                                color: Color(0xff514F4F)
                                                    .withOpacity(0.16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.star,
                                                            color: Colors.amber,
                                                            size: 16),
                                                        SizedBox(width: 4),
                                                        Text(
                                                          "7.7",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      movie.title,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ) // Placeholder image asset
                                          ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
