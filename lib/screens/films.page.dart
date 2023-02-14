import 'package:flutter/material.dart';
import 'package:projet1/films.screens/topRatedMovies.dart';
import 'package:projet1/films.screens/trendingMovies.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../films.screens/tvMovies.dart';
import '../models/text.movies.dart';


class FilmPage extends StatefulWidget {
  const FilmPage({Key? key}) : super(key: key);

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  List trendingMovies=[];
  final String apikey='0effbfaa859aa3df21511033eeb20b37';
  final readAccessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZWZmYmZhYTg1OWFhM2RmMjE1MTEwMzNlZWIyMGIzNyIsInN1YiI6IjYyNzY5MWFiMTc2YTk0MDA1MDQ2YzM1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CEEnu6v2ugww8_mREF-VWQ_vVzC2y9wUFJDFYmnYBcA';
  List topRatedMovies = [];
  List tv = [];
  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: ModifiedText(text: 'Movies', color:Colors.white, size:20,),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView(
          children: [
            tvMovies(tv: tv),
            TrendingMovies(
              trending: trendingMovies,
            ),
            TopRatedMovies(
              toprated: topRatedMovies,
            ),
          ],
        ));
  }
}