import 'package:dotted_border/dotted_border.dart';

import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/product/logic/adminProduct/admin_product_cubit.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<SubCategoriesCubit>().fetchGetSubCategories(
      disablePagination: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productCubit = context.watch<AdminProductCubit>();
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.translate(AppStrings.addNewProduct),
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

              _textFormData(productCubit, context, responsive),

              SizedBox(height: responsive.setHeight(3)),

              _createProductButton(),
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<AdminProductCubit, AdminProductState> _createProductButton() {
    return BlocConsumer<AdminProductCubit, AdminProductState>(
      listener: (context, state) {
        if (state is UpdateProductSuccess) {
          context.pop();
        } else if (state is UpdateProductError) {
          ShowToast.showToastErrorTop(
            errorMessage: state.apiErrorModel.message!,
            context: context,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            final cubit = context.read<AdminProductCubit>();

            // Validate form
            if (!formKey.currentState!.validate()) {
              return;
            }

            // Validate image
            if (cubit.imageFile == null) {
              ShowToast.showToastErrorTop(
                errorMessage: "من فضلك اختر صورة للمنتج",
                context: context,
              );

              return;
            }

            // Validate image
            if (cubit.subCategoryValueId == null) {
              ShowToast.showToastErrorTop(
                errorMessage: "من فضلك اختر فئة",
                context: context,
              );

              return;
            }

            cubit.fetchCreateProduct();
          },
          widget: LoadingButtonContent(
            defaultText: AppStrings.createProduct,
            state: state,
          ),
        );
      },
    );
  }

  Column _textFormData(
    AdminProductCubit productCubit,
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    final subCategoryCubit = context.watch<SubCategoriesCubit>();

    return Column(
      children: [
        CustomDropdownButtonFormField(
          value: context.translate(AppStrings.addNewSubCategory),
          items: subCategoryCubit.subCategoriesTitle,
          onChanged: (value) {
            String? subCategoryId = context
                .read<SubCategoriesCubit>()
                .returnSubCategoryIdType(value!);

            context.read<AdminProductCubit>().setSubCategoryId(subCategoryId!);
          },
        ),
        SizedBox(height: responsive.setHeight(1.5)),

        TextFormField(
          controller: productCubit.arTitleController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.enterArabicTitle),
          ),

          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),

        SizedBox(height: responsive.setHeight(1.5)),
        TextFormField(
          controller: productCubit.enTitleController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.enterEnglishTitle),
          ),

          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),

        SizedBox(height: responsive.setHeight(1.5)),
        TextFormField(
          controller: productCubit.arDescriptionController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.enterArabicDescription),
          ),

          maxLines: 3,
          minLines: 1,
          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),

        SizedBox(height: responsive.setHeight(1.5)),
        TextFormField(
          controller: productCubit.enDescriptionController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.enterEnglishDescription),
          ),
          minLines: 1,

          maxLines: 3,
          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),
        SizedBox(height: responsive.setHeight(1.5)),
        TextFormField(
          controller: productCubit.priceController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.enterPrice),
          ),

          keyboardType: TextInputType.number,

          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
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
          onTap: () => context.read<AdminProductCubit>().pickImage(),
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
                child: context.read<AdminProductCubit>().imageFile == null
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
        Image.file(
          context.read<AdminProductCubit>().imageFile!,
          fit: BoxFit.cover,
        ),
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
