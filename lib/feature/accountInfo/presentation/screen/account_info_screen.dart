


import '../../../../../core/common/shared/shared_imports.dart'; //

class AccountInfomation extends StatefulWidget {
  const AccountInfomation({super.key});

  @override
  State<AccountInfomation> createState() => _AccountInfomationState();
}

class _AccountInfomationState extends State<AccountInfomation> {
  @override
  void initState() {
    super.initState();
    context.read<AccountInformationCubit>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("       My Account Information",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: FontConsistent.fontFamilyAcme,
                color: ColorManger.brun,
                fontSize: 16.sp)),
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          InkWell(
            onTap: () {
              context.read<AccountInformationCubit>().enablTextFormField();
              context.read<AccountInformationCubit>().getUserInfo();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 18.w),
              child: Text("Edit",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: FontConsistent.fontFamilyAcme,
                      color: ColorManger.primary,
                      fontSize: 15.sp)),
            ),
          )
        ],
      ),
      body: const AccountInfomationBody(),
    );
  }
}
