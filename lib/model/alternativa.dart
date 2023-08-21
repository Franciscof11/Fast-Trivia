class Alternativa {
  final int id;
  final String titulo;

  Alternativa({
    required this.id,
    required this.titulo,
  });

  factory Alternativa.fromMap(Map<String, dynamic> map) {
    return Alternativa(
      id: map['id'] ?? 0,
      titulo: map['titulo'] ?? '',
    );
  }
}
