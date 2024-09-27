import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 400.w),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold, color: ColorManger.brun),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManger.brunLight),
            ),
            const SizedBox(height: 16 * 2.5),
            btnText == null
                ? const SizedBox()
                : button ??
                    ElevatedButton(
                      onPressed: press,
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: ColorManger.primary,
                          foregroundColor: ColorManger.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      child: Text(btnText ?? "Retry".toUpperCase()),
                    ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
