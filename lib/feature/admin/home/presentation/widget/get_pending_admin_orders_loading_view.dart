import '../../../../../core/common/shared/shared_imports.dart';

class GetPendingAdminOrdersLoadingView extends StatelessWidget {
  const GetPendingAdminOrdersLoadingView({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding:
        responsive.setPadding(left: 4, right: 4, bottom: 2),
        child: Container(
          height: responsive.setHeight(17),
          width: responsive.screenWidth,
          decoration: BoxDecoration(
              color: ColorManger.backgroundItem,
              borderRadius: BorderRadius.circular(
                  responsive.setBorderRadius(4))),
          child: Padding(
            padding: responsive.setPadding(
                left: 3, top: 2.4, bottom: 0.5, right: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [


                Row(

                  children: [
                    Expanded(
                      child: Column(

                        children: [

                          LoadingShimmer(
                            height: responsive.setHeight(2.4),
                            width: responsive.setWidth(5),
                            borderRadius: responsive.setBorderRadius(1),
                          ),



                          const SizedBox(height: 15,),

                          LoadingShimmer(
                            height: responsive.setHeight(0.5),
                            width: responsive.setWidth(14),
                            borderRadius: responsive.setBorderRadius(1),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                      child: Column(
                        children: [

                          LoadingShimmer(
                            height: responsive.setHeight(2.4),
                            width: responsive.setWidth(5),
                            borderRadius: responsive.setBorderRadius(1),
                          ),

                          const SizedBox(height: 15,),

                          LoadingShimmer(
                            height: responsive.setHeight(0.5),
                            width: responsive.setWidth(14),
                            borderRadius: responsive.setBorderRadius(1),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                      child: Column(
                        children: [

                          LoadingShimmer(
                            height: responsive.setHeight(2.4),
                            width: responsive.setWidth(5),
                            borderRadius: responsive.setBorderRadius(1),
                          ),


                          const SizedBox(height: 15,),

                          LoadingShimmer(
                            height: responsive.setHeight(0.5),
                            width: responsive.setWidth(14),
                            borderRadius: responsive.setBorderRadius(1),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          LoadingShimmer(
                            height: responsive.setHeight(2.4),
                            width: responsive.setWidth(5),
                            borderRadius: responsive.setBorderRadius(1),
                          ),



                          const SizedBox(height: 15,),

                          LoadingShimmer(
                            height: responsive.setHeight(0.5),
                            width: responsive.setWidth(14),
                            borderRadius: responsive.setBorderRadius(1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


                const Spacer(),


                Row(

                  children: [

                    LoadingShimmer(
                      height: responsive.setHeight(5),
                      width: responsive.setWidth(41),
                      borderRadius: responsive.setBorderRadius(3),

                    ),
                    const Spacer(),
                    LoadingShimmer(
                      height: responsive.setHeight(5),
                      width: responsive.setWidth(41),
                      borderRadius: responsive.setBorderRadius(3),

                    ),

                  ],
                ),

                const Spacer(),

              ],
            ),
          ),
        ),
      ),
      itemCount: 5,
    );
  }
}
