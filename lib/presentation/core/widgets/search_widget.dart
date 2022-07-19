import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/search/search_bloc.dart';
import '../../../injection.dart';
import '../../router/router.gr.dart';
import '../extensions.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchBloc>(),
      child: const SearchWidgetView(),
    );
  }
}

class SearchWidgetView extends StatelessWidget {
  const SearchWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.dims.height;
    final width = context.dims.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
      ),
      child: Container(
        height: height * 0.06,
        decoration: BoxDecoration(
          color: const Color(0xff303030),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
          onFieldSubmitted: (_) {
            context.read<SearchBloc>().add(
                  const SearchEvent.searchPressed(),
                );
            context.router.push(const SearchRoute());
          },
          onChanged: (query) => context.read<SearchBloc>().add(
                SearchEvent.queryChanged(query),
              ),
        ),
      ),
    );
  }
}
