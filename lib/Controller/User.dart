import 'dart:io';
import 'package:fadba/Screens/MainPage/components/Article.dart';
import 'package:flutter/material.dart';

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

  bool verificarLogin(String login, String senha) {
    if (login != usuarioLogin["email"] && senha != usuarioLogin["senha"]) {
      return false;
    }

    return true;
  }

  Map verificarCadastro() {
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

class PrimareUser {
  // PrimareUser({imagemCarousel}) : _imagemCaroseul = imagemCarousel;

  final List<Widget> _adds = [
    Article(
      titulo: "Gatinhos",
      conteudo: "Os gatos são incríveis!",
      imagem: Image.network(
        "https://i.pinimg.com/236x/b2/30/c1/b230c1e8cd503dff0a2f087daf499331--balinese-cat-siamese-kittens.jpg",
        fit: BoxFit.fitHeight,
      ),
    ),
    Article(
      titulo: "Computadores",
      conteudo: "Os computadores da Nasa",
      imagem: Image.network(
        "https://www.oficinadanet.com.br/imagens/post/24224/capa.jpg",
        fit: BoxFit.fitHeight,
      ),
    ),
    Article(
      titulo: "Animes",
      conteudo: "Recomendações de animes bons!",
      imagem: Image.network(
        "https://media1.giphy.com/media/a6pzK009rlCak/200.gif",
        fit: BoxFit.fitHeight,
      ),
    ),
  ].reversed.toList();

  final List<String> _imagemCaroseul = [
    "assets/carousel/img_1.png",
    "assets/carousel/img_2.jpg",
    "assets/carousel/img_3.jpg",
  ];

  List<Widget> get getAdds => _adds;
  List<String> get getImagemCaroseul => _imagemCaroseul;

  String pegarIndexcaroseul(index) {
    return _imagemCaroseul[index];
  }
}

class Admin extends PrimareUser {
  criarArticle(String titulo, String conteudo, Image imagem) {
    _adds.add(Article(titulo: titulo, conteudo: conteudo, imagem: imagem));
  }
}

class Estudante {}
