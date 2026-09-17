import 'package:appaula05/ui/_core/app_colors.dart';
import 'package:appaula05/ui/widgets/beverages/beverages_screen.dart';
import 'package:appaula05/ui/widgets/desserts/desserts_screen.dart';
import 'package:appaula05/ui/widgets/main_dishes/main_dishes_screen.dart';
import 'package:appaula05/ui/widgets/pastas/pastas_screen.dart';
import 'package:appaula05/ui/widgets/snacks/snacks_screen.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String category;

  const CategoryWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),

      onTap: () {
        if (category == 'Bebidas') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BeveragesScreen(),
            ),
          );
        }

        if (category == 'Petiscos') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SnacksScreen(),
            ),
          );
        }

        if (category == 'Principais') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainDishesScreen(),
            ),
          );
        }

        if (category == 'Massas') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PastasScreen(),
            ),
          );
        }

        if (category == 'Sobremesas') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DessertsScreen(),
            ),
          );
        }
      },

     
      child: Container(
        width: 100,
        height: 100,

        decoration: BoxDecoration(
          color: AppColors.lightBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Image.asset(
              'assets/categories/${category.toLowerCase()}.png',
              height: 48,
            ),

            Text(
              category,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}