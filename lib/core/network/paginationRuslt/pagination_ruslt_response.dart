import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'pagination_ruslt_response.g.dart';




@JsonSerializable()
class PaginationRuslt {
  int? currentPage;
  int? limit;
  int? numberOfPages;
  int? next;

  PaginationRuslt(
      {this.currentPage, this.limit, this.numberOfPages, this.next});

  factory PaginationRuslt.fromJson(Map<String, dynamic> json) =>
      _$PaginationRusltFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$PaginationRusltToJson(this);
}

