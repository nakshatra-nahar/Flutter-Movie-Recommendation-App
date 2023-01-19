import 'package:flutter/material.dart';

import 'package:show_me_that/utils/text.dart';
import 'package:show_me_that/widget/Description.dart';

class topRateMovies extends StatelessWidget {
  final List topRatedMovies;

  const topRateMovies({Key? key, required this.topRatedMovies})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: 'Top Rated Movies', color: Colors.white, fontSize: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRatedMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(backdrop_path: 'https://image.tmdb.org/t/p/w500' +topRatedMovies[index]['backdrop_path'], vote: topRatedMovies[index]['vote_average'].toString(),title: topRatedMovies[index]['title'].toString(), release_date: topRatedMovies[index]['release_date'].toString(), poster_path: 'https://image.tmdb.org/t/p/w500' +topRatedMovies[index]['poster_path'], desc: topRatedMovies[index]['overview'],)),
                    );
                  },
                  child: Hero(
                    tag: topRatedMovies[index]['backdrop_path'],
                    child: Container(
                      width: 250,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              width: 250,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            topRatedMovies[index]
                                                ['backdrop_path']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: modified_text(
                              fontSize: 15,
                              text: topRatedMovies[index]['title'] != null
                                  ? topRatedMovies[index]['title']
                                  : 'Loading',
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
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
