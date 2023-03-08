import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/commom/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/route.dart';
import 'package:pokedex/features/pokedex/secreens/home/container/home_container.dart';
import 'package:pokedex/features/pokedex/secreens/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
