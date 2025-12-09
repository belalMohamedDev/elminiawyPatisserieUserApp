import 'package:dotted_border/dotted_border.dart';
import 'package:elminiawy/core/common/shared/shared_imports.dart';

class AddNewSubCategory extends StatefulWidget {
  const AddNewSubCategory({super.key});

  @override
  State<AddNewSubCategory> createState() => _AddNewSubCategoryState();
}

class _AddNewSubCategoryState extends State<AddNewSubCategory> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.wait([context.read<CategoryCubit>().getCategories()]);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final subCategoryCubit = context.watch<SubCategoriesCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.translate(AppStrings.addNewSubCategory),
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

              _textFormData(subCategoryCubit, context, responsive),

              SizedBox(height: responsive.setHeight(3)),

              _createNewSubCategoryButton(),
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<SubCategoriesCubit, SubCategoriesState>
  _createNewSubCategoryButton() {
    return BlocConsumer<SubCategoriesCubit, SubCategoriesState>(
      listener: (context, state) {
        if (state is CreateSubCategoriesSuccess) {
          context.pop();
        } else if (state is CreateSubCategoriesError) {
          ShowToast.showToastErrorTop(
            errorMessage: state.apiErrorModel.message!,
            context: context,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            final cubit = context.read<SubCategoriesCubit>();

            // Validate form
            if (!formKey.currentState!.validate()) {
              return;
            }

            if (cubit.categoryValueId == null) {
              ShowToast.showToastErrorTop(
                errorMessage: "من فضلك اختر فئة",
                context: context,
              );

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

            cubit.fetchCreationNewSubCategory();
          },
          widget: LoadingButtonContent(
            defaultText: AppStrings.addNewSubCategory,
            state: state,
          ),
        );
      },
    );
  }

  Column _textFormData(
    SubCategoriesCubit subCategoriesCubit,
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: subCategoriesCubit.arTitleController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.enterArabicTitle),
          ),

          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),

        SizedBox(height: responsive.setHeight(1.5)),
        TextFormField(
          controller: subCategoriesCubit.enTitleController,

          decoration: InputDecoration(
            hintText: context.translate(AppStrings.enterEnglishTitle),
          ),

          validator: (v) =>
              v!.isEmpty ? context.translate(AppStrings.required) : null,
        ),
        SizedBox(height: responsive.setHeight(1.5)),

        CustomDropdownButtonFormField(
          value: context.translate(AppStrings.category),
          items: context.read<CategoryCubit>().categoriesTitle,
          onChanged: (value) {
            String? categoryId = context
                .read<CategoryCubit>()
                .returnCategoryIdType(value!);
            context.read<SubCategoriesCubit>().setCategoryId(categoryId!);
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
          onTap: () => context.read<SubCategoriesCubit>().pickImage(),
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
                child: context.read<SubCategoriesCubit>().imageFile == null
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
          context.read<SubCategoriesCubit>().imageFile!,
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
