import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/count_provider.dart';
import 'package:provider_practice/provider/example_one_provider.dart';
import 'package:provider_practice/provider/favourite_provider.dart';
import 'package:provider_practice/provider/theme_changer_provider.dart';
import 'package:provider_practice/screens/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ExampleOneProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavouriteItemProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeChangerProvider(),
          ),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            title: 'Provider Practice / Stateless widget',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red,
              iconTheme: const IconThemeData(color: Colors.red),
            ),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.purple,
                primaryColor: Colors.pink,
                iconTheme: const IconThemeData(color: Colors.amber),
                appBarTheme: const AppBarTheme(backgroundColor: Colors.teal)),
            home: const DarkThemeScreen(),
          );
        }));
  }
}














// ---------> For Single Provider

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => CountProvider(),
//       child: MaterialApp(
//         title: 'Provider Practice / Stateless widget',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const ExampleOne(),
//       ),
//     );
//   }
// }
