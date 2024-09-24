import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiManager {
  static const String apiKey = 'c83ed93775649d77ef86afd6196fcdcc'; 
  static const String baseUrl = 'https://api.themoviedb.org/3';

  // Fetch genres from The Movie Database API
  static Future<List<dynamic>> getGenres() async {
    final url = Uri.parse('$baseUrl/genre/movie/list?api_key=$apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['genres'];
      } else {
        throw Exception('Failed to load genres');
      }
    } catch (error) {
      throw Exception('Error fetching genres: $error');
    }
  }

  // Fetch movies by genre from The Movie Database API
  static Future<List<dynamic>> getMoviesByGenre(int genreId) async {
    final url = Uri.parse('$baseUrl/discover/movie?api_key=$apiKey&with_genres=$genreId');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['results'];
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      throw Exception('Error fetching movies: $error');
    }
  }
}
