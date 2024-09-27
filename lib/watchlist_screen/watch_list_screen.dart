import 'package:flutter/material.dart';

class WatchlistScreen extends StatelessWidget {
  final List<Map<String, String>> movies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist',style: TextStyle(
          fontWeight: FontWeight.bold,color: Colors.grey
        ),),
        backgroundColor: Colors.black,
      ),
      body: movies.isEmpty
          ? Center(
        child: Text(
          'Your watchlist is empty.',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      )
          : ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(movies[index]['imageUrl']!),
            title: Text(movies[index]['title']!,
                style: TextStyle(color: Colors.white)),
            subtitle: Text(
              '${movies[index]['year']} \n${movies[index]['actors']}',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.check_box,
              color: Colors.orange,
            ),
          );
        },
      ),
      backgroundColor: Colors.black, // Black background
    );
  }
}

