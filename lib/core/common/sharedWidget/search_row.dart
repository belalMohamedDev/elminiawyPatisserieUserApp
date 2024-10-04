import '../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the ResponsiveUtils to handle responsive layout adjustments
    final responsive = ResponsiveUtils(context);

    return InkWell(
      onTap: () {
        NavBarNavigator.push(context,
            screen: const SearchView(), withNavBar: false);
      },
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: responsive.setHeight(5.5),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: AppStrings.findYourPatisserie,
                  prefixIcon: Icon(IconlyBroken.search,
                      size: responsive.setIconSize(5),
                      color: ColorManger.brunLight),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: responsive.setTextSize(3.5)),
                  fillColor: ColorManger.backgroundItem,
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManger.backgroundItem,
                    ),
                    borderRadius: BorderRadius.all(Radius.elliptical(
                        responsive.setBorderRadius(2),
                        responsive.setBorderRadius(2))),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: responsive.setHeight(5.5),
            margin: responsive.setMargin(left: 3, right: 2),
            decoration: BoxDecoration(
              color: ColorManger.brun,
              borderRadius:
                  BorderRadius.circular(responsive.setBorderRadius(2)),
            ),
            child: IconButton(
              icon: Icon(
                IconlyBroken.filter,
                color: ColorManger.white,
              ),
              onPressed: () {
                NavBarNavigator.push(context,
                    screen: const SearchView(), withNavBar: false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
