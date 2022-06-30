class Utils {
  static String convertKelvinToCelsius(double kelvin) {
    if (kelvin == 0) return "";
    return "${(kelvin - 273.15).toStringAsFixed(0)} C";
  }
}
