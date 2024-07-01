import 'package:google_places_plus/src/api/client.dart';
import 'package:google_places_plus/src/models/place.dart';
import 'package:google_places_plus/src/models/place_details.dart';
import 'package:google_places_plus/src/utils/api_constants.dart';
import 'package:google_places_plus/src/utils/enums.dart';

class GooglePlacesPlus {
  static Future<List<Place>> getSuggestions({
    required String searchQuery,
    required String googleMapsKey,
  }) async {
    final response = await HttpClient.get(
      ApiConstants.placeAutoComplete,
      queryParameters: {
        'input': searchQuery,
        'radius': 500,
        'key': googleMapsKey,
      },
    );
    if (response['status'] == GoogleMapsCallStatus.ok.value) {
      return List<Place>.from(
        ((response['predictions'] ?? []) as List).map(
          (place) => Place.fromJson(place),
        ),
      );
    } else {
      throw Exception("Couldn't fetch search results");
    }
  }

  static Future<PlaceDetails> getLatitudeAndLongitude({
    required String placeId,
    required String googleMapsKey,
  }) async {
    final response = await HttpClient.get(
      ApiConstants.placeAutoComplete,
      queryParameters: {
        'place_id': placeId,
        'radius': 500,
        'key': googleMapsKey,
      },
    );
    if (response['status'] == GoogleMapsCallStatus.ok.value) {
      return PlaceDetails.fromJson(response['result']['geometry']['location']);
    } else {
      throw Exception("Couldn't fetch search results");
    }
  }
}
