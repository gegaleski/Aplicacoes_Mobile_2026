import 'package:appaula05/model/dish.dart';
import 'package:appaula05/ui/_core/app_colors.dart';
import 'package:appaula05/ui/widgets/bag_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainDishWidget extends StatelessWidget {
  final Dish dish;

  const MainDishWidget({
    super.key,
    required this.dish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),

            child: Image.asset(
              'assets/${dish.imagePath}',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  dish.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'R\$ ${dish.price},00',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              Provider.of<BagProvider>(
                context,
                listen: false,
              ).addAllDishes([dish]);
            },

            icon: Icon(
              Icons.add_circle,
              color: AppColors.mainColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}