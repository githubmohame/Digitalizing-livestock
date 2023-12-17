
String isEmpty({required String s1}) {
  if (s1.isEmpty) {
    return 'هذا الحقل يجب ادخالة';
  } else {
    return '';
  }
}

String isNumeric({required String s1}) {
  try {
     double.parse(s1);
    return '';
  } catch (e) {
    return 'هذا الحقل يجب ان يكون رقم';
  }
}

String biggerMin({required String s1, required int min}) {
  String s2 = isNumeric(s1: s1);
  if (s2.isEmpty) {
    double num1 = double.parse(s1);
    if (min >= num1) {
      return  'هذا الحقل يجب ان يكون اكبر من او يساوي'' $min';
    } else {
      return '';
    }
  } else {
    return s2;
  }
}

double funcStringValidation({required String value, required errorHeight}) {
  String s1 = isEmpty(s1: value.toString());
 
  if (s1.isNotEmpty) {
    errorHeight += 30;
    return errorHeight;
  }
  return errorHeight;
}

double funcNumValidation(
    {required value, required errorHeight, double min = 0}) {
  String s1 = isEmpty(s1: value.toString());
  if (s1.isNotEmpty) {
    errorHeight += 30;
    return errorHeight + 30;
  }
  s1 += biggerMin(s1: value.toString(), min: 0);
  if (s1.isEmpty) {
    return (errorHeight + 0);
  }

  return errorHeight;
}
