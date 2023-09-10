class PercentageModel {
  List<Data>? data;

  PercentageModel({this.data});

  PercentageModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? bahis;
  double? yuzde;

  Data({this.bahis, this.yuzde});

  Data.fromJson(Map<String, dynamic> json) {
    bahis = json['bahis'];
    yuzde = json['yuzde'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bahis'] = bahis;
    data['yuzde'] = yuzde;
    return data;
  }
}
