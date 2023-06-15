
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/entreprise.dart';

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
            content: !entreprise.isFavorite ? const Text('Company no more favorite') : const Text('Company added to favorite'),
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
