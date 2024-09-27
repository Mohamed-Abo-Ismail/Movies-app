import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_service.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'Search_Screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  final MovieService movieService = MovieService();
  List<Movie> movies = [];
  bool isLoading = false;

  void _searchMovies() async {
    setState(() {
      isLoading = true;
    });

    try {
      final movies = await movieService.searchMovies(controller.text);
      setState(() {
      });
    } catch (e) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121312),
        elevation: 0,
        toolbarHeight: 35,
      ),
      body: Container(
        color: const Color(0xff121312),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: const Color(0xff121312),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.white),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: controller,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                              ),
                              onSubmitted: (_) => _searchMovies(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
              child: movies.isEmpty
                  ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_movies, size: 100, color: Color(0xffB5B4B4)),
                    SizedBox(height: 20),
                    Text(
                      'No movies found',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return ListTile(
                    title: Text(movie.title, style: const TextStyle(color: Colors.white)),
                    leading: movie.posterPath != null
                        ? Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}')
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
