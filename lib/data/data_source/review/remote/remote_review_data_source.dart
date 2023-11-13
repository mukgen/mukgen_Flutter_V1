import 'package:mukgen_flutter_v1/core/network/networking.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/data/data_source/review/remote/review_endpoint.dart';
import 'package:mukgen_flutter_v1/data/dto/review/response/read_all_review_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/review/response/read_another_day_review_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/review/response/read_detail_review_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/review/response/read_my_review_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/review/response/read_review_ranking_response_dto.dart';
import 'package:mukgen_flutter_v1/data/dto/review/response/read_today_review_response_dto.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/detail_review_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/simple_review_for_day_entity.dart';
import 'package:mukgen_flutter_v1/domain/entity/review/simple_review_for_ranking_entity.dart';

class RemoteReviewDataSource {
  final Networking _networking;

  RemoteReviewDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<DetailReviewEntity, Exception>> readDetailReview(
      {required int reviewId}) async {
    final res = await _networking
        .request<ReadDetailReviewResponseDTO, ReadDetailReviewResponseDTO>(
            endpoint: ReviewEndpoint.readDetailReview(reviewId: reviewId),
            responseType: ReadDetailReviewResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<List<DetailReviewEntity>, Exception>> readMyReview() async {
    final res = await _networking
        .request<ReadMyReviewResponseDTO, ReadMyReviewResponseDTO>(
            endpoint: ReviewEndpoint.readMyReview(),
            responseType: ReadMyReviewResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<List<SimpleReviewForRankingEntity>, Exception>>
      readReviewRanking() async {
    final res = await _networking
        .request<ReadReviewRankingResponseDTO, ReadReviewRankingResponseDTO>(
            endpoint: ReviewEndpoint.readReviewRanking(),
            responseType: ReadReviewRankingResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<List<SimpleReviewForDayEntity>, Exception>>
      readTodayReview() async {
    final res = await _networking
        .request<ReadTodayReviewResponseDTO, ReadTodayReviewResponseDTO>(
            endpoint: ReviewEndpoint.readTodayReview(),
            responseType: ReadTodayReviewResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<List<SimpleReviewForDayEntity>, Exception>>
      readAnotherDayReview({required String date}) async {
    final res = await _networking.request<ReadAnotherDayReviewResponseDTO,
            ReadAnotherDayReviewResponseDTO>(
        endpoint: ReviewEndpoint.readAnotherDayReview(date: date),
        responseType: ReadAnotherDayReviewResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }

  Future<Result<List<DetailReviewEntity>, Exception>> readAllReview() async {
    final res = await _networking
        .request<ReadAllReviewResponseDTO, ReadAllReviewResponseDTO>(
            endpoint: ReviewEndpoint.readAllReview(),
            responseType: ReadAllReviewResponseDTO());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
