class validationMixins{
  String validateEmail(String value){
    if(!value.contains('@'))
      return "Email Invalido";

    return null;
  }

  String validatePassword(String value){
    if(value.length<6){
      return "Contraseña Invalida";

      return null;
    }
  }
}