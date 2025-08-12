class Museum {
  final String id;
  final String name;
  final String city;
  final int? foundedYear;
  final String topic;
  final String supervisor;
  final bool isPublic;
  final String? image;          // <— جديد

  const Museum({
    required this.id,
    required this.name,
    required this.city,
    this.foundedYear,
    required this.topic,
    required this.supervisor,
    required this.isPublic,
    this.image,                // <— جديد
  });

  factory Museum.fromJson(Map<String, dynamic> json) => Museum(
        id: json['id'] as String,
        name: json['name'] as String,
        city: json['city'] as String,
        foundedYear: json['foundedYear'] as int?,
        topic: json['topic'] as String,
        supervisor: json['supervisor'] as String,
        isPublic: json['isPublic'] as bool,
        image: json['image'] as String?,   // <— جديد
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'foundedYear': foundedYear,
        'topic': topic,
        'supervisor': supervisor,
        'isPublic': isPublic,
        'image': image,                   // <— جديد
      };
}