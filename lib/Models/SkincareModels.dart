class SkincareRoutine {
  bool faceWash;
  bool toner;
  bool moisturizer;
  bool sunscreen;
  bool lipBalm;
  String date;
  String? imageUrl;

  SkincareRoutine({
    required this.faceWash,
    required this.toner,
    required this.moisturizer,
    required this.sunscreen,
    required this.lipBalm,
    required this.date,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "faceWash": faceWash,
      "toner": toner,
      "moisturizer": moisturizer,
      "sunscreen": sunscreen,
      "lipBalm": lipBalm,
      "imageUrl": imageUrl,
    };
  }

  factory SkincareRoutine.fromMap(Map<String, dynamic> map) {
    return SkincareRoutine(
      date: map["date"],
      faceWash: map["faceWash"] ?? false,
      toner: map["toner"] ?? false,
      moisturizer: map["moisturizer"] ?? false,
      sunscreen: map["sunscreen"] ?? false,
      lipBalm: map["lipBalm"] ?? false,
      imageUrl: map["imageUrl"],
    );
  }
}
