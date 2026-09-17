import 'package:appaula05/data/restaurants_data.dart';
import 'package:appaula05/model/dish.dart';
import 'package:appaula05/ui/_core/appBar.dart';
import 'package:appaula05/ui/_core/app_colors.dart';
import 'package:appaula05/ui/widgets/beverages/beverage_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantData = Provider.of<RestaurantsData>(context);

    List<Dish> beverages = [];

    for (var restaurant in restaurantData.listRestaurant) {
      beverages.addAll(
        restaurant.dishes.where(
          (dish) => dish.category.toLowerCase() == 'bebidas',
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: getAppBar(context: context,title: 'Bebidas'),
     

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 24),

            const Text(
              'Bebidas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Escolha sua bebida favorita',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: beverages.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhuma bebida encontrada.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: beverages.length,

                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 16);
                      },

                      itemBuilder: (context, index) {
                        return BeverageWidget(
                          dish: beverages[index],
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