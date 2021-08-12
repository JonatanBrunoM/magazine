class Products {
  final String photo;
  final String name;
  final String description;
  final String value;
  final String installments;
  bool isFavorite;

  Products({
    required this.photo,
    required this.name,
    required this.description,
    required this.value,
    required this.installments,
    this.isFavorite = false,
  });
}
