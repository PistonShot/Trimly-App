import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trimly/Provider/selected_service.dart';
import 'package:trimly/main_screen/main_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trimly',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: MultiProvider(providers: [
        Provider<SelectedService>(create: (_) => SelectedService())
      ], child: const MainScreen()),
    );
  }
}
