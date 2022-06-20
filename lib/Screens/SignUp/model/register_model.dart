import 'package:firebase_database/firebase_database.dart';

class RegisterModel {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
  final String? nome, email, sexo, contatoResponsavel, senha;
  final String? contatoAluno, escolaridade;
  final DateTime? idade;

  RegisterModel({
    this.nome,
    this.idade,
    this.contatoAluno,
    this.contatoResponsavel,
    this.escolaridade,
    this.sexo,
    this.email,
    this.senha,
  });

  RegisterModel copyWith({
    nome,
    idade,
    contatoAluno,
    contatoResponsavel,
    escolaridade,
    sexo,
    email,
    senha,
  }) {
    return RegisterModel(
      nome: nome ?? this.nome,
      idade: idade ?? this.idade,
      contatoAluno: contatoAluno ?? this.contatoAluno,
      contatoResponsavel: contatoResponsavel ?? this.contatoResponsavel,
      escolaridade: escolaridade ?? this.escolaridade,
      sexo: sexo ?? this.sexo,
      senha: senha ?? this.senha,
      email: email ?? this.email,
    );
  }
}
