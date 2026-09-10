import 'package:appaula05/data/restaurants_data.dart';
import 'package:appaula05/ui/_core/app_theme.dart';
import 'package:appaula05/ui/widgets/bag_provider.dart';
import 'package:appaula05/ui/widgets/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Serve para carregar a tela do app sem ficar esperando o provider ou banco de dados
  RestaurantsData restaurantData = RestaurantsData();
  await restaurantData.getRestaurant();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) {
        return restaurantData;
      }),
      ChangeNotifierProvider(create: (context) => BagProvider())
    ],
    child: AppDelivery(),
  ));
}

class AppDelivery extends StatelessWidget {
  const AppDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
