// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';

import '../utils/text.dart';

class Description extends StatelessWidget {
  final String backdrop_path, vote, title, release_date, poster_path,desc;
  const Description(
      {super.key,
      required this.backdrop_path,
      required this.vote,
      required this.title,
      required this.release_date,
      required this.poster_path,required this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            // Big Image
            Container(
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      backdrop_path,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                    bottom: 10,
                    child: modified_text(
                      text: '⭐ Average Rating - $vote',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),

            // Title And Realeasing
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: modified_text(
                  text: title != null ? title : 'Loading...',
                  color: Colors.white,
                  fontSize: 25),
            ),
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: modified_text(
                  text: 'Released On - ' + ' ' + release_date,
                  color: Colors.white,
                  fontSize: 15),
            ),
            SizedBox(height: 15),

            Container(
              child: Row(
                children: [
                  // image
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 100,
                      height: 200,
                      child: Image(
                        image: NetworkImage(poster_path)
                        )
                      ),
                  ),

                  // desc
                  Expanded(child: Text(desc))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
