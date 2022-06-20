import 'dart:async';

import 'package:camera/camera.dart';
import 'package:fadba/Screens/MainPage/components/AdmCall.dart';
import 'package:fadba/Screens/SignUp/model/register_model.dart';
import 'package:fadba/components/BotaoSignUp.dart';
import 'package:fadba/components/CampoData.dart';
import 'package:fadba/components/CampoEscolha.dart';
import 'package:fadba/components/CampoNumero.dart';

import 'package:fadba/values/Custom_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Controller/User1.dart';
import '../../components/CampoConfirmaSenha.dart';
import '../../components/CampoText.dart';
import 'PhotoScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

var regist = RegisterModel();

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  var senhaCache = "";
  var senhaCacheComfirm = "";

  DatabaseReference ref = FirebaseDatabase.instance.ref("users");
  //final UserCadastro usuario = UserCadastro();

  DateTime selectDate = DateTime.now();

  final firstDate = DateTime(2010, 1);

  final lastDate = DateTime(2050, 12);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double alturaCampo = height * 0.06;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: const Alignment(0.0, 1.5),
                  radius: 1.0,
                  colors: [CustomColor().getCorPadraoAzul, Colors.black])),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const Flexible(
                flex: 2,
                child: Text(
                  "Cadastro",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              const Spacer(flex: 1),
              Flexible(
                flex: 7,
                child: SizedBox(
                  width: width * 0.8,
                  child: Form(
                    key: formKey,
                    child: Scrollbar(
                      child: ListView(
                        children: [
                          CampoTexto(
                              hinText: 'Nome Completo',
                              altura: alturaCampo,
                              textInputType: TextInputType.name,
                              valorCadastrado: "comida",
                              onSaved: (text) =>
                                  regist = regist.copyWith(nome: text)),
                          const Divider(),
                          /*  CampoTexto(
                              hinText: 'data',
                              textInputType: TextInputType.datetime,
                              altura: alturaCampo,
                              valorCadastrado: 'so umteste',
                              onSaved: (text) =>
                                  regist = regist.copyWith(idade: text)),
 */
                          CampoData(
                            textInputType: TextInputType.datetime,
                            altura: alturaCampo,
                          ),
                          const Divider(),
                          CampoNumero(
                              hinText: "Contato do aluno",
                              altura: alturaCampo,
                              onSaved: (text) =>
                                  regist = regist.copyWith(contatoAluno: text)),
                          const Divider(),
                          CampoNumero(
                              hinText: "Contato do Responsável",
                              altura: alturaCampo,
                              onSaved: (text) => regist =
                                  regist.copyWith(contatoResponsavel: text)),
                          const Divider(),
                          CampoEscolha(
                              dropOpcoes: const ["Faculdade", "Fundamental"],
                              dropValue: "Faculdade",
                              onSaved: (text) =>
                                  regist = regist.copyWith(escolaridade: text)),
                          const Divider(),
                          CampoEscolha(
                              dropOpcoes: const ["Masculino", "Feminino"],
                              dropValue: "Feminino",
                              onSaved: (text) =>
                                  regist = regist.copyWith(sexo: text)),
                          const Divider(),
                          CampoTexto(
                              hinText: 'Email',
                              altura: alturaCampo,
                              textInputType: TextInputType.emailAddress,
                              valorCadastrado: "comida",
                              onSaved: (text) =>
                                  regist = regist.copyWith(email: text)),
                          const Divider(),

                          CampoTexto(
                              hinText: 'SENHA',
                              textInputType: TextInputType.visiblePassword,
                              altura: alturaCampo,
                              valorCadastrado: 'aas',
                              obscureText: true,
                              onChanged: (text) => senhaCache = text!,
                              Validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo Vazio";
                                } else if (value.length < 8) {
                                  return "Senha muito pequena";
                                }
                                return null;
                              },
                              onSaved: (text) =>
                                  regist = regist.copyWith(senha: text)),
                          CampoTexto(
                              hinText: 'confirma SENHA',
                              textInputType: TextInputType.visiblePassword,
                              altura: alturaCampo,
                              valorCadastrado: 'aas',
                              obscureText: true,
                              onChanged: (text) => senhaCacheComfirm = text!,
                              Validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo Vazio";
                                } else if (value.length < 8) {
                                  return "Senha muito pequena";
                                }
                                if (senhaCache != senhaCacheComfirm) {
                                  return "Senha diferente";
                                }
                                return null;
                              },
                              onSaved: (text) =>
                                  regist = regist.copyWith(senha: text)),
                          // const SenhaRepetiSenha(  ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              /* const Spacer(flex: 1),
              Flexible(
                flex: 2,
                child: BotaoSignUp(
                  formKey: formKey,
                  imagem: "assets/img/passIcon_SignUpScrenn.png",
                ),
              ), */
              /* ElevatedButton.icon(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    print(
                        'alou alou \n nome: ${regist.nome} \n idade: ${regist.idade}\n sexo: ${regist.sexo} \n senha: ${regist.senha}\n email: ${regist.email}  \n contato do aluno: ${regist.contatoAluno}\n contato do responsavel: ${regist.contatoResponsavel} \n escolaridae: ${regist.escolaridade}');

                    chamada();
                  }
                },
                label: Text('Proximo'),
                icon:
              ), */
              Container(
                child: IconButton(
                    iconSize: 48,
                    color: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_right_sharp),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        print(
                            'alou alou \n nome: ${regist.nome} \n idade: ${regist.idade}\n sexo: ${regist.sexo} \n senha: ${regist.senha}\n email: ${regist.email}  \n contato do aluno: ${regist.contatoAluno}\n contato do responsavel: ${regist.contatoResponsavel} \n escolaridae: ${regist.escolaridade}');

                        enviar();
                        chamada();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  enviar() async {
    await ref.set({
      "nome": regist.nome,
      "idade": regist.idade,
      "contatoAluno": regist.contatoAluno,
      "contatoResponsavel": regist.contatoResponsavel,
      "escolaridade": regist.escolaridade,
      "sexo": regist.sexo,
      "senha": regist.senha,
      "email": regist.email
    });
  }

  Future<void> chamada() async {
    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => PhotoScreen(
              explicacao:
                  "Clique no icone acima e tire uma selfie para conhecermos você",
              mainPhoto: Image.asset("assets/img/IconPerson.png"),
              principal: "Agora precisamos de uma foto sua. Pode ser?",
              tamanhoFoto: 6,
              photoPage: 1,
              camera: cameras,
              isFrontal: true,
            )),
      ),
    );
  }
}

class CampoData extends StatefulWidget {
  const CampoData({
    Key? key,
    required this.textInputType,
    required this.altura,
  }) : super(key: key);

  final TextInputType textInputType;
  final double altura;

  @override
  State<CampoData> createState() => _CampoDataState();
}

class _CampoDataState extends State<CampoData> {
  DateTime selectDate = DateTime.now();

  final firstDate = DateTime(1800, 1);
  final lastDate = DateTime(2050, 12);

  DateTime? dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String? newDate = dateTime?.toIso8601String();
    return Container(
      height: widget.altura,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                CustomColor().getCorPadraoAzul.withOpacity(0.15),
                Colors.black
              ])),
      child: TextButton(
          onPressed: () => openDatePicker(context),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                newDate!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )),
    );
  }

  openDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: firstDate,
      lastDate: lastDate,
    ).then((value) {
      setState(() {
        dateTime = value;

        regist = regist.copyWith(idade: value);
      });
    });
  }
}
