import 'package:amazonprime/api/store_api.dart';
import 'package:amazonprime/core/colors/colors.dart';
import 'package:amazonprime/models/store_model.dart';
import 'package:amazonprime/presentation/pages/common_widgets/carousal_slider.dart';
import 'package:amazonprime/presentation/pages/common_widgets/choice_chips.dart';
import 'package:amazonprime/presentation/pages/common_widgets/common_widget_appbar.dart';
import 'package:amazonprime/presentation/pages/common_widgets/error.dart';
import 'package:amazonprime/presentation/pages/common_widgets/movie_container.dart';
import 'package:amazonprime/presentation/pages/common_widgets/movie_container_vertical.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late Future<List<Store>> popularStore;
  late Future<List<Store>> topRatedStore;
  late Future<List<Store>> spotlightStore;
  late Future<List<Store>> subscriptionStore;

  @override
  void initState() {
    super.initState();
    popularStore = StoreApi().getPoplarStore();
    topRatedStore = StoreApi().getTopRatedStore();
    spotlightStore = StoreApi().getSpotlightStore();
    subscriptionStore = StoreApi().getSubscriptionStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          child: AppBarWidget(
            goldencolour: true,
            title: 'Store',
            isImage: false,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 28, 66, 29), Colors.black],
            begin: Alignment.bottomCenter,
            end: Alignment.centerRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChoiceChips(chiptext: ['All', 'Rent', 'Channels']),
              const CarouselCustom(),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LionSgate Play - Limited time deal',
                      style: textstyleG,
                    ),
                    SizedBox(
                      child: FutureBuilder<List<Store>>(
                        future: popularStore,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: ErrorClass().errorLottie(),
                            );
                          } else if (snapshot.hasData) {
                            return MovieContainer(
                              snapshot: snapshot,
                              isFromHome: false,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'discovery+ - Most Popular',
                      style: textstyleG,
                    ),
                    SizedBox(
                      child: FutureBuilder<List<Store>>(
                        future: topRatedStore,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: ErrorClass().errorLottie(),
                            );
                          } else if (snapshot.hasData) {
                            return MovieContainer(
                              snapshot: snapshot,
                              isFromHome: false,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'In the spotlight',
                      style: textstyleG,
                    ),
                    SizedBox(
                      child: FutureBuilder<List<Store>>(
                        future: spotlightStore,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: ErrorClass().errorLottie(),
                            );
                          } else if (snapshot.hasData) {
                            return MovieContainerVertical(
                              snapshot: snapshot,
                              isFromHome: false,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Subscriptions',
                      style: textstyleG,
                    ),
                    SizedBox(
                      child: FutureBuilder<List<Store>>(
                        future: spotlightStore,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: ErrorClass().errorLottie(),
                            );
                          } else if (snapshot.hasData) {
                            return MovieContainer(
                              snapshot: snapshot,
                              isFromHome: false,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
