import 'package:flutter/cupertino.dart';

class CarouselWidget<T> extends StatelessWidget {
  final List<T> list;
  final double height;
  final Widget Function(T) itemBuilder;

  const CarouselWidget({
    Key? key,
    this.height = 300,
    required this.list,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index)=> itemBuilder(list[index]),
          scrollDirection: Axis.horizontal,
        ),
      );
}
