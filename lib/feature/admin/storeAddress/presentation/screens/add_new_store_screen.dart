import 'package:elminiawy/feature/admin/storeAddress/logic/store_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewStoreScreen extends StatelessWidget {
  const AddNewStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Store")),
      body: BlocBuilder<StoreAddressCubit, StoreAddressState>(
        builder: (context, state) {
          // final cubit = context.read<StoreAddressCubit>();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle("Branch Details"),
                _card(
                  child: Column(
                    children: [
                      _inputField(
                        //  controller: cubit.branchAreaController,
                        label: "Branch Area",
                      ),
                      _inputField(
                        // controller: cubit.regionController,
                        label: "Region",
                      ),
                      _inputField(
                        // controller: cubit.briefnessController,
                        label: "Briefness",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                _sectionTitle("Store Location"),
                _card(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child:
                              // cubit.location == null
                              // ?
                              const Text("No location selected"),
                          // : Text(
                          //     "${cubit.location!.latitude}, ${cubit.location!.longitude}",
                          // ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Pick Location"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                _sectionTitle("Delivery Zone"),
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Draw Polygon"),
                      ),
                      const SizedBox(height: 10),
                      // Wrap(
                      //   spacing: 6,
                      //   children: cubit.polygonPoints
                      //       .map((p) => Chip(
                      //             label: Text("${p.latitude}, ${p.longitude}"),
                      //           ))
                      //       .toList(),
                      // ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text("Save Store"),
                  ),
                ),

                // if (state is StoreAddressLoading)
                const LinearProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _card({required Widget child}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }

  Widget _inputField({
    TextEditingController? controller,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
