// usuario.dart
class Usuario {
  final int? id;
  final String nome;
  final String email;
  final String user;
  final String senha;
  
  const Usuario({this.id, required this.nome,required this.email, required this.user, required this.senha,});

  // Converte um objeto Usuario em um Map. As chaves devem corresponder aos nomes das colunas no banco de dados.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'user': user,
      'senha': senha,
    };
  }

  // Converte um Map em um objeto Usuario
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      user: map['user'],
      senha: map['senha'],
    );
  }
}
