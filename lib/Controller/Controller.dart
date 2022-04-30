class Controller {
  ValidatorText(value) {
    if (value == null || value.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  ValidatorPass(firstPassowrd, secondPassword) {
    if (firstPassowrd != secondPassword) {
      return false;
    } else {
      return true;
    }
  }

  ValidatorTextPass(value, pass, confirmPass) {
    bool text, passw;

    text = ValidatorText(value);
    passw = ValidatorPass(pass.text, confirmPass.text);

    if (text = false) {
      return "Campo vazio";
    } else if (passw == false) {
      return "Senhas Diferentes";
    } else if (passw) {
      return;
    }
  }
}
