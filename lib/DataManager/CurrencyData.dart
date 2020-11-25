import 'dart:convert';
import 'package:currency_converter/DataManager/SharedPref.dart';
import 'package:currency_converter/API/CurrencyApi.dart';


class CurrencyData {

  // Need to handled via API
  static String data = "{\"rates\":{\"CAD\":1.4579,\"HKD\":8.6511,\"ISK\":136.4,\"PHP\":56.284,\"DKK\":7.472,\"HUF\":330.5,\"CZK\":25.445,\"AUD\":1.6088,\"RON\":4.7705,\"SEK\":10.434,\"IDR\":15510.83,\"INR\":79.0035,\"BRL\":4.5175,\"RUB\":68.9657,\"HRK\":7.439,\"JPY\":121.31,\"THB\":33.496,\"CHF\":1.0883,\"SGD\":1.5036,\"PLN\":4.2593,\"BGN\":1.9558,\"TRY\":6.5774,\"CNY\":7.7764,\"NOK\":9.9463,\"NZD\":1.6811,\"ZAR\":15.7936,\"USD\":1.1097,\"MXN\":21.0259,\"ILS\":3.8584,\"GBP\":0.85133,\"KRW\":1286.58,\"MYR\":4.5942},\"base\":\"EUR\",\"date\":\"2019-12-20\"}";

  static String availableCurrencies = "[\"CAD\",\"HKD\",\"ISK\",\"PHP\",\"DKK\",\"HUF\",\"CZK\",\"AUD\",\"RON\",\"SEK\",\"IDR\",\"INR\",\"BRL\",\"RUB\",\"HRK\",\"JPY\",\"THB\",\"CHF\",\"SGD\",\"PLN\",\"BGN\",\"TRY\",\"CNY\",\"NOK\",\"NZD\",\"ZAR\",\"USD\",\"MXN\",\"ILS\",\"GBP\",\"KRW\",\"MYR\",\"EUR\"]";

  // Static data for the information on currency short codes (INR, USD, etc.,)
  static String currencyInfo = "{\"CAD\":{\"name\":\"Canadian Dollar\",\"symbol\":\"CA\$\"},\"HKD\":{\"name\":\"Hong Kong Dollar\",\"symbol\":\"HK\$\"},\"ISK\":{\"name\":\"Icelandic Króna\",\"symbol\":\"Ikr\"},\"PHP\":{\"name\":\"Philippine Peso\",\"symbol\":\"₱\"},\"DKK\":{\"name\":\"Danish Krone\",\"symbol\":\"Dkr\"},\"HUF\":{\"name\":\"Hungarian Forint\",\"symbol\":\"Ft\"},\"CZK\":{\"name\":\"Czech Republic Koruna\",\"symbol\":\"Kč\"},\"AUD\":{\"name\":\"Australian Dollar\",\"symbol\":\"AU\$\"},\"RON\":{\"name\":\"Romanian Leu\",\"symbol\":\"RON\"},\"SEK\":{\"name\":\"Swedish Krona\",\"symbol\":\"Skr\"},\"IDR\":{\"name\":\"Indonesian Rupiah\",\"symbol\":\"Rp\"},\"INR\":{\"name\":\"Indian Rupee\",\"symbol\":\"Rs\"},\"BRL\":{\"name\":\"Brazilian Real\",\"symbol\":\"R\$\"},\"RUB\":{\"name\":\"Russian Ruble\",\"symbol\":\"RUB\"},\"HRK\":{\"name\":\"Croatian Kuna\",\"symbol\":\"kn\"},\"JPY\":{\"name\":\"Japanese Yen\",\"symbol\":\"¥\"},\"THB\":{\"name\":\"Thai Baht\",\"symbol\":\"฿\"},\"CHF\":{\"name\":\"Swiss Franc\",\"symbol\":\"CHF\"},\"SGD\":{\"name\":\"Singapore Dollar\",\"symbol\":\"S\$\"},\"PLN\":{\"name\":\"Polish Zloty\",\"symbol\":\"zł\"},\"BGN\":{\"name\":\"Bulgarian Lev\",\"symbol\":\"BGN\"},\"TRY\":{\"name\":\"Turkish Lira\",\"symbol\":\"TL\"},\"CNY\":{\"name\":\"Chinese Yuan\",\"symbol\":\"CN¥\"},\"NOK\":{\"name\":\"Norwegian Krone\",\"symbol\":\"Nkr\"},\"NZD\":{\"name\":\"New Zealand Dollar\",\"symbol\":\"NZ\$\"},\"ZAR\":{\"name\":\"South African Rand\",\"symbol\":\"R\"},\"USD\":{\"name\":\"US Dollar\",\"symbol\":\"\$\"},\"MXN\":{\"name\":\"Mexican Peso\",\"symbol\":\"MX\$\"},\"ILS\":{\"name\":\"Israeli New Sheqel\",\"symbol\":\"₪\"},\"GBP\":{\"name\":\"British Pound Sterling\",\"symbol\":\"£\"},\"KRW\":{\"name\":\"South Korean Won\",\"symbol\":\"₩\"},\"MYR\":{\"name\":\"Malaysian Ringgit\",\"symbol\":\"RM\"},\"EUR\":{\"name\":\"Euro\",\"symbol\":\"€\"}}";


  static Iterable getAvailableCurrency() {
    return jsonDecode(availableCurrencies);
  }

  static String getLatestDate() {
    String latestDate = SharedPref.prefInstance.get("latest_date");
    if (latestDate == null) {

    }
  }

  static Future getData(DateTime date, String base) {
    var apiResp = new CurrencyApi();
    return apiResp.getCurrencies(date, base);
  }

  static List<String> getCurrencySymbolData(String currShortCode) {
    var currencyDatas = jsonDecode(currencyInfo);
    List<String> shortcodeData = new List(2);
    shortcodeData[0] = "";
    shortcodeData[1] = "";
    if (currencyDatas[currShortCode] == null) {
      return shortcodeData;
    }
    var currencyData = currencyDatas[currShortCode];
    if (currencyData["symbol"] != null) {
      shortcodeData[0] = currencyData["symbol"];
    }
    if (currencyData["name"] != null) {
      shortcodeData[1] = currencyData["name"];
    }
    return shortcodeData;
  }
}