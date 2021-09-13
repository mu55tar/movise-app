import 'package:flutter/material.dart';
import 'package:move_app/ui/description.dart';

class Tv_Torated extends StatelessWidget {
  final List toprated_tv;
  const Tv_Torated({
    Key key,
    this.toprated_tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Rated TV",
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated_tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: toprated_tv[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated_tv[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      toprated_tv[index]['poster_path'],
                                  description: toprated_tv[index]['overview'],
                                  vote: toprated_tv[index]['vote_average']
                                      .toString(),
                                  launch_on: toprated_tv[index]['release_date'],
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
                                          toprated_tv[index]['poster_path']))),
                        ),
                        SizedBox(height: 5),
                        Container(
                            child: Text(toprated_tv[index]['title'] != null
                                ? toprated_tv[index]['title']
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
