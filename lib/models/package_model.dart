import 'dart:convert';

class Package_model {
  Package_model({
    required this.data,
    required this.success,
    required this.status,
  });
  late final List<Data> data;
  late final bool success;
  late final int status;

  Package_model.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['success'] = success;
    _data['status'] = status;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.packageName,
    required this.packageType,
    required this.amount,
    required this.validity,
    required this.bonus,
  });
  late final int id;
  late final String packageName;
  late final String packageType;
  late final int amount;
  late final int validity;
  late final int bonus;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    packageName = json['package_name'];
    packageType = json['package_type'];
    amount = json['amount'];
    validity = json['validity'];
    bonus = json['bonus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['package_name'] = packageName;
    _data['package_type'] = packageType;
    _data['amount'] = amount;
    _data['validity'] = validity;
    _data['bonus'] = bonus;
    return _data;
  }
}