import 'package:flutter/material.dart';

class IndexTrackerViewModel extends ChangeNotifier{
  // Holds the initial index state of property that needs it
  int _currentIndex = 0;

  /// This get the current index that has been captured
  int get currentIndex => _currentIndex;

  /// This helps to set the index to something new
  void setIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
  
}