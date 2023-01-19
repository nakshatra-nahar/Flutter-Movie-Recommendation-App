import 'package:flutter/material.dart';
import 'package:show_me_that/utils/text.dart';
import 'package:show_me_that/widget/trending.dart';
import 'package:show_me_that/widget/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'widget/topRatedMovies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovie = [];
  List topRatedMovies = [];
  List popularTvShows = [];
  final String apikey = 'c79e05b3980aaf0bde1ee2c3d13c118d';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNzllMDViMzk4MGFhZjBiZGUxZWUyYzNkMTNjMTE4ZCIsInN1YiI6IjYzYzgxYzU0MTQyZWYxMDBiZDE 4OWEwZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.z_O5xzHzPvYnIu2kTDO3Tlmwb0i0cRhYtmQ0VYa0SOI';
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccessToken),
        logConfig: ConfigLogger(
            showErrorLogs: true,
            showInfoLogs: true,
            showLogs: true,
            showWarningLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedMovie = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map popularTvShow = await tmdbWithCustomLogs.v3.tv.getPopular();
    print(trendingResult);
    print('--------------------------');
    print(topRatedMovie);
    print('--------------------------');
    print(popularTvShow);

    setState(() {
      trendingMovie = trendingResult['results'];
      topRatedMovies = topRatedMovie['results'];
      popularTvShows = popularTvShow['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: modified_text(text: 'Let Me Watch This', color: Colors.white, fontSize: 20),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          topRateMovies(
            topRatedMovies: topRatedMovies,
          ),
          TrendingMovies(
            trending: trendingMovie,
          ),
          tv(
            popularTvShowss: popularTvShows,
          ),
        ],
      ),
    );
  }
}
