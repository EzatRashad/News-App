import 'package:flutter/material.dart';
import 'package:news_app/core/utils.dart';
import 'package:news_app/features/home/widgets/article_widget.dart';
import 'package:news_app/features/home/widgets/tab_item.dart';

import '../../../models/source_model.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
    required this.sources,
  });
  final List<Source> sources;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedSourceIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.sources.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSourceIndex = index;
                        });
                      },
                      child: TabItem(
                        isSelect: selectedSourceIndex == index,
                        name: widget.sources[index].name ?? '',
                      ),
                    ),
                  );
                },
              ),
            ),
            15.ph,
            Expanded(
              child: ArticleWidget(
                                key: ValueKey(widget.sources[selectedSourceIndex].id),

                source: widget.sources[selectedSourceIndex]),
            ),
          ],
        ),
      ),
    );
  }
}
