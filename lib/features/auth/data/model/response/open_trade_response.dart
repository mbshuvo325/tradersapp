
class GetOpenTradesResponse {
  double? currentPrice;
  String? comment;
  int? digits;
  int? login;
  double? openPrice;
  String? openTime;
  double? profit;
  double? sl;
  double? swaps;
  String? symbol;
  double? tp;
  int? ticket;
  int? type;
  double? volume;

  GetOpenTradesResponse({
     this.currentPrice,
     this.comment,
     this.digits,
     this.login,
     this.openPrice,
     this.openTime,
     this.profit,
     this.sl,
     this.swaps,
     this.symbol,
     this.tp,
     this.ticket,
    this.type,
     this.volume,
  });
  factory GetOpenTradesResponse.fromMap(Map<String, dynamic> json) => GetOpenTradesResponse(
    currentPrice: json["currentPrice"]?.toDouble(),
    comment: json["comment"],
    digits: json["digits"],
    login: json["login"],
    openPrice: json["openPrice"]?.toDouble(),
    openTime: json["openTime"],
    profit: json["profit"]?.toDouble(),
    sl: json["sl"],
    swaps: json["swaps"],
    symbol: json["symbol"],
    tp: json["tp"],
    ticket: json["ticket"],
    type: json["type"],
    volume: json["volume"]?.toDouble(),
  );
}