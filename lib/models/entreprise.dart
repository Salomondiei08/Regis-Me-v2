class Entreprise {
  final String nom;
  final String description;
  final String email;
  final String urlImage;
  final String contact;
  final double lattitude;
  final double longitude;
  bool isFavorite = false;

  Entreprise(
      {required this.nom,
      required this.description,
      required this.email,
      required this.urlImage,
      required this.contact,
      required this.lattitude,
      required this.longitude});
}
