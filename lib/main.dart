import 'package:flutter/material.dart';
import 'package:flutter_cubit_create_page/home_page.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Highlighter.initialize(['dart']);
  var theme = await HighlighterTheme.loadDarkTheme();
  var highlighter = Highlighter(
    language: 'dart',
    theme: theme,
  );

  runApp(
    MaterialApp(
      title: 'Flutter Cubit Create Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: HomePage(highlighter: highlighter),
    ),
  );
}
