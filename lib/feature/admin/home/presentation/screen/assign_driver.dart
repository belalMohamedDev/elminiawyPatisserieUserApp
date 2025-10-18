import 'package:elminiawy/core/common/shared/shared_imports.dart';


class AssignDriver extends StatefulWidget {
  const AssignDriver({super.key});

  @override
  State<AssignDriver> createState() => _AssignDriverState();
}

class _AssignDriverState extends State<AssignDriver> {
  @override
  void initState() {
    context.read<AdminHomeCubit>().getAdminOrdersSummit(5);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Assign Driver",
          style: TextStyle(
            fontSize: 17,
          ),
        )),
        body: Column(
          children: [
            Container(
              
            )
          ],
        ));
  }
}
