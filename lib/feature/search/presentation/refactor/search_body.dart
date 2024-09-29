
import '../../../../../core/common/shared/shared_imports.dart'; //



class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final getProduct = context.read<ProductCubit>();

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40.h,
                    child: TextFormField(
                      onChanged: (value) => getProduct.addItemToList(
                        value,
                        minPrice: getProduct.selectedRange.start,
                        maxPrice: getProduct.selectedRange.end,
                        sortOrder: getProduct.getSortOrder(),
                      ),
                      keyboardType: TextInputType.text,
                      controller: getProduct.search,
                      decoration: InputDecoration(
                          hintText: 'Find Your Patisserie',
                          prefixIcon: Icon(IconlyBroken.search,
                              size: 18.sp, color: ColorManger.brunLight),
                          hintStyle: TextStyle(color: ColorManger.brunLight),
                          fillColor: ColorManger.backgroundItem,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManger.backgroundItem,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManger.backgroundItem,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10.r, 10.r)),
                          )),
                    ),
                  ),
                ),
                Container(
                  height: 41.h,
                  margin: EdgeInsets.only(left: 10.w, right: 5.w),
                  decoration: BoxDecoration(
                    color: ColorManger.brun,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: IconButton(
                    icon: Icon(IconlyBroken.filter, color: ColorManger.white),
                    onPressed: () {
                      showSortBottomSheet(context);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is AddItemToList) {
                    if (state.getFoundData.isEmpty) {
                      return const EmptySearchScreen();
                    }
                    return Padding(
                      padding:
                          EdgeInsets.only(top: 25.h, left: 5.w, right: 5.w),
                      child: ProductGridViewSuccessState(
                        dataList: state.getFoundData,
                        isSearchActive: true,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            )
          ],
        );
      },
    );
  }

  void showSortBottomSheet(BuildContext context) {
    showBarModalBottomSheet(
        elevation: 20.r,
        barrierColor: Colors.black54,
        context: context,
        builder: (context) => const FilterBottomSheet());
  }
}
