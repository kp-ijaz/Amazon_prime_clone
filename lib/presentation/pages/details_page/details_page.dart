import 'package:amazonprime/api/constants.dart';
import 'package:flutter/material.dart';
import 'package:amazonprime/models/store_model.dart';
import 'package:amazonprime/models/movie.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  final Movie? movie;
  final Store? store;
  final bool? isFromHome;

  const DetailsPage({Key? key, this.movie, this.store, this.isFromHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? posterPath = isFromHome! ? movie?.poster : store?.poster;
    String posterUrl = posterPath != null && posterPath.isNotEmpty
        ? '${Constants.imagePath}$posterPath'
        : 'https://via.placeholder.com/150';

    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                    isFromHome!
                        ? movie?.movieName ?? ''
                        : store?.posterName ?? '',
                    style: GoogleFonts.belleza(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.network(
                    posterUrl,
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
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      isFromHome!
                          ? movie?.overview ?? ''
                          : store?.overview ?? '',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
