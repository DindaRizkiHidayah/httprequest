import 'package:flutter/material.dart';
import 'package:httprequest/models/movie.dart';
import 'package:httprequest/pages/rating.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previewsfleb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text(movie.originalTitle),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Row(
                children: <Widget>[
                  Text("Rating : " + movie.voteAverage.toString(),
                      style: TextStyle(fontSize: 17, color: Colors.black)),
                  Rating(rating: movie.voteAverage, color: Colors.yellow),
                ],
              ),
              Container(
                  child: Text(
                      "Language : " + movie.original_language.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  )),
              Container(
                  child: Center(child: Text(" Overview : \n" + movie.overview)),
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  )),
              Container(
                  child: Center(
                    child: Text("\n Release Date : " + movie.releaseDate,
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
