import 'package:flutter/material.dart';
import 'package:regis_me/models/entreprise.dart';

class EntrepriseProvider with ChangeNotifier {
  List<Entreprise> items = [
    Entreprise(
        nom: 'Google',
        description: 'Best Uni',
        email: 'iit@iit.ci',
        urlImage:
            'https://techcrunch.com/wp-content/uploads/2021/07/GettyImages-1207206237.jpg?w=1390&crop=1',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
    Entreprise(
        nom: 'LOLO',
        description: 'Best Uni',
        email: 'iit@iit.ci',
        urlImage:
            'https://raw.githubusercontent.com/rrousselGit/provider/master/resources/flutter_favorite.png',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
    Entreprise(
        nom: 'LALA',
        description: 'Best Uni',
        email: 'iit@iit.ci',
        urlImage:
            'https://raw.githubusercontent.com/rrousselGit/provider/master/resources/flutter_favorite.png',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
    Entreprise(
        nom: 'IIT',
        description: 'Best Uni',
        email: 'iit@iit.ci',
        urlImage:
            'https://raw.githubusercontent.com/rrousselGit/provider/master/resources/flutter_favorite.png',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
    Entreprise(
        nom: 'KK',
        description: 'Best Uni',
        email: 'iit@iit.ci',
        urlImage:
            'https://raw.githubusercontent.com/rrousselGit/provider/master/resources/flutter_favorite.png',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
    Entreprise(
        nom: 'VITIB',
        description: 'Best Uni',
        urlImage:
            'https://raw.githubusercontent.com/rrousselGit/provider/master/resources/flutter_favorite.png',
        email: 'iit@iit.ci',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
    Entreprise(
        nom: 'LALA',
        description: 'Best Uni',
        urlImage:
            'https://raw.githubusercontent.com/rrousselGit/provider/master/resources/flutter_favorite.png',
        email: 'iit@iit.ci',
        contact: '00225070897972',
        lattitude: 9.0,
        longitude: 0.2),
  ];

  var _showFavoriteOnly = false;

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }

  List<Entreprise> allItems() {
    if (_showFavoriteOnly) {
      return items
          .where((entreprise) => entreprise.isFavorite == true)
          .toList();
    } else {
      return items;
    }
  }

  void addEnterprise(Entreprise entreprise) {
    items.insert(0, entreprise);
    notifyListeners();
  }

  List<Entreprise> searchByName(String entrepriseNom) {
    if ((entrepriseNom.isNotEmpty) && (entrepriseNom != "")) {
      return items
          .where((entreprise) => entreprise.nom.contains(entrepriseNom))
          .toList();
    } else {
      return items;
    }
  }

  void updateEntreprise(String nom, Entreprise entreprise) {
    final prosIndex = items.indexWhere((etp) => etp.nom == nom);
    if (prosIndex >= 0) {
      items[prosIndex] = entreprise;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteEntreprise(String nom) {
    items.removeWhere((etp) => etp.nom == nom);
    notifyListeners();
    debugPrint('$nom removed successfully');
  }
}
