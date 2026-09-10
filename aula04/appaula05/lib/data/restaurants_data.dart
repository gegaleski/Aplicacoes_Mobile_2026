// Cria a classe restaurant data 

import 'package:appaula05/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class RestaurantsData extends ChangeNotifier{

  // Cria uma lista para carregar os restaurantes

  List<Restaurant> _listRestaurant = [];
  List<Restaurant> get listRestaurant => _listRestaurant;

  // Cria uma função future

  Future<List<Restaurant>> getRestaurant()async{

    if (_listRestaurant.isNotEmpty) {
      return _listRestaurant; // evita recarregar se já tiver carregado uma vez
    }

    try{
      final String jsonString = await rootBundle.loadString('assets/data.json'); 
      final Map<String,dynamic> data = json.decode(jsonString);
      final List<dynamic> restaurantData = data['restaurants'];
      _listRestaurant.addAll(restaurantData.map((e)=>Restaurant.fromMap(e)).toList());
      notifyListeners();

    }catch(e){
      debugPrint('Erro ao carregar restaurantes %e');
    }

    return _listRestaurant;
  }

}