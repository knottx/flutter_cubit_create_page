import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_create_page/home_page.dart';
import 'package:flutter_cubit_create_page/session/session_cubit.dart';
import 'package:flutter_cubit_create_page/session/session_state.dart';
import 'package:flutter_cubit_create_page/theme.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Highlighter.initialize(['dart']);
  final highlighterLightTheme = await HighlighterTheme.loadLightTheme();
  final highlighterDarkTheme = await HighlighterTheme.loadDarkTheme();

  runApp(
    MyApp(
      highlighterDarkTheme: highlighterDarkTheme,
      highlighterLightTheme: highlighterLightTheme,
    ),
  );
}

class MyApp extends StatelessWidget {
  final HighlighterTheme highlighterDarkTheme;
  final HighlighterTheme highlighterLightTheme;

  const MyApp({
    super.key,
    required this.highlighterDarkTheme,
    required this.highlighterLightTheme,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionCubit(),
      child: MyAppView(
        highlighterDarkTheme: highlighterDarkTheme,
        highlighterLightTheme: highlighterLightTheme,
      ),
    );
  }
}

class MyAppView extends StatefulWidget {
  final HighlighterTheme highlighterDarkTheme;
  final HighlighterTheme highlighterLightTheme;

  const MyAppView({
    super.key,
    required this.highlighterDarkTheme,
    required this.highlighterLightTheme,
  });

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Get the brightness.
    final brightness = MediaQuery.of(context).platformBrightness;
    final cubit = context.read<SessionCubit>();
    switch (brightness) {
      case Brightness.dark:
        cubit.setThemeMode(ThemeMode.dark);
      case Brightness.light:
        cubit.setThemeMode(ThemeMode.light);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        const materialTheme = MaterialTheme(TextTheme());
        return MaterialApp(
          title: 'Flutter Cubit Create Page',
          theme: materialTheme.light(),
          darkTheme: materialTheme.dark(),
          themeMode: state.themeMode,
          home: HomePage(
            highlighter: Highlighter(
              language: 'dart',
              theme: state.themeMode == ThemeMode.dark
                  ? widget.highlighterDarkTheme
                  : widget.highlighterLightTheme,
            ),
          ),
        );
      },
    );
  }
}
