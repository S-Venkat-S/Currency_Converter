
class Utils {
  static String formatDate(DateTime date, String format) {
    List<String> months = ["", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    String result = "";
    String sep;
    List<String> formatList;
    List<String> seps = ["-", "/"];
    for (String s in seps) {
      if (format.contains(s)) {
        formatList = format.split(s);
        sep = s;
        break;
      }
    }
    Map<String, String> allData = new Map<String, String>();
    allData["MM"] = date.month.toString().length == 1 ? "0"+date.month.toString() : date.month.toString();
    allData["MMM"] = months[date.month];
    allData["YYYY"] = date.year.toString();
    allData["YY"] = date.year.toString().substring(2, 4);
    allData["DD"] = date.day.toString().length == 1 ? "0"+date.day.toString() : date.day.toString();
    for (String format in formatList) {
      result = result + allData[format] + sep;
    }
    return result.substring(0, result.length-1);
  }
}