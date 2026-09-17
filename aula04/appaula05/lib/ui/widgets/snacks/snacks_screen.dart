import 'package:appaula05/data/restaurants_data.dart';
import 'package:appaula05/model/dish.dart';
import 'package:appaula05/ui/_core/appBar.dart';
import 'package:appaula05/ui/_core/app_colors.dart';
import 'package:appaula05/ui/widgets/snacks/snack_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SnacksScreen extends StatelessWidget {
  const SnacksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantData = Provider.of<RestaurantsData>(context);

    List<Dish> snacks = [];

    for (var restaurant in restaurantData.listRestaurant) {
      snacks.addAll(
        restaurant.dishes.where(
          (dish) => dish.category.toLowerCase() == 'petiscos',
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: getAppBar(context: context,title: 'Petiscos'),
     

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 24),

            const Text(
              'Petiscos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Escolha seus petiscos favorito',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: snacks.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum petisco encontrado.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: snacks.length,

                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 16);
                      },

                      itemBuilder: (context, index) {
                        return SnackWidget(
                          dish: snacks[index],
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