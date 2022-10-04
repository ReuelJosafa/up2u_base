class LocalOfEvent {
  final String id;
  final String title;
  final String address;
  final String type;
  final String imageUrl;
  bool favorite;
  final bool promotion;

  LocalOfEvent({
    required this.id,
    required this.title,
    required this.address,
    required this.type,
    required this.imageUrl,
    required this.favorite,
    required this.promotion,
  });
}
