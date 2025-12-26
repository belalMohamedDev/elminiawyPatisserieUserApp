import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AnimatedContainerWidget extends StatelessWidget {
  final double xOffset;
  final double yOffset;
  final double rotate;
  final double scaleFactor;
  final Color color;

  const AnimatedContainerWidget({
    super.key,
    required this.xOffset,
    required this.yOffset,
    required this.rotate,
    required this.scaleFactor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..multiply(
          Matrix4.diagonal3Values(scaleFactor, scaleFactor, scaleFactor),
        )
        ..rotateZ(rotate),
      duration: const Duration(milliseconds: 250),
    );
  }
}
