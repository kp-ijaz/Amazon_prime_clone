import 'package:amazonprime/api/api.dart';
import 'package:amazonprime/core/colors/colors.dart';
import 'package:amazonprime/presentation/pages/common_widgets/choice_chips.dart';
import 'package:amazonprime/presentation/pages/common_widgets/error.dart';
// import 'package:amazonprime/presentation/pages/common_widgets/movie_container_vertical.dart';
import 'package:flutter/material.dart';
import '../../../models/movie.dart';
import '../common_widgets/carousal_slider.dart';
import '../common_widgets/common_widget_appbar.dart';
import '../common_widgets/movie_container.dart';
import '../common_widgets/movie_container_vertical.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> nowPlayingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> favouriteMovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    super.initState();
    nowPlayingMovies = Api().getnowPlayingMovies();
    popularMovies = Api().getPopularMovies();
    topRatedMovies = Api().gettopRatedMovies();
    favouriteMovies = Api().getFavouriteMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          child: AppBarWidget(
            goldencolour: false,
            isImage: true,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            const ChoiceChips(
              chiptext: ['All', 'Movies', 'TV shows'],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: CarouselCustom(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text('Prime - Now Playing', style: textstyle),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                child: FutureBuilder(
                    future: nowPlayingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: ErrorClass().errorLottie(),
                        );
                      } else if (snapshot.hasData) {
                        return MovieContainer(
                          snapshot: snapshot,
                          isFromHome: true,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ),
            Text(
              'Prime - popular',
              style: textstyle,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: ErrorClass().errorLottie(),
                      );
                    } else if (snapshot.hasData) {
                      return MovieContainer(
                        snapshot: snapshot,
                        isFromHome: true,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Text(
              'Prime - Top Rated',
              style: textstyle,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: ErrorClass().errorLottie(),
                      );
                    } else if (snapshot.hasData) {
                      return MovieContainerVertical(
                        isFromHome: true,
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Text(
              'Prime - All Time Favourites',
              style: textstyle,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: favouriteMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: ErrorClass().errorLottie(),
                      );
                    } else if (snapshot.hasData) {
                      return MovieContainerVertical(
                        isFromHome: true,
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Text(
              'Prime - Upcoming movies',
              style: textstyle,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: ErrorClass().errorLottie(),
                      );
                    } else if (snapshot.hasData) {
                      return MovieContainer(
                        snapshot: snapshot,
                        isFromHome: true,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            // Text(
            //   'Prime - Action and adventure\nmovies >',
            //   style: textstyle,
            // ),
            // const MovieContainer()
          ],
        ),
      ),
    );
  }
}
