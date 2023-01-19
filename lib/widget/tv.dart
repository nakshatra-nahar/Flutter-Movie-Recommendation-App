import 'package:flutter/material.dart';

import 'package:show_me_that/utils/text.dart';

class tv extends StatelessWidget {
  final List popularTvShowss;

  const tv({Key? key, required this.popularTvShowss}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Popular TV Shows', color: Colors.white, fontSize: 26),
          SizedBox(height: 10,),
          Container(
            height: 290,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularTvShowss.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      popularTvShowss[index]['poster_path']),
                            ),
                          ),
                          height: 200,
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: modified_text(
                              fontSize: 15,
                              text: popularTvShowss[index]['original_name'] != null
                                  ? popularTvShowss[index]['original_name']
                                  : 'Loading', color: Colors.white,),
                        ),
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
