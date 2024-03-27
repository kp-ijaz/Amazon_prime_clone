import 'package:amazonprime/api/constants.dart';
import 'package:amazonprime/presentation/pages/details_page/details_page.dart';
import 'package:flutter/material.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(snapshot.data!.length, (index) {
          // if (isText) {
          //   return Container(
          //         width: 200,
          //         height: 120,
          //         margin: const EdgeInsets.all(4),
          //         decoration: BoxDecoration(
          //           color: Colors.amber,
          //           borderRadius: BorderRadius.circular(5),
          //         ),
          //         child: Stack(
          //           children: [
          //             Image.network(
          //               '${Constants.imagePath}${snapshot.data![index].poster}',
          //               fit: BoxFit.cover,
          //               width: double.infinity,
          //               height: double.infinity,
          //             ),
          //             Align(
          //               alignment: Alignment.bottomLeft,
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text(
          //                   lang[index],
          //                   style: const TextStyle(
          //                     color: Color.fromARGB(255, 255, 255, 255),
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          // } else {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsPage(movie: snapshot.data[index])));
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
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data![index].backdrop}'),
            ),
          );
        }),
      ),
    );
  }
}

// List<String> lang = [
//   'Hindi',
//   'English',
//   'Telugu',
//   'Tamil',
//   'Malayalam',
//   'Kannada',
//   'Marathi',
//   'Punjabi',
//   'Bengali',
//   'Gujarati',
//   'International'
// ];
