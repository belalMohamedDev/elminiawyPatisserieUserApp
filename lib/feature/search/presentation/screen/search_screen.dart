
import '../../../../../core/common/shared/shared_imports.dart'; //


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search Products",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
            context.read<ProductCubit>().clearSearch();
          },
        ),
      ),
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          context.read<ProductCubit>().clearSearch();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: const SearchScreenBody(),
        ),
      ),
    );
  }
}
