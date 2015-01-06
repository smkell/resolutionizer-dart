part of resolutionizer.formatters;

@Formatter(name: 'syrupFilter')
class SyrupFilter {
  String call(String src) {

    if (src.contains("powdered sugar")) {
      return src.replaceAll("powdered sugar", "maple syrup");
    }

    if (src.contains("sugar")) {
      return src.replaceAll("sugar", "maple syrup");
    }

    return src;
  }
}