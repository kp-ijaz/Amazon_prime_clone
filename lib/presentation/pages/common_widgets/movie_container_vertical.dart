import 'package:flutter/material.dart';

import '../../../api/constants.dart';
import '../details_page/details_page.dart';

class MovieContainerVertical extends StatelessWidget {
  const MovieContainerVertical({Key? key, required this.snapshot})
      : super(key: key);
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            snapshot.data!.length,
            (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(movie: snapshot.data[index])));
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
                  ),
                )),
      ),
    );
  }
}
