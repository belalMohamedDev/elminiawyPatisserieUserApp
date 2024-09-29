
import '../../../../../core/common/shared/shared_imports.dart'; // Import the barrel file

class BuildSearchResults extends StatelessWidget {
  const BuildSearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        final mapCuibt = context.read<MapCubit>();

        if (state is SearchResults) {
          return Positioned(
            top: 100.h,
            right: 10.w,
            left: 10.w,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: ColorManger.brunLight,
                    borderRadius: BorderRadius.circular(10.r)),
                constraints: BoxConstraints(
                  maxHeight: 320.h,
                ),
                child: ListView.builder(
                  itemCount: state.predictions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        state.predictions[index].description!,
                        style: TextStyle(color: ColorManger.white),
                      ),
                      onTap: () {
                        mapCuibt.moveToLocationInTextFormField(
                            state.predictions[index]);

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
