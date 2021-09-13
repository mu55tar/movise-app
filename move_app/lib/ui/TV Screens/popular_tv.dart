import 'package:flutter/material.dart';
import 'package:move_app/ui/description.dart';

class Tv_Popular extends StatelessWidget {
  final List popular_tv;
  const Tv_Popular({
    Key key,
    this.popular_tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular TV",
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popular_tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: popular_tv[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      popular_tv[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      popular_tv[index]['poster_path'],
                                  description: popular_tv[index]['overview'],
                                  vote: popular_tv[index]['vote_average']
                                      .toString(),
                                  launch_on: popular_tv[index]['release_date'],
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
                                          popular_tv[index]['poster_path']))),
                        ),
                        SizedBox(height: 5),
                        Container(
                            child: Text(popular_tv[index]['title'] != null
                                ? popular_tv[index]['title']
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
