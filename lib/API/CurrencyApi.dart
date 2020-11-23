import "package:http/http.dart" as http;

class CurrencyApi {

  String baseUrl = "https://api.exchangeratesapi.io/";
  String dateSep = "-";

  Future<http.Response> _fetch(String date, String currCode) async {
    var resp = await http.get(baseUrl+date+"?base="+currCode);
    return resp;
  }

  Future<http.Response> getCurrencies(DateTime date, String currCode) {
    String dateString = "";
    if (null == date) {
      dateString = "latest";
    }
    else {
      String dd = date.day.toString();
      String mm = date.month.toString();
      String yyyy = date.year.toString();
      dateString = yyyy+dateSep+mm+dateSep+dd;
    }
    if (null == currCode) {
      currCode = "USD";
    }
    return _fetch(dateString, currCode);

  }

}