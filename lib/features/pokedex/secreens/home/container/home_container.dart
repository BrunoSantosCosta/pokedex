import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedex/commom/error/failure.dart';
import 'package:pokedex/commom/models/pokemon.dart';
import 'package:pokedex/commom/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/secreens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/secreens/home/pages/home_error.dart';
import 'package:pokedex/features/pokedex/secreens/home/pages/home_loading.dart';
import 'package:pokedex/features/pokedex/secreens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
    required this.repository,
    required this.onItemTap,
  });

  final IPokemonRepository repository;
  final Function(String, DetailArgument) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data!,
            onTapItem: onItemTap,
          );
        }

        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }
        return Container();
      },
    );
  }
}
