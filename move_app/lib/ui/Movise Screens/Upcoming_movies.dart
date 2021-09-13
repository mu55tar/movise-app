import 'package:flutter/material.dart';
import 'package:move_app/ui/description.dart';

class Movies_Upcoming extends StatelessWidget {
  final List upcoming_movies;
  const Movies_Upcoming({
    Key key,
    this.upcoming_movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming Movies",
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: upcoming_movies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: upcoming_movies[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      upcoming_movies[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      upcoming_movies[index]['poster_path'],
                                  description: upcoming_movies[index]
                                      ['overview'],
                                  vote: upcoming_movies[index]['vote_average']
                                      .toString(),
                                  launch_on: upcoming_movies[index]
                                      ['release_date'],
                                )));
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          upcoming_movies[index]
                                              ['poster_path']))),
                        ),
                        SizedBox(height: 5),
                        Container(
                            child: Text(upcoming_movies[index]['title'] != null
                                ? upcoming_movies[index]['title']
                                : 'Loading'))
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
