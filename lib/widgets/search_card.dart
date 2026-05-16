import 'package:flutter/material.dart';

class SearchCard extends StatefulWidget {
  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  final TextEditingController _searchControl = TextEditingController();
  bool _hasText = false;

  void _onTextChanged() {
    final hasTextNow = _searchControl.text.isNotEmpty;
    if (hasTextNow != _hasText) {
      setState(() {
        _hasText = hasTextNow;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _searchControl.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _searchControl.removeListener(_onTextChanged);
    _searchControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Search..",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon: _hasText
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _searchControl.clear();
                    },
                  )
                : Icon(
                    Icons.filter_list,
                    color: Colors.black,
                  ),
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          maxLines: 1,
          controller: _searchControl,
        ),
      ),
    );
  }
}
