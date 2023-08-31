import 'dart:convert';

class GetOpenTradesResponse {
  double currentPrice;
  String? comment;
  int digits;
  int login;
  double openPrice;
  String openTime;
  double profit;
  double sl;
  double swaps;
  String symbol;
  int tp;
  int ticket;
  int type;
  double volume;

  GetOpenTradesResponse({
    required this.currentPrice,
    this.comment,
    required this.digits,
    required this.login,
    required this.openPrice,
    required this.openTime,
    required this.profit,
    required this.sl,
    required this.swaps,
    required this.symbol,
    required this.tp,
    required this.ticket,
    required this.type,
    required this.volume,
  });

  factory GetOpenTradesResponse.fromJson(String str) => GetOpenTradesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetOpenTradesResponse.fromMap(Map<String, dynamic> json) => GetOpenTradesResponse(
    currentPrice: json["currentPrice"]?.toDouble(),
    comment: json["comment"],
    digits: json["digits"],
    login: json["login"],
    openPrice: json["openPrice"]?.toDouble(),
    openTime: json["openTime"],
    profit: json["profit"]?.toDouble(),
    sl: json["sl"]?.toDouble(),
    swaps: json["swaps"]?.toDouble(),
    symbol: json["symbol"],
    tp: json["tp"],
    ticket: json["ticket"],
    type: json["type"],
    volume: json["volume"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "currentPrice": currentPrice,
    "comment": comment,
    "digits": digits,
    "login": login,
    "openPrice": openPrice,
    "openTime": openTime,
    "profit": profit,
    "sl": sl,
    "swaps": swaps,
    "symbol": symbol,
    "tp": tp,
    "ticket": ticket,
    "type": type,
    "volume": volume,
  };
}