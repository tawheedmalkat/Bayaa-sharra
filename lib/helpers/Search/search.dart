import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searching extends SearchDelegate {
  List names = ["Ali", "OLA", "WAEL", "WAEL", "WAEL", "WAEL"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String>? filterNames = names.where((element) => element.startsWith(query)).cast<String>().toList();
    return ListView.builder(
      itemBuilder: (context, i) {
        if (query == "") {
          return Container(
            margin: EdgeInsets.all(20),
            child: Text(
              names[i],
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else {
          return Text(
            filterNames[i],
            style: TextStyle(color: Colors.red, fontSize: 16),
          );
        }
      },
      itemCount: query.isEmpty ? names.length : filterNames.length,
    );
  }
}
