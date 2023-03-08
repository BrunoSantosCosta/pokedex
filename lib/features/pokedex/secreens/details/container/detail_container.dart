import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedex/commom/error/failure.dart';
import 'package:pokedex/commom/models/pokemon.dart';
import 'package:pokedex/commom/repositories/pokemon_repository.dart';
import 'package:pokedex/commom/widgets/po_error.dart';
import 'package:pokedex/commom/widgets/po_loading.dart';
import 'package:pokedex/features/pokedex/secreens/details/pages/detail_page.dart';
import 'package:pokedex/features/pokedex/secreens/home/pages/home_error.dart';
import 'package:pokedex/features/pokedex/secreens/home/pages/home_loading.dart';

class DetailArgument {
  DetailArgument({required this.name});
  late final String name;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    super.key,
    required this.repository,
    required this.arguments,
  });
  final IPokemonRepository repository;
  final DetailArgument arguments;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailPage(
            name: arguments.name,
            list: snapshot.data!,
          );
        }

        if (snapshot.hasError) {
          return PoErrro(
            error: (snapshot.error as Failure).message!,
          );
        }
        return Container();
      },
    );
  }
}
