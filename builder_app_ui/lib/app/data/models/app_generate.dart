class AppGenerate {
  final String title;
  final String typePayment;
  final bool publishad;
  final String typeApp;

  AppGenerate({
    required this.title,
    required this.typePayment,
    required this.publishad,
    required this.typeApp,
  });

  factory AppGenerate.fromJsom(Map json) {
    return AppGenerate(
      title: json['title'],
      typePayment: json['typePayment'],
      publishad: json['publishad'],
      typeApp: json['typeApp'],
    );
  }
}
