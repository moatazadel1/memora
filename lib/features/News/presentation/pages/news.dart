import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memora/config/routes/app_router.dart';
import 'package:memora/features/News/presentation/bloc/news_bloc.dart';
import 'package:memora/features/News/presentation/pages/News_Details.dart';
import '../../../../config.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/utilies/app_colors.dart';
import '../../data/models/NewsModel.dart';
import '../widgets/NewsItem.dart';

class News extends StatefulWidget {
  News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  var newsBloc = getIt<NewsBloc>();

  bool isclicked = false;

  Articles? article;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsBloc..add(GetNews()),
      child: Scaffold(
        appBar: isclicked
            ? AppBar(
                leading: IconButton(
                  onPressed: () {
                    isclicked = false;
                    setState(() {});
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                title: Text("Alzheimer News",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.primaryColor, fontSize: 20)),
                centerTitle: true,
              )
            : AppBar(
                title: Text("Alzheimer News",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.primaryColor, fontSize: 20)),
                centerTitle: true,
              ),
        body: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state.status == RequestStatus.failure) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text("Something went wrong."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("OK"),
                    ),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == RequestStatus.loading) {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
            }
            if (state.status == RequestStatus.success) {
              List<Articles>? data = state.newsModel?.articles ?? [];
              switch (isclicked) {
                case false:
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return NewsItem(
                        onClick: () {
                          article = data[index];
                          isclicked = true;
                          setState(() {});
                        },
                        article: data[index],
                      );
                    },
                  );
                default:
                  return NewsDetails(article: article!);
              }
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
