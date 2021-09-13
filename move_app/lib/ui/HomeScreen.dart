import 'package:flutter/material.dart';
import 'package:move_app/ui/Movise%20Screens/Toprated_movies.dart';
import 'package:move_app/ui/Movise%20Screens/Upcoming_movies.dart';
import 'package:move_app/ui/Movise%20Screens/popular_movies.dart';
import 'package:move_app/ui/TV%20Screens/Latest_tv.dart';
import 'package:move_app/ui/TV%20Screens/Toprated_tv.dart';
import 'package:move_app/ui/TV%20Screens/popular_tv.dart';

import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List populargmovies = [];
  List topratedmovies = [];
  List upcomingmovies = [];

  List populartv = [];
  List topratedtv = [];
  List latesttv = [];

  final String apikey = 'b8162a063744d1dec3d218c107a9417d';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODE2MmEwNjM3NDRkMWRlYzNkMjE4YzEwN2E5NDE3ZCIsInN1YiI6IjYxM2NiOTRiOTY1M2Y2MDA2OGNiMjM5OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pdEXAZnEK6s51wbhpdnJnaU_EYVTtqDazlpiCDBlHYI';

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map populargmovies_result = await tmdbWithCustomLogs.v3.movies.getPouplar();
    Map topratedmovies_result =
        await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map upcomingmovies_result =
        await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map populartv_result = await tmdbWithCustomLogs.v3.tv.getPouplar();
    Map topratedtv_result = await tmdbWithCustomLogs.v3.tv.getTopRated();

    Map latesttv_result = await tmdbWithCustomLogs.v3.tv.getLatest();

    //print((trendingresult));
    setState(() {
      populargmovies = populargmovies_result['results'];
      topratedmovies = topratedmovies_result['results'];
      upcomingmovies = upcomingmovies_result['results'];
      populartv = populartv_result['results'];
      topratedtv = topratedtv_result['results'];
      latesttv = latesttv_result['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Flutter Move App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            color: Colors.greenAccent,
            child: Text(
              "Movies",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Movies_popular(popular_movies: populargmovies),
          Movies_Toprated(toprated_movies: topratedmovies),
          Movies_Upcoming(upcoming_movies: upcomingmovies),
          Container(
            height: 50,
            color: Colors.blueGrey,
            child: Text(
              "TV",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Tv_Popular(popular_tv: populartv),
          Tv_Torated(toprated_tv: topratedtv)
        ],
      ),
    );
  }
}
