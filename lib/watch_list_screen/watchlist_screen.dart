
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  final CollectionReference _moviesCollection =
  FirebaseFirestore.instance.collection('movies');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Watchlist'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _moviesCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      leading: Image.network(doc['posterUrl'], width: 50),
                      title: Text(doc['title'] ?? 'Untitled'),
                      subtitle: Text(doc['year'].toString()),
                    );
                  }).toList(),
                );
              }

              return const Center(child: Text("No movies in your watchlist."));
            },
            ),
        );
    }
}
