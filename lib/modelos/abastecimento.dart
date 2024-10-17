// ignore_for_file: public_member_api_docs, sort_constructors_first
// manutencao.dart
class Abastecimento {
  final int? id;
  final DateTime data;
  final double? kmAtual;
  final String tipoCombustivel;
  final double? valorCombustivel;
  final double? litros;

  const Abastecimento({this.id, required this.data, required this.kmAtual, required this.tipoCombustivel, required this.valorCombustivel, required this.litros,});

  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data.toString(),
      'kmAtual': kmAtual,
      'tipoCombustivel': tipoCombustivel,
      'valorCombustivel': valorCombustivel,
      'litros': litros,
    };
  }

  factory Abastecimento.fromMap(Map<String, dynamic> map) {
    return Abastecimento(
      id: map['id'],
      data: DateTime.parse(map['data']),
      kmAtual: map['kmAtual'],
      tipoCombustivel: map['tipoCombustivel'],
      valorCombustivel: map['valorCombustivel'],
      litros: map['litros'],
    );
  }

  Abastecimento copyWith({
    int? id,
    DateTime? data,
    double? kmAtual,
    String? tipoCombustivel,
    double? valorCombustivel,
    double? litros,
  }) {
    return Abastecimento(
      id: id ?? this.id,
      data: data ?? this.data,
      kmAtual: kmAtual ?? this.kmAtual,
      tipoCombustivel: tipoCombustivel ?? this.tipoCombustivel,
      valorCombustivel: valorCombustivel ?? this.valorCombustivel,
      litros: litros ?? this.litros,
    );
  }
}
