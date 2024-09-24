import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'browse_cubit.dart';
import 'app_colors.dart';

class MoviesByGenreScreen extends StatelessWidget {
  final int genreId;
  final String genreName;

  MoviesByGenreScreen({required this.genreId, required this.genreName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(genreName),
        backgroundColor: AppColors.accentColor,
      ),
      body: BlocProvider(
        create: (context) => BrowseCubit()..loadMoviesByGenre(genreId),
        child: BlocBuilder<BrowseCubit, BrowseState>(
          builder: (context, state) {
            if (state is BrowseLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BrowseMoviesLoaded) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return ListTile(
                    leading: movie['poster_path'] != null
                        ? Image.network(
                      'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                      width: 50.w,
                    )
                        : SizedBox(width: 50.w), // Placeholder for no image
                    title: Text(movie['title']),
                    subtitle: Text('Rating: ${movie['vote_average']}'),
                  );
                },
              );
            } else if (state is BrowseError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(child: Text("No data available"));
            }
          },
        ),
      ),
    );
  }
}
