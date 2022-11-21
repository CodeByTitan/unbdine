import 'package:flutter/material.dart';
import '../auth/auth_screen.dart';
import '../../classes/university.dart';

class UNVSearchDelegate extends SearchDelegate {
  final List<University> universityList;

  UNVSearchDelegate(
    this.universityList,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<University> matchedUniversityList = [];

    for (var index = 0; index < universityList.length; index++,) {
      if ((universityList[index].name.toLowerCase().replaceAll(' ', ''))
          .contains(
        (query.toLowerCase().trim().replaceAll(' ', '')),
      )) {
        matchedUniversityList.add(universityList[index]);
      }
    }
    return SearchListBuilder(
      matchedList: matchedUniversityList,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<University> suggestedUniversityList = universityList.sublist(0, 5);
    List<University> matchedUniversityList = [];

    for (var index = 0; index < universityList.length; index++,) {
      if ((universityList[index].name.toLowerCase().replaceAll(' ', ''))
          .contains(
        (query.toLowerCase().trim().replaceAll(' ', '')),
      )) {
        matchedUniversityList.add(universityList[index]);
      }
    }
    return SearchListBuilder(
      matchedList:
          (query.isEmpty) ? suggestedUniversityList : matchedUniversityList,
    );
  }
}

class SearchListBuilder extends StatelessWidget {
  const SearchListBuilder({
    Key? key,
    required this.matchedList,
  }) : super(key: key);

  final List<University> matchedList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: ListView.builder(
        itemCount: matchedList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AuthenticationScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              left: 20,
              right: 20,
            ),
            child: Text(
              matchedList[index].name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }
}
