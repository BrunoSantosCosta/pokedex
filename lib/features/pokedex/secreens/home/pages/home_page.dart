import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedex/commom/models/pokemon.dart';
import 'package:pokedex/commom/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/secreens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/secreens/home/container/home_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.list, required this.onTapItem});
  final List<Pokemon> list;
  final Function(String, DetailArgument) onTapItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              list[index].name,
            ),
            onTap: () => onTapItem(
              '/details',
              DetailArgument(name: list[index].name),
            ),
          );
        },
      ),
    );
  }
}
