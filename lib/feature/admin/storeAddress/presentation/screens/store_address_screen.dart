import 'package:elminiawy/core/common/shared/shared_imports.dart';

import 'package:elminiawy/feature/admin/storeAddress/logic/store_address_cubit.dart';


class StoreAddressScreen extends StatefulWidget {
  const StoreAddressScreen({super.key});

  @override
  State<StoreAddressScreen> createState() => _StoreAddressScreenState();
}

class _StoreAddressScreenState extends State<StoreAddressScreen> {
  @override
  void initState() {
    context.read<StoreAddressCubit>().fetchStoreAddressDriver();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Store Address",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: responsive.setTextSize(4)),
        ),
      ),

      body: Column(
        children: [
          ListTile(
            
          )
        ],
      ),
    );
  }
}
