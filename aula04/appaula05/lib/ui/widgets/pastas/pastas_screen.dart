import 'package:appaula05/data/restaurants_data.dart';
import 'package:appaula05/model/dish.dart';
import 'package:appaula05/ui/_core/appBar.dart';
import 'package:appaula05/ui/_core/app_colors.dart';
import 'package:appaula05/ui/widgets/pastas/pasta_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PastasScreen extends StatelessWidget {
  const PastasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantData = Provider.of<RestaurantsData>(context);

    List<Dish> pastas = [];

    for (var restaurant in restaurantData.listRestaurant) {
      pastas.addAll(
        restaurant.dishes.where(
          (dish) => dish.category.toLowerCase() == 'massas',
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: getAppBar(context: context,title: 'Massas'),
     

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 24),

            const Text(
              'Massas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Escolha suas massas favoritas',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: pastas.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum prato encontrado.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: pastas.length,

                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 16);
                      },

                      itemBuilder: (context, index) {
                        return PastaWidget(
                          dish: pastas[index],
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