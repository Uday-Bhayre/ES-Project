class location {
  final String name;
  final String typeOfLocation;
  // final Map<String, Map<String,String>> noise;
  location(
      {required this.name, required this.typeOfLocation,});
}

List<location> locations = [
  location(
    name: 'Hazira',
    typeOfLocation: 'Market',
  ),
  location(
    name: 'BH-2',
    typeOfLocation: 'Residencial',
  ),
  location(
    name: 'Near Railway Colony',
    typeOfLocation: 'Industrial',
  ),
  location(
    name: 'Gwalior Railway Station',
    typeOfLocation: 'Public Area',
  ),
  location(
    name: 'AB-Highway',
    typeOfLocation: 'Highway',
  ),
];
