class PlaceDetails {
  final double latitude;
  final double longitude;

  factory PlaceDetails.fromJson(Map<String, dynamic> jsonData) {
    return PlaceDetails(
      latitude: jsonData['lat'] ?? jsonData['latitude'],
      longitude: jsonData['lng'] ?? jsonData['longitude'],
    );
  }

  PlaceDetails({
    required this.latitude,
    required this.longitude,
  });
}
