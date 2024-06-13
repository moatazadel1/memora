import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/core/enums/enums.dart';
import 'package:memora/core/failures/failures.dart';
import 'package:memora/features/News/data/models/NewsModel.dart';

import '../../domain/use_cases/news_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';
@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsUseCase newsUseCase;
  NewsBloc(this.newsUseCase) : super(const NewsState()) {
    on<GetNews>((event, emit)async {
      emit(state.copyWith(status: RequestStatus.loading));
      var result = await newsUseCase.call();
      result.fold((l) => emit(
        state.copyWith(
          status: RequestStatus.failure,
          failures: l
        )
      ), (r) => emit(
        state.copyWith(
          status: RequestStatus.success,
          newsModel: r
        )
      ));
    });
  }
}
