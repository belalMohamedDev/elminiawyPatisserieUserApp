import 'package:dotted_border/dotted_border.dart';
import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/storeAddress/logic/store_address_cubit.dart';

class AddNewAdmin extends StatefulWidget {
  const AddNewAdmin({super.key});

  @override
  State<AddNewAdmin> createState() => _AddNewAdminState();
}

class _AddNewAdminState extends State<AddNewAdmin> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<StoreAddressCubit>().fetchStoreAddressDriver();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final adminsCubit = context.watch<AdminsCubit>();
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${context.translate(AppStrings.addNew)} ${context.translate(AppStrings.admins)}",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontSize: responsive.setTextSize(4)),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdvancedImagePicker(),
              SizedBox(height: responsive.setHeight(2)),

              _textFormData(adminsCubit, context, responsive),

              SizedBox(height: responsive.setHeight(3)),

              _createProductButton(),
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<AdminsCubit, AdminsState> _createProductButton() {
    return BlocConsumer<AdminsCubit, AdminsState>(
      listener: (context, state) {
        // if (state is UpdateProductSuccess) {
        //   context.pop();
        // } else if (state is UpdateProductError) {
        //   ShowToast.showToastErrorTop(
        //     errorMessage: state.apiErrorModel.message!,
        //     context: context,
        //   );
        // }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            // final cubit = context.read<AdminsCubit>();

            // // Validate form
            // if (!formKey.currentState!.validate()) {
            //   return;
            // }

            // // Validate image
            // if (cubit.imageFile == null) {
            //   ShowToast.showToastErrorTop(
            //     errorMessage: "من فضلك اختر صورة للمنتج",
            //     context: context,
            //   );

            //   return;
            // }

            // // Validate image
            // if (cubit.subCategoryValueId == null) {
            //   ShowToast.showToastErrorTop(
            //     errorMessage: "من فضلك اختر فئة",
            //     context: context,
            //   );

            //   return;
            // }

            // cubit.fetchCreateProduct();
          },
          widget: LoadingButtonContent(
            defaultText: AppStrings.addNew,
            state: state,
          ),
        );
      },
    );
  }

  Column _textFormData(
    AdminsCubit adminsCubit,
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    final storeAddressCubit = context.watch<StoreAddressCubit>();

    return Column(
      children: [
        TextFormField(
          controller: adminsCubit.email,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.emailExample),
          ),

          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),

        SizedBox(height: responsive.setHeight(1.5)),

        CustomDropdownButtonFormField(
          value: context.translate(AppStrings.addNewSubCategory),
          items: storeAddressCubit.storeBranchArea,
          onChanged: (value) {
            String? storeAreaId = context
                .read<StoreAddressCubit>()
                .returnStoreAreaId(value!);

            // context.read<AdminsCubit>().setSubCategoryId(subCategoryId!);
          },
        ),
      ],
    );
  }
}

class AdvancedImagePicker extends StatefulWidget {
  const AdvancedImagePicker({super.key});

  @override
  State<AdvancedImagePicker> createState() => _AdvancedImagePickerState();
}

class _AdvancedImagePickerState extends State<AdvancedImagePicker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.read<AdminsCubit>().pickImage(),
          child: DottedBorder(
            animation: _controller,
            options: const RoundedRectDottedBorderOptions(
              dashPattern: [10, 6],
              strokeWidth: 2,
              radius: Radius.circular(16),
              color: Colors.grey,
              padding: EdgeInsets.zero,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey.shade100),
                child: context.read<AdminsCubit>().imageFile == null
                    ? _buildPlaceholder()
                    : _buildImagePreview(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.cloud_upload_rounded, size: 42, color: Colors.grey.shade600),
        const SizedBox(height: 10),
        Text(
          context.translate(AppStrings.tapToUploadImage),
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildImagePreview() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.file(context.read<AdminsCubit>().imageFile!, fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withValues(alpha: 0.25),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}
