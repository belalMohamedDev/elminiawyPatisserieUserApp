import 'package:elminiawy/core/common/shared/shared_imports.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.widget,
    this.baseColor,
    this.highlightColor,
  });
  final double? height;
  final double? width;
  final double? borderRadius;
  final Widget? widget;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade600,
      highlightColor: highlightColor ?? Colors.grey.shade400,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 14),
          ),
        ),
        child: widget,
      ),
    );
  }
}
