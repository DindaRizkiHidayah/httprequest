import 'package:flutter/material.dart';
import 'package:httprequest/pages/movie_detail.dart';
import 'package:httprequest/services/http_services.dart';

class MovieList extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: ListView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: Image.network('https://www.themoviedb.org/t/p/w600_and_h900_bestv2/'+
                movies[position].posterPath),
                title: Text(movies[position].originalTitle),
                subtitle:
                    Text('Rating = ' + movies[position].voteAverage.toString()),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ),
            );
          },
        ));
  }
}