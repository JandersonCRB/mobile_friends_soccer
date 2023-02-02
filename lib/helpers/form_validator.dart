class FormValidator {
  List<String? Function(String?)> fnList = [];

  String? Function(String?)? build() {
    return (String? value) => fnList
        .map((fn) => fn(value))
        .firstWhere((element) => element != null, orElse: () => null);
  }

  FormValidator email() {
    fnList.add((String? value) {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }
      if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
          .hasMatch(value)) {
        return 'Email is invalid';
      }
      return null;
    });
    return this;
  }

  FormValidator required() {
    fnList.add((String? value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      return null;
    });
    return this;
  }

  FormValidator minLength(int length) {
    fnList.add((String? value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      if (value.length < length) {
        return 'This field must have at least $length characters';
      }
      return null;
    });
    return this;
  }

  FormValidator maxLength(int length) {
    fnList.add((String? value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      if (value.length > length) {
        return 'This field must have at most $length characters';
      }
      return null;
    });
    return this;
  }

  FormValidator password() {
    fnList.add((String? value) {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }
      if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$')
          .hasMatch(value)) {
        return 'Password is invalid';
      }
      return null;
    });
    return this;
  }
}
