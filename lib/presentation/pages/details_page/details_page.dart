import 'package:amazonprime/api/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/movie.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 16, left: 16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  movie.movieName.toString(),
                  style: GoogleFonts.belleza(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                child: Image.network(
                  '${Constants.imagePath}${movie.poster}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Overview',
                      style: GoogleFonts.openSans(
                          fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    movie.overview.toString(),
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.w400),
                    // textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
