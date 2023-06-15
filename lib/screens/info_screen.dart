import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regis_me/providers/entreprise_provider.dart';

import '../widgets/entreprise_widget.dart';

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
                const PopupMenuItem(value: 1, child: Text('Only Favorites')),
                const PopupMenuItem(value: 2, child: Text('Show All')),
              ],
              icon: const Icon(Icons.more_vert),
              onSelected: (int selectedValue) {
                if (selectedValue == 1) {
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
                backgroundColor: Colors.black.withOpacity(0.4),
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
