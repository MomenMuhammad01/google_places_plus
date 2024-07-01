class Place {
  final String id;
  final String name;
  factory Place.fromJson(Map<String, dynamic> jsonData) {
    return Place(
      id: jsonData['place_id'],
      name: jsonData['description'],
    );
  }

  Place({
    required this.id,
    required this.name,
  });
}
