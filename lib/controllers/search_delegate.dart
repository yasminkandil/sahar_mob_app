import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
List<String> searchTerms = [
	"PowerBank",
	"USB",
	"Mobile",
	"Salma",
	"Yasmin",
  "PowerBank",
  "Charger",
	"HeadPhones",
	"Rogina",
	"Karam"
];
	
// first overwrite to
// clear the search text
@override
List<Widget>? buildActions(BuildContext context) {
	return [
	IconButton(
		onPressed: () {
		query = '';
		},
		icon: Icon(Icons.clear),
	),
	];
}

// second overwrite to pop out of search menu
@override
Widget? buildLeading(BuildContext context) {
	return IconButton(
	onPressed: () {
		close(context, null);
	},
	icon: Icon(Icons.arrow_back),
	);
}

// third overwrite to show query result
@override
Widget buildResults(BuildContext context) {
	List<String> matchQuery = [];
	for (var value in searchTerms) {
	if (value.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(value);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result),
		);
	},
	);
}

// last overwrite to show the
// querying process at the runtime
//3shan yetala3 data w hwa b search
@override
Widget buildSuggestions(BuildContext context) {
	List<String> matchQuery = [];
	for (var value in searchTerms) {
	if (value.toLowerCase().contains(query.toLowerCase())) {
		matchQuery.add(value);
	}
	}
	return ListView.builder(
	itemCount: matchQuery.length,
	itemBuilder: (context, index) {
		var result = matchQuery[index];
		return ListTile(
		title: Text(result),
		);
	},
	);
}
}
