import 'package:appaula05/data/restaurants_data.dart';
import 'package:appaula05/model/dish.dart';
import 'package:appaula05/ui/_core/appBar.dart';
import 'package:appaula05/ui/_core/app_colors.dart';
import 'package:appaula05/ui/widgets/main_dishes/main_dish_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDishesScreen extends StatelessWidget {
  const MainDishesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantData = Provider.of<RestaurantsData>(context);

    List<Dish> mainDishes = [];

    for (var restaurant in restaurantData.listRestaurant) {
      mainDishes.addAll(
        restaurant.dishes.where(
          (dish) => dish.category.toLowerCase() == 'principais',
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: getAppBar(context: context,title: 'Principais'),
     

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 24),

            const Text(
              'Principais',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Escolha seus pratos favorito',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: mainDishes.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum prato principal encontrado.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: mainDishes.length,

                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 16);
                      },

                      itemBuilder: (context, index) {
                        return MainDishWidget(
                          dish: mainDishes[index],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}