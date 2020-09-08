import 'package:covid_new_19/helpers/auth_provider.dart';
import 'package:covid_new_19/routes/app_routes.dart';
import 'package:covid_new_19/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) {
            return AuthProvider();
          },

        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid 19 App',
        initialRoute: SplashScreen.id,
        routes: myAppRoutes,
        theme: ThemeData(),
      ),
    ); // define it once at root level.
  }
}
///udate on query on location timer