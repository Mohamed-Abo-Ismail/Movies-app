import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart';

class MovieService {
  final String apiKey = "b4ca05835a2567615491dbf40cf60fbb"; // Replace with your TMDb API key

  Future<List<Movie>> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> results = json.decode(response.body)['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}