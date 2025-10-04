import 'package:elminiawy/core/common/shared/shared_imports.dart';

class BuildSearchResults extends StatelessWidget {
  const BuildSearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        final mapCuibt = context.read<MapCubit>();
        bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

        if (state is SearchResults) {
          final filteredPlaces = state.placesList
              .where((place) =>
                  place.placeName != null && place.placeName!.trim().isNotEmpty)
              .toList();
          return Padding(
            padding: responsive.setPadding(
                top: 13, left: isEnLocale ? 6 : 4, right: isEnLocale ? 4 : 6),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ColorManger.brunLight,
                    borderRadius:
                        BorderRadius.circular(responsive.setBorderRadius(2))),
                // constraints: BoxConstraints(
                //   maxHeight: responsive.setHeight(30),
                // ),
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: filteredPlaces.length,
                  itemBuilder: (BuildContext context, int index) {
                    final placeName = filteredPlaces[index].placeName!;

                    return ListTile(
                      leading:
                          const Icon(Icons.location_on, color: Colors.white),
                      title: Text(
                        placeName,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: responsive.setTextSize(3.5),
                                ),
                      ),
                      onTap: () {
                        mapCuibt.moveToLocationInTextFormField(
                            filteredPlaces[index]);

                        // .(predictions[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
