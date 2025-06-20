import 'package:flutter/material.dart';
import 'package:giftit/models/ngo_search_suggestions.dart';

class SearchSuggestionsList extends StatefulWidget {
  final TextEditingController controller;
  final List<NgoSearchSuggestions> suggestions;
  final BuildContext parentContext;
  const SearchSuggestionsList(
      {super.key,
      required this.controller,
      required this.suggestions,
      required this.parentContext});

  @override
  State<SearchSuggestionsList> createState() => _SearchSuggestionsListState();
}

class _SearchSuggestionsListState extends State<SearchSuggestionsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = widget.suggestions[index];
        return ListTile(
          title: Text(suggestion.name),
          onTap: () {
            widget.controller.text = suggestion.name;
            FocusScope.of(widget.parentContext).unfocus();
          },
        );
      },
    );
  }
}
