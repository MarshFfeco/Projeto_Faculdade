/* import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';
import '../Screens/SignUp/model/register_model.dart';

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

class _CampoDataState extends State<CampoData>  {
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

        regist = regist.copyWith(idade: "so um tester boy");
      });
    });
  }
}
 */