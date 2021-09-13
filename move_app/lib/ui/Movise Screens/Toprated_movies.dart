import 'package:flutter/material.dart';
import 'package:move_app/ui/description.dart';

class Movies_Toprated extends StatelessWidget {
  final List toprated_movies;
  const Movies_Toprated({
    Key key,
    this.toprated_movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Rated Movies",
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated_movies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: toprated_movies[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated_movies[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated_movies[index]['poster_path'],
                                  description: toprated_movies[index]
                                      ['overview'],
                                  vote: toprated_movies[index]['vote_average']
                                      .toString(),
                                  launch_on: toprated_movies[index]
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
                                          toprated_movies[index]
                                              ['poster_path']))),
                        ),
                        SizedBox(height: 5),
                        Container(
                            child: Text(toprated_movies[index]['title'] != null
                                ? toprated_movies[index]['title']
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
