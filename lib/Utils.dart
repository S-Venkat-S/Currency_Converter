
class Utils {
  static String formatDate(DateTime date) {
    String mm = date.month.toString().length == 1 ? "0"+date.month.toString() : date.month.toString();
    String yyyy = date.year.toString();
    String dd = date.day.toString().length == 1 ? "0"+date.day.toString() : date.day.toString();
    return "$dd-$mm-$yyyy";
  }
}