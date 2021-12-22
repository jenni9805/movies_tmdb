class Validation {



  static String validateEmail(String value) {
    if (value.isEmpty) return 'Enter email!';

    bool regExp = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!regExp) return "Enter valid Email!";

    return '';
  }

  static String validatePassword(String value) {
    if (value.isEmpty) return 'Enter password';

    if (value.length < 7) return 'Password must be more than 6 characters';

    return '';
  }

}
