class Root {
  List<CoinModel> list;

  Root({this.list});

}

class CoinModel {
  int id;
  String name;
  String symbol;
  String slug;
  QuoteModel quote;

  CoinModel.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        symbol = map["symbol"],
        slug = map["slug"],
        quote = QuoteModel.fromJsonMap(map["quote"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["symbol"] = symbol;
    data["slug"] = slug;
    data["quote"] = quote.toJson();
    return data;
  }

  @override
  String toString() {
    return "$id  $name";
  }
}

class QuoteModel {
  USDModel usd;

  QuoteModel.fromJsonMap(Map<String, dynamic> map)
      : usd = USDModel.fromJsonMap(map["USD"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['USD'] = usd == null ? null : usd.toJson();
    return data;
  }
}

class USDModel {
  double price;

  USDModel.fromJsonMap(Map<String, dynamic> map) : price = map["price"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['price'] = price;
    return data;
  }
}
