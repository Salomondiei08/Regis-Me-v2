import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regis_me/providers/entreprise_provider.dart';

import '../models/entreprise.dart';

class EntrepriseListWidget extends StatelessWidget {
  const EntrepriseListWidget({super.key, required this.entreprise});

  final Entreprise entreprise;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(entreprise.nom),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          entreprise.urlImage,
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Provider.of<EntrepriseProvider>(context, listen: false)
                    .deleteEntreprise(entreprise.nom);
              },
              color: Theme.of(context).colorScheme.error,
            )
          ],
        ),
      ),
    );
  }
}
