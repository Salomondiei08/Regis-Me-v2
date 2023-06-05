import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regis_me/providers/entreprise_provider.dart';

import '../screens/entreprise_detail_screen.dart';

class Search extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    final places = Provider.of<EntrepriseProvider>(context);
    final results = places
        .allItems()
        .where(
          (element) => element.nom.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemBuilder: (context, index) => Card(
        elevation: 00,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
    
        child: ListTile(
          title: Text(
            results[index].nom,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            results[index].description,
            style: const TextStyle(color: Colors.white),
          ),
          leading: Image.network(results[index].urlImage),
        ),
      ),
      itemCount: results.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final places = Provider.of<EntrepriseProvider>(context);
    final results = places
        .allItems()
        .where(
          (element) => element.nom.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return query.isEmpty
        ? Center(
            child: Text(
              'No Items found',
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                elevation: 00,
            
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EntrepriseDetailScreen(
                        entreprise: results[index],
                      ),
                    ),
                  ),
                  title: Text(
                    results[index].nom,
        
                  ),
                  subtitle: Text(
                    results[index].description,

                  ),
                  leading: Image.network(results[index].urlImage),
                ),
              ),
              itemCount: results.length,
            ),
          );
  }
}