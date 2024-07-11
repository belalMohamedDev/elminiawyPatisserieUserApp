import 'package:elminiawy/core/style/fonts/strings_manger.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(AppStrings.letsGetStarted,
            style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
