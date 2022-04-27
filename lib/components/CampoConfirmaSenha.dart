import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class TextfieldConfirmPassWidget extends StatefulWidget {
  TextfieldConfirmPassWidget({
    Key? key,
    required this.hinText,
    required this.pass,
  }) : super(key: key);

  final String hinText;
  TextEditingController pass = TextEditingController();

  @override
  State<TextfieldConfirmPassWidget> createState() =>
      _TextfieldConfirmPassWidgetState();
}

class _TextfieldConfirmPassWidgetState
    extends State<TextfieldConfirmPassWidget> {
  final TextEditingController _confirmPass = TextEditingController();
  bool _securityText = true;

  set setSecurityText(bool securityText) {
    _securityText = securityText;
  }

  bool get getSecuritytext {
    return _securityText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]),
      child: TextFormField(
        controller: _confirmPass,
        keyboardType: TextInputType.visiblePassword,
        obscureText: getSecuritytext,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20.0),
          hintText: widget.hinText,
          hintStyle: TextStyle(color: CustomColor().getCorPadraoAzul),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.circular(30)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.circular(30)),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.key,
            color: CustomColor().getCorPadraoAzul,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              getSecuritytext ? Icons.visibility_off : Icons.visibility,
              color: CustomColor().getCorPadraoAzul,
            ),
            onPressed: () => setState(() => setSecurityText = !getSecuritytext),
          ),
        ),
        validator: (value) {
          // Controller controle = Controller();
          //return controle.ValidatorTextPass(value, widget.pass, _confirmPass);
        },
      ),
    );
  }
}
