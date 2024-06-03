
class Pokemon {
  final int id;
  final String name;
  final String type;
  final String location;
  final String imageUrl;
  final List<String> abilities;
  final List<String> evolutions;

  Pokemon({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.imageUrl,
    required this.abilities,
    required this.evolutions,
  });

  factory Pokemon.fromJson(Map data) {
    return Pokemon(
      id: data['id'],
      name: data['pokemon'],
      type: data['type'],
      location: data['location'],
      imageUrl: data['image_url'],
      abilities: List<String>.from(data['abilities'].map((x) => x)),
      evolutions: List<String>.from(data["evolutions"].map((x) => x)),
    );
  }
}
