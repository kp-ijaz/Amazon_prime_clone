import 'package:amazonprime/api/search_api.dart';
import 'package:amazonprime/models/searchrespo/searchrespo.dart';
import 'package:flutter/material.dart';

const imageurl =
    'https://media.themoviedb.org/t/p/w250_and_h141_face/en971MEXui9diirXlogOrPKmsEn.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Top Searches',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: SearchApi().searchResultListNotifier,
            builder: (BuildContext context, List<SearchResultData> newList,
                Widget? _) {
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = newList[index];
                  return TopSearchItemTile(
                    backdropPath: data.backdropPath ?? '',
                    originalTitle: data.originalTitle ?? '',
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: newList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String backdropPath;
  final String originalTitle;

  const TopSearchItemTile({
    Key? key,
    required this.backdropPath,
    required this.originalTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(backdropPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            originalTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Icon(
          Icons.play_circle_outline_rounded,
          color: Colors.white,
          size: 35,
        )
      ],
    );
  }
}
