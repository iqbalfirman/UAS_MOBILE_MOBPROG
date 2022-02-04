import 'package:intl/intl.dart';

class Utility {
  static String currency(int numb) {
    return NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: "Rp ")
        .format(numb)
        .toString();
  }
}