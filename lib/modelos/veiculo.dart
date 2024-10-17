// ignore_for_file: public_member_api_docs, sort_constructors_first
// veiculo.dart
class Veiculo {
  final int? id;
  final String marca;
  final String modelo;
  final int ano;
  final String placa;
  final double kmAtual;

  const Veiculo({this.id, required this.marca, required this.modelo, required this.ano, required this.placa, required this.kmAtual});

  // Converte um objeto Veiculo em um Map. As chaves devem corresponder aos nomes das colunas no banco de dados.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'marca': marca,
      'modelo': modelo,
      'ano': ano,
      'placa': placa,
      'kmAtual': kmAtual,
    };
  }

  // Converte um Map em um objeto Veiculo
  factory Veiculo.fromMap(Map<String, dynamic> map) {
    return Veiculo(
      id: map['id'],
      marca: map['marca'],
      modelo: map['modelo'],
      ano: map['ano'],
      placa: map['placa'],
      kmAtual: map['kmAtual'],
    );
  }

  Veiculo copyWith({
    int? id,
    String? marca,
    String? modelo,
    int? ano,
    String? placa,
    double? kmAtual,
  }) {
    return Veiculo(
      id: id ?? this.id,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      ano: ano ?? this.ano,
      placa: placa ?? this.placa,
      kmAtual: kmAtual ?? this.kmAtual,
    );
  }
}
