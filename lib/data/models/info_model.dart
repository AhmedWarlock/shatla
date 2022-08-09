class InformationModel {
  final String name;
  final String sciName;
  final String humidity;
  final String soil;
  final String temp;
  final String water;
  final String potSize;
  final String fertilizer;
  final String light;
  final String flowering;
  InformationModel({
    required this.name,
    required this.sciName,
    required this.humidity,
    required this.soil,
    required this.temp,
    required this.water,
    required this.potSize,
    required this.fertilizer,
    required this.light,
    required this.flowering,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sci-name': sciName,
      'humidity': humidity,
      'soil': soil,
      'temp': temp,
      'water': water,
      'pot-size': potSize,
      'fertilizer': fertilizer,
      'light': light,
      'flowering': flowering,
    };
  }

  factory InformationModel.fromJson(Map<String, dynamic> snapshot) {
    return InformationModel(
        name: snapshot['name'],
        sciName: snapshot['sci-name'],
        humidity: snapshot['humidity'],
        soil: snapshot['soil'],
        temp: snapshot['temp'],
        water: snapshot['water'],
        potSize: snapshot['pot-size'],
        fertilizer: snapshot['fertilizer'],
        light: snapshot['light'],
        flowering: snapshot['flowering']);
  }
}
