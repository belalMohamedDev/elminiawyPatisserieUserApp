
import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  bool? status;
  String? message;

  dynamic data;

  BannerResponse({this.status, this.message, this.data});

  //from json

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    final response = _$BannerResponseFromJson(json);

    if (json['data'] is List) {
      response.data = (json['data'] as List)
          .map((item) => DataBannerResponse.fromJson(item))
          .toList();
    } else if (json['data'] is Map<String, dynamic>) {
      response.data = DataBannerResponse.fromJson(json['data']);
    }

    return response;
  }

  // to json
  Map<String, dynamic> toJson() {
    final json = _$BannerResponseToJson(this);

    if (data is List<DataBannerResponse>) {
      json['data'] = (data as List<DataBannerResponse>)
          .map((item) => item.toJson())
          .toList();
    } else if (data is DataBannerResponse) {
      json['data'] = (data as DataBannerResponse).toJson();
    }

    return json;
  }
}


@JsonSerializable()
class DataBannerResponse {
  @JsonKey(name: "_id")
  String? sId;
  String? image;
  String? startDate;
  String? endDate;

  DataBannerResponse({
    this.sId,
    this.image,
    this.startDate,
    this.endDate,
  });

  factory DataBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$DataBannerResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataBannerResponseToJson(this);
}
