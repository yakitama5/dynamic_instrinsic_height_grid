import 'dart:math';

import 'package:flutter/material.dart';

class DynamicInstrinsicHeightGrid extends StatelessWidget {
  const DynamicInstrinsicHeightGrid({
    super.key,
    required List<Widget> childlen,
    this.runSpacing = 0,
    this.spacing = 0,
    this.itemBoxConstraints,
  }) : _childlen = childlen;

  final List<Widget> _childlen;
  final double runSpacing;
  final double spacing;
  final BoxConstraints? itemBoxConstraints;
  static const _crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    final itemCount = (_childlen.length / _crossAxisCount).ceil();

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) => IntrinsicHeight(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _childlen
                .sublist(
                    index * _crossAxisCount,
                    min(index * _crossAxisCount + _crossAxisCount,
                        _childlen.length))
                .map(
                  (e) => SizedBox(
                      width:
                          (MediaQuery.of(context).size.width / _crossAxisCount),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: spacing / _crossAxisCount,
                          right: spacing / _crossAxisCount,
                          bottom: runSpacing,
                        ),
                        child: Container(
                          constraints: itemBoxConstraints,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: e,
                        ),
                      )),
                )
                .toList()),
      ),
    );
  }
}
