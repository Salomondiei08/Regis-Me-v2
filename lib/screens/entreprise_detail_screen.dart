import 'package:flutter/material.dart';
import 'package:regis_me/screens/map_screen.dart';

import '../models/entreprise.dart';

class EntrepriseDetailScreen extends StatelessWidget {
  const EntrepriseDetailScreen({super.key, required this.entreprise});

  final Entreprise entreprise;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          entreprise.nom,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.5, color: Colors.black.withOpacity(0.5)),
                ],
                borderRadius: BorderRadius.circular(10),
                image:
                    DecorationImage(image: NetworkImage(entreprise.urlImage))),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(entreprise.nom),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => MapScreen(entreprise: entreprise),
                  ),
                ),
                child: const Text('Voir la map'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          ),
        )
      ]),
    );
  }
}
