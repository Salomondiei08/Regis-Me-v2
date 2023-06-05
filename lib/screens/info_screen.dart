import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regis_me/providers/entreprise_provider.dart';

import '../models/entreprise.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

enum FilterOptions { favorites, all }

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    final entrepriseData = Provider.of<EntrepriseProvider>(context);

    final entreprise = entrepriseData.allItems();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Regis Me'),
          actions: [
            PopupMenuButton(
              itemBuilder: (_) => [
                const PopupMenuItem(
                    value: FilterOptions.favorites,
                    child: Text('Only Favorites')),
                const PopupMenuItem(
                    value: FilterOptions.all, child: Text('Show All')),
              ],
              icon: const Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.favorites) {
                  entrepriseData.showFavoriteOnly();
                } else {
                  entrepriseData.showAll();
                }
              },
            ),
          ]),
      body: SafeArea(
          child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: entreprise.length,
        itemBuilder: (context, i) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                title: Text(
                  entreprise[i].nom,
                  textAlign: TextAlign.center,
                ),
                trailing: ChangeNotifierProvider.value(
                  value: entreprise[i],
                  child: const EntrepriseWidget(),
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: Image.network(
                  entreprise[i].urlImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      )),
    );
  }
}

class EntrepriseWidget extends StatelessWidget {
  const EntrepriseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final entreprise = Provider.of<Entreprise>(context);

    return IconButton(
      icon: Icon(entreprise.isFavorite ? Icons.star : Icons.star_border),
      onPressed: () {
        entreprise.toggleFavoriteStatus();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Company added to favorite'),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'UNDO',
              onPressed: () {},
            ),
          ),
        );
      },
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
