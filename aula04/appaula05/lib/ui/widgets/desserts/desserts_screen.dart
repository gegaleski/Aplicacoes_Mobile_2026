import 'package:appaula05/data/restaurants_data.dart';
import 'package:appaula05/model/dish.dart';
import 'package:appaula05/ui/_core/appBar.dart';
import 'package:appaula05/ui/_core/app_colors.dart';
import 'package:appaula05/ui/widgets/desserts/dessert_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DessertsScreen extends StatelessWidget {
  const DessertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantData = Provider.of<RestaurantsData>(context);

    List<Dish> desserts = [];

    for (var restaurant in restaurantData.listRestaurant) {
      desserts.addAll(
        restaurant.dishes.where(
          (dish) => dish.category.toLowerCase() == 'sobremesas',
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: getAppBar(context: context,title: 'Sobremesas'),
     

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 24),

            const Text(
              'Sobremesas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Escolha sua sobremesa favorita',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: desserts.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhuma sobremesa encontrada.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: desserts.length,

                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 16);
                      },

                      itemBuilder: (context, index) {
                        return DessertWidget(
                          dish: desserts[index],
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