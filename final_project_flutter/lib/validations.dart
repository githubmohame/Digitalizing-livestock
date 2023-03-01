String isEmpty({required String s1}) {
  if (s1.isEmpty) {
    return 'the field should not be null';
  } else {
    return '';
  }
}

String isNumeric({required String s1}) {
  try {
     double num1 = double.parse(s1);
    return '';
  } catch (e) {
    return 'the field should   be number';
  }
}

String biggerMin({required String s1, required double min}) {
  String s2 = isNumeric(s1: s1);
  if (s2.isEmpty) {
    double num1 = double.parse(s1);
    if (min >= num1) {
      return 'the number should be >=' + min.toString();
    } else {
      return '';
    }
  } else {
    return s2;
  }
}
