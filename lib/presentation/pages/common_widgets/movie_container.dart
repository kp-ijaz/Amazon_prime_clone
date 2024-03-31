import 'package:amazonprime/presentation/pages/details_page/details_page.dart';
import 'package:flutter/material.dart';
import 'package:amazonprime/api/constants.dart';
import 'package:amazonprime/models/store_model.dart';
import 'package:amazonprime/models/movie.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer(
      {Key? key, required this.snapshot, required this.isFromHome})
      : super(key: key);

  final AsyncSnapshot snapshot;
  final bool isFromHome;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(snapshot.data!.length, (index) {
          final dynamic item = snapshot.data![index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    movie: item is Movie ? item : null,
                    store: item is Store ? item : null,
                    isFromHome: isFromHome,
                  ),
                ),
              );
            },
            child: Container(
              width: 200,
              height: 120,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.network(
                '${Constants.imagePath}${item.backdrop}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}
