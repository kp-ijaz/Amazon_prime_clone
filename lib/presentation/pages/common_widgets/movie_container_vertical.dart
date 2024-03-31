import 'package:amazonprime/models/movie.dart';
import 'package:amazonprime/models/store_model.dart';
import 'package:flutter/material.dart';

import '../../../api/constants.dart';
import '../details_page/details_page.dart';

class MovieContainerVertical extends StatelessWidget {
  const MovieContainerVertical(
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
                width: 139,
                height: 219,
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${snapshot.data![index].poster}'),
              ));
        }),
      ),
    );
  }
}
