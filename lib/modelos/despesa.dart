import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// manutencao.dart
class Despesa {
  final int? id;
  final String tipoDespesa;
  final DateTime data;
  final String descricao;
  final int parcela;

  const Despesa({this.id, required this.tipoDespesa, required this.data, required this.descricao, required this.parcela,});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tipoDespesa': tipoDespesa,
      'data': data.millisecondsSinceEpoch,
      'descricao': descricao,
      'parcela': parcela,
    };
  }

  factory Despesa.fromMap(Map<String, dynamic> map) {
    return Despesa(
      id: map['id'] != null ? map['id'] as int : null,
      tipoDespesa: map['tipoDespesa'] as String,
      data: DateTime.fromMillisecondsSinceEpoch(map['data'] as int),
      descricao: map['descricao'] as String,
      parcela: map['parcela'] as int,
    );
  }

  Despesa copyWith({
    int? id,
    String? tipoDespesa,
    DateTime? data,
    String? descricao,
    int? parcela,
  }) {
    return Despesa(
      id: id ?? this.id,
      tipoDespesa: tipoDespesa ?? this.tipoDespesa,
      data: data ?? this.data,
      descricao: descricao ?? this.descricao,
      parcela: parcela ?? this.parcela,
    );
  }

  String toJson() => json.encode(toMap());

  factory Despesa.fromJson(String source) => Despesa.fromMap(json.decode(source) as Map<String, dynamic>);
}
