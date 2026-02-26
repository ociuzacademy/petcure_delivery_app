class PlaceModel {
  final String placeValue;
  final String displayName;

  PlaceModel({required this.placeValue, required this.displayName});

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
    placeValue: json['place_value'],
    displayName: json['display_name'],
  );

  Map<String, dynamic> toJson() => {
    'place_value': placeValue,
    'display_name': displayName,
  };
}
