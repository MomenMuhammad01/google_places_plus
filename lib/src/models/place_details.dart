class PlaceLatLng {
  final double latitude;
  final double longitude;

  factory PlaceLatLng.fromJson(Map<String, dynamic> jsonData) {
    return PlaceLatLng(
      latitude: jsonData['lat'] ?? jsonData['latitude'],
      longitude: jsonData['lng'] ?? jsonData['longitude'],
    );
  }

  PlaceLatLng({
    required this.latitude,
    required this.longitude,
  });
}
