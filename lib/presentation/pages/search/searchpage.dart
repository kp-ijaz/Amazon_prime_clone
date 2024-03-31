import 'package:amazonprime/api/search_api.dart';
import 'package:amazonprime/presentation/pages/common_widgets/common_widget_appbar.dart';
import 'package:amazonprime/presentation/pages/search/debounce.dart';
import 'package:amazonprime/presentation/pages/search/searchIdleWidget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          child: AppBarWidget(
            goldencolour: false,
            title: 'Search',
            isImage: false,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextFormField(
                onChanged: (value) {
                  _debouncer.run(() {
                    SearchApi().searchMovies(value);
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 27, 26, 26),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey,
                  ),
                  hintText: 'Search by actor, title...',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17.5,
                    fontWeight: FontWeight.w700,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const Expanded(child: SearchIdleWidget()),
          ],
        ),
      ),
    );
  }
}
