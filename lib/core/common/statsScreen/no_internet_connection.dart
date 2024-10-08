import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class NoconnectionScreen extends StatelessWidget {
  const NoconnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ResponsiveUtils for layout and size adjustments based on screen size
    final responsive = ResponsiveUtils(context);
    return Scaffold(
      backgroundColor: ColorManger.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: AspectRatio(
                aspectRatio: 1,
                child: SvgPicture.asset(
                  ImageAsset.noInternetConnection,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Text(
              AppStrings.opps,
              style: TextStyle(
                fontSize: responsive.setTextSize(5),
                color: ColorManger.brun,
                fontFamily: FontConsistent.fontFamilyAcme,
              ), // Use large title style from theme
            ),

            // Add space between the title and description
            const SizedBox(height: 14),

            // Display the description text for the error or message
            Text(
              AppStrings.somethingWrongWithYourConnection,
              textAlign: TextAlign.center, // Center-align the text
              style: TextStyle(
                fontSize: responsive.setTextSize(4),
                color: ColorManger.brunLight,
                fontFamily: FontConsistent.fontFamilyAcme,
              ),
            ),

            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}


// /// Display a simple "No Internet" screen when there's no connection
// Widget _buildNoInternetScreen() {
//   return const Scaffold(
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.wifi_off, size: 100, color: Colors.red),
//           SizedBox(height: 20),
//           Text(
//             'No Internet Connection',
//             style: TextStyle(fontSize: 24, color: Colors.black),
//           ),
//         ],
//       ),
//     ),
//   );