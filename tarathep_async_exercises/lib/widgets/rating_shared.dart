import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ratings extends StatefulWidget {
  final Color defaultColor;
  final Color ratingColor;

  const Ratings({
    super.key,
    required this.defaultColor,
    required this.ratingColor,
  });

  @override
  _RatingsState createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  int _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _loadRating();
  }

  void _setRating(int index) {
    setState(() {
      if (_currentRating == index + 1) {
      } else {
        _currentRating = index + 1;
      }
      _saveRating(_currentRating);
    });
  }

  void _loadRating() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentRating = prefs.getInt('rating') ?? 0;
    });
  }

  void _saveRating(int rating) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('rating', rating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => _setRating(index),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.star,
              color: index < _currentRating
                  ? widget.ratingColor
                  : widget.defaultColor,
              size: 42.0,
            ),
          ),
        );
      }),
    );
  }
}
