import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaginatedListView extends StatefulWidget {
  final Widget? Function(BuildContext, int) builder;
  final Future<void> Function() onRefresh;
  final VoidCallback onScrollEnd;
  final List<dynamic> data;

  const PaginatedListView({
    super.key,
    required this.builder,
    required this.data,
    required this.onRefresh,
    required this.onScrollEnd,
  });

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController()..addListener(widget.onScrollEnd);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: ListView.separated(
        controller: _controller,
        itemBuilder: widget.builder,
        separatorBuilder: (context, index) {
          return const Gap(10);
        },
        itemCount: widget.data.length,
      ),
    );
  }
}
