import 'package:elminiawy/core/common/shared/shared_imports.dart';

class DriverTable extends StatelessWidget {
  const DriverTable({
    super.key,
    required this.state,
    this.isActive = true,
  });

  final DriverState state;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    List<DataAuthResponse> data = isActive
        ? context.read<DriverCubit>().allActiveDriver
        : context.read<DriverCubit>().allNotActiveDriver;
    return Column(
      children: [
        DataTable(
          showCheckboxColumn: false,
          columnSpacing: responsive.setWidth(0),
          horizontalMargin: responsive.setWidth(5),
          headingRowColor: WidgetStateProperty.all(Colors.grey[100]),
          border: TableBorder(
            bottom: BorderSide(color: Colors.grey[400]!, width: 1),
            top: BorderSide(color: Colors.grey[400]!, width: 0.5),
          ),
          columns: [
            DataColumn(
              label: responsive.setSizeBox(
                width: 39,
                child: Text(
                  context.translate(AppStrings.driverName),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: responsive.setTextSize(3),
                      ),
                ),
              ),
            ),
            DataColumn(
              label: responsive.setSizeBox(
                width: 22,
                child: Text(
                  context.translate(AppStrings.phoneNumber),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: responsive.setTextSize(3),
                      ),
                ),
              ),
            ),
            DataColumn(
              label: responsive.setSizeBox(
                width: 31,
                child: Center(
                  child: Text(
                    context.translate(AppStrings.email),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: responsive.setTextSize(3),
                        ),
                  ),
                ),
              ), // Icon column for Active/Inactive action
            ),
          ],
          rows: [
            ...data.map((item) {
              return DataRow(
                onSelectChanged: (_) {},
                cells: [
                  DataCell(
                    responsive.setSizeBox(
                      width: 39,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        item.name!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: responsive.setTextSize(2.8),
                            ),
                      ),
                    ),
                  ),
                  DataCell(
                    responsive.setSizeBox(
                        width: 20,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          item.phone!,
                          style: TextStyle(
                            color: ColorManger.brun,
                            fontSize: responsive.setTextSize(2.8),
                            fontFamily: FontConsistent.geLocalozedFontFamily(),
                          ),
                        )),
                  ),
                  DataCell(
                    responsive.setSizeBox(
                        width: 31,
                        child: Text(
                          item.email!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: ColorManger.brun,
                            fontSize: responsive.setTextSize(2.8),
                            fontFamily: FontConsistent.geLocalozedFontFamily(),
                          ),
                        )),
                  ),
                ],
              );
            }),
          ],
        ),
        responsive.setSizeBox(height: 3),
        if (state is GetAllNotActiveDriverLoading ||
            state is GetAllNotActiveDriverError)
          CircularProgressIndicator(
            color: ColorManger.brun,
          ),
      ],
    );
  }
}
