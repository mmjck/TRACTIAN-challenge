import 'package:flutter/material.dart';
import 'package:tree_view_application/src/core/utils/constants/keys_strings.dart';

class Search extends StatelessWidget {
  final Function(String) onSearchChanged;
  final Function(String) onSubmitted;

  const Search({
    super.key,
    required this.onSearchChanged,
    required this.onSubmitted,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        style: const TextStyle(fontWeight: FontWeight.normal),
        onChanged: onSearchChanged,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: KeysString.search,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromRGBO(234, 239, 243, 1),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
