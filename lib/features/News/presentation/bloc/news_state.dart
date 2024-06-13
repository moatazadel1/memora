part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState(
      {@Default(RequestStatus.init) RequestStatus status,
      Failures? failures,
      NewsModel? newsModel}) = _NewsState;
}
