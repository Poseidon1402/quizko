String? isRequired(String? value) {
  if (value != null && value.isEmpty) {
    return 'This field cannot be empty';
  }

  return null;
}

String? isEmail(String? value) {
  if (value != null && value.isEmpty) {
    return 'This field cannot be empty';
  }

  if (value != null && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    return 'Invalid email';
  }

  return null;
}

String? length(
    String? value, {
      int min = 0,
      int max = 25,
      String minMessage = 'Too short',
      String maxMessage = 'Too long',
    }) {
  if (value != null && value.isEmpty) {
    return 'This field cannot be empty';
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
      String message = 'Passwords do not match',
    }) {
  if(password != null && password.isEmpty) {
    return 'This field cannot be empty';
  }

  if (password != confirmation) {
    return message;
  }

  return null;
}

String? isUrl(String? value) {
  if (value != null && value.isEmpty) {
    return 'This field cannot be empty';
  }

  String pattern = r'[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  if (value != null && !RegExp(pattern).hasMatch(value)) {
    return 'Invalid URL';
  }

  return null;
}

String? isPhoneNumber(String? value) {
  String pattern = r'(^(?:[0]3)?[0-9]{10}$)';
  RegExp regExp = RegExp(pattern);
  if (value == null) {
    return 'This field cannot be empty';
  }

  if (!regExp.hasMatch(value)) {
    return 'Please enter a valid phone number';
  }

  return null;
}

String? intervalValue({String? value, int min = 0, int max = 10}) {
  try {
    if (value != null && value.isEmpty) {
      return 'This field cannot be empty';
    }

    if(value != null && (int.parse(value) < min || int.parse(value) > max)) {
      return 'Value must be between $min and $max';
    }

    return null;
  } on Exception {
    return 'Invalid format';
  }
}

String? isFourDigitNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }
  // Regex to check if the input is a 4 digit number
  final regex = RegExp(r'^[1-9]\d{3}$');
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid 4 digit number';
  }
  return null;
}

String? isValidIpAddressAndPort(String? value) {
  if (value == null || value.isEmpty) {
    return 'Required field';
  }

  final regex = RegExp(
      r'^(?:\d{1,3}\.){3}\d{1,3}:\d{1,5}$'
  );
  if(!regex.hasMatch(value)) {
    return 'Please enter a valid IP address and port';
  }

  return null;
}
