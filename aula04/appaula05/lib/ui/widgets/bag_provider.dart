import 'package:appaula05/model/dish.dart';
import 'package:flutter/material.dart';

class BagProvider extends ChangeNotifier {
  List<Dish> dishesOnBag = [];

  // Adiciona itens ao carrinho
  void addAllDishes(List<Dish> dishes) {
    dishesOnBag.addAll(dishes);
    notifyListeners();
  }

  // Remove um item do carrinho
  void removeDish(Dish dish) {
    dishesOnBag.remove(dish);
    notifyListeners();
  }

  // Limpa a sacola
  void clearBag() {
    dishesOnBag.clear();
    notifyListeners();
  }

  // Retorna os itens agrupados pela quantidade
  Map<Dish, int> getMapByAmount() {
    Map<Dish, int> mapResult = {};

    for (Dish dish in dishesOnBag) {
      if (mapResult[dish] == null) {
        mapResult[dish] = 1;
      } else {
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }

    return mapResult;
  }

  @override
  String toString() {
    return 'BagProvider(dishesOnBag: $dishesOnBag)';
  }
}