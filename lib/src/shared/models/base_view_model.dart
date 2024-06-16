import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  void onInit();

  @override
  void dispose() {
    //
    super.dispose();
  }
}
