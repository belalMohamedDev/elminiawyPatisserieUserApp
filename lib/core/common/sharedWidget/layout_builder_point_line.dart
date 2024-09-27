import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class LayoutBuilderPointLine extends StatelessWidget {
  const LayoutBuilderPointLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final dashWidth = 1.w;
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.vertical,
        children: List.generate(10, (_) {
          return SizedBox(
            width: dashWidth,
            height: 12.h,
            child: DecoratedBox(
              decoration: BoxDecoration(color: ColorManger.brownLight),
            ),
          );
        }),
      );
    });
  }
}
