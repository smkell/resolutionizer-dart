part of resolutionizer.formatters;

@Formatter(name: 'fahrenheitToCelciusFilter')
class FahrenheitToCelciusFilter {
  String call(String src) {
    RegExp fahrExp = new RegExp(r"(\d+) degrees F");
    if (fahrExp.hasMatch(src)) {
      String result = src;

      for(Match match in fahrExp.allMatches(src)) {
        num degF = num.parse(match.group(1));
        int degC = 5 * (_convertFahrenheitToCelcius(degF) / 5).round();
        result = result.replaceAll(match.group(0), "$degC degrees C");
      }

      return result;
    }

    return src;
  }

  num _convertFahrenheitToCelcius(num degF) => (degF - 32) * 5/9;
}