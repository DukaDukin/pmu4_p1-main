class Objava {
  final int id;
  final int userId;
  final String naslov;
  final String sadrzaj;

  const Objava({
    required this.id,
    required this.userId,
    required this.naslov,
    required this.sadrzaj,
  });

  factory Objava.fromJson(Map<String, dynamic> json) {
    return Objava(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      naslov: json['title'] as String? ?? 'Bez naslova',
      sadrzaj: json['body'] as String? ?? '',
    );
  }
}
