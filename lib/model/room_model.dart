List<RoomModel> roomsFromJson(dynamic str) =>
    List<RoomModel>.from((str).map((x) => RoomModel.fromJson(x)));

class RoomModel {
  final String id;
  final List<String> images;
  final String city;
  final String street;
  final int price;
  final String contact;
  final String priceType;
  final String roomDescription;
  final String parkingType;
  final int roomQuantity;
  final double latitude;
  final double longitude;
  final String address;
  final String state;
  final String country;
  final String postalCode;

  RoomModel({
    required this.id,
    required this.images,
    required this.city,
    required this.street,
    required this.price,
    required this.contact,
    required this.priceType,
    required this.roomDescription,
    required this.parkingType,
    required this.roomQuantity,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['_id'] as String,
      images: List<String>.from(json['images'] as List<dynamic>),
      city: json['city'] as String,
      street: json['street'] as String,
      price: json['price'] as int,
      contact: json['contact'] as String,
      priceType: json['priceType'] as String,
      roomDescription: json['roomDescription'] as String,
      parkingType: json['parkingType'] as String,
      roomQuantity: json['roomQuantity'] as int,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      address: json['address'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['images'] = images;
    data['city'] = city;
    data['street'] = street;
    data['price'] = price;
    data['contact'] = contact;
    data['priceType'] = priceType;
    data['roomDescription'] = roomDescription;
    data['parkingType'] = parkingType;
    data['roomQuantity'] = roomQuantity;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['state'] = state;
    data['country'] = country;
    data['postalCode'] = postalCode;
    return data;
  }
}
