String? isRequired(String? value) {
  if (value != null && value.isEmpty) {
    return 'Ce champ ne peut pas être vide';
  }

  return null;
}

String? isEmail(String? value) {
  if (value != null && value.isEmpty) {
    return 'Ce champ ne peut pas être vide';
  }

  if (value != null && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    return 'Email invalide';
  }

  return null;
}

String? length(
  String? value, {
  int min = 0,
  int max = 25,
  String minMessage = 'Trop court',
  String maxMessage = 'Trop long',
}) {
  if (value != null && value.isEmpty) {
    return 'Ce champ ne peut pas être vide';
  }

  if (value != null && value.length > max) {
    return maxMessage;
  }

  if (value != null && value.length < min) {
    return minMessage;
  }

  return null;
}

String? isTheSamePassword(
  String? password,
  String confirmation, {
  String message = 'Mot de passe non identique',
}) {
  if(password != null && password.isEmpty) {
    return 'Ce champ ne doit pas être vide';
  }

  if (password != confirmation) {
    return message;
  }

  return null;
}

String? isUrl(String? value) {
  if (value != null && value.isEmpty) {
    return 'Ce champ ne peut pas être vide';
  }

  String pattern = r'[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  if (value != null && !RegExp(pattern).hasMatch(value)) {
    return 'URL invalide';
  }

  return null;
}

String? isPhoneNumber(String? value) {
  String pattern = r'(^(?:[0]3)?[0-9]{10}$)';
  RegExp regExp = RegExp(pattern);
  if (value != null && value.isEmpty) {
    return 'Ce champ ne peut pas être vide';
  }

  if (!regExp.hasMatch(value!)) {
    return 'Veuillez saisir un numéro de téléphone valide';
  }

  return null;
}

String? intervalValue({String? value, int min = 0, int max = 10}) {
  try {
    if (value != null && value.isEmpty) {
      return 'Ce champ ne peut pas être vide';
    }

    if(value != null && (int.parse(value) < min || int.parse(value) > max)) {
      return 'La valeur doit être comprise entre $min et $max';
    }

    return null;
  } on Exception {
    return 'Format invalide';
  }
}