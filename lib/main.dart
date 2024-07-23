import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpordous/user.dart';
import 'home_page.dart';

// types of Providers
// Provider - is great for accessing dependencies and objects that don’t change.
// State Provider - is great for storing simple state objects that can change,ideal for storing simple state variables, such as enums, strings, booleans, and numbers
// StateNotifier and StateNotifierProvider -  are ideal for managing state that may change in reaction to an event or user interaction.


//final nameProvider = Provider<String>((ref) => 'Augustine');
//final nameProvider = StateProvider<String?>((ref) => null);
final userProvider = StateNotifierProvider<UserNotifier, User>(
        (ref) => UserNotifier(),
);

void main(){
  runApp(
     ProviderScope(
          child:MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Tutorial',
      home: MyHomePage(),
    );
  }
}
