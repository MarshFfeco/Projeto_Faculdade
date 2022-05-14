import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class User {
  User({
    nome,
    email,
    contatoAluno,
    contatoResponsavel,
    cpf,
    escolaridade,
    fotoPessoal,
    idade,
    rg,
    senha,
    sexo,
  })  : _nome = nome,
        _email = email,
        _contatoAluno = contatoAluno,
        _contatoResponsavel = contatoResponsavel,
        _cpf = cpf,
        _escolaridade = escolaridade,
        _fotoPessoal = fotoPessoal,
        _idade = idade,
        _rg = rg,
        _senha = senha,
        _sexo = sexo;

  String _nome, _email, _sexo, _senha;
  int _idade, _contatoAluno, _contatoResponsavel, _escolaridade;
  File _cpf, _rg, _fotoPessoal;

  set setNome(String nome) => _nome = nome;
  get getNome => _nome;
  set setEmail(String email) => _email = email;
  get getEmail => _email;
  set setSexo(String sexo) => _sexo = sexo;
  get getSexo => _sexo;
  set setSenha(String senha) => _senha = senha;
  get getSenha => _senha;
  set setIdade(int idade) => _idade = idade;
  get getIdade => _idade;
  set setContatoResponsavel(int contatoResponsavel) =>
      _contatoResponsavel = contatoResponsavel;
  get getContatoResponsavel => _contatoResponsavel;
  set setContatoaluno(int contatoAluno) => _contatoAluno = contatoAluno;
  get getContatoAluno => _contatoAluno;
  set setEscolaridade(int escolaridade) => _escolaridade = escolaridade;
  get getEscolaridade => _escolaridade;
  set setCpf(File cpf) => _cpf = cpf;
  get getCpf => _cpf;
  set setRg(File rg) => _rg = rg;
  get getRg => _rg;
  set setFotoPessoal(File fotoPessoal) => _fotoPessoal = fotoPessoal;
  get getFotopessoal => _fotoPessoal;

  dynamic usuarioLogin = {
    "email": "admin@admin.com",
    "senha": "admin",
  };

  bool VerificarLogin(String login, String senha) {
    if (login != usuarioLogin["email"] && senha != usuarioLogin["senha"]) {
      return false;
    }

    return true;
  }

  Map VerificarCadastro() {
    dynamic usuarioCadastro = {
      "Nome": getNome,
      "Idade": getIdade,
      "Email": getEmail,
      "Senha": getSenha,
      "Sexo": getSexo,
      "ContatoAluno": getContatoAluno,
      "Contatoresponsavel": getContatoResponsavel,
      "Escolaridade": getEscolaridade,
      "FotoPessoa": getFotopessoal,
      "Cpf": getCpf,
      "Rg": getRg,
    };

    return usuarioCadastro;
  }
}

class admin {
  List<Widget> _adds = [];

  List<Widget> get getAdds => _adds;

  void adicionaritem(Widget item) {
    return _adds.add(item);
  }

  int pegartamanho() {
    return _adds.length;
  }
}
