class Rooms {
  final String id;
  final String? type;
  final String? pic1;
  final String? pic2;
  final String? description;
  final int? rate;
  final String? floor;

  Rooms({
    required this.id,
    this.type,
    this.pic1,
    this.pic2,
    this.description,
    this.rate,
    this.floor,
  });
}
