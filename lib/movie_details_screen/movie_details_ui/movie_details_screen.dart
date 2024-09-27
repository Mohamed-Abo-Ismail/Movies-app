import 'package:flutter/material.dart';
import '../../home_screen/home_screen_api/api/api.dart';
import '../../home_screen/home_screen_api/model/movie_model.dart';
class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = 'MovieDetailsScreen';

  MovieDetailsScreen({
    super.key,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}
class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    topRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }
  List<String> genres = ['Adeventure', 'Mystery', 'Drama',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E1D),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Dora and the Lost City of Gold',
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/top image.png',
                ),
                const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 60,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dora and the Lost City of Gold',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "2022 • PG-13 • 2h 7m",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/side image.png',
                        width: 130,
                        height: 200,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 8.0,
                              children: genres.map((genre) {
                                return Chip(
                                  label: Text(
                                    genre,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: const Color(0xff514F4F),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Dora, a girl who has spent most of her life experience is good and she is in a high school so she is young  ',
                              style: const TextStyle(color: Color(0xff514F4F),fontWeight:FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '7.7', // Display the movie rating here
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
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
                                  "More Like This",
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
                                                        Image.network(
                                                            "https://image.tmdb.org/t/p/original/${movie.posterPath}"),
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

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
