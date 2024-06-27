import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNoftifier extends StateNotifier<ThemeMode>{
  ThemeNoftifier() : super(ThemeMode.light);

  void toggleTheme(){

    if(state == ThemeMode.light){
      state = ThemeMode.dark;
    }
    else{

      state = ThemeMode.light;
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNoftifier,ThemeMode>((ref) {
  return  ThemeNoftifier();
});