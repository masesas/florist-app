part of 'widgets.dart';

class CircleCheckBox extends StatelessWidget {
  final bool isCheck;

  const CircleCheckBox({
    Key? key,
    required this.isCheck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCheck ? _buildCheckBoxSelected() : _buildCheckBoxUnselected();
  }
}

Widget _buildCheckBoxSelected() {
  return Stack(
    alignment: Alignment.center,
    children: const [
      CircleAvatar(
        backgroundColor: AppColors.colorPrimaryDark,
        radius: 10,
      ),
      CircleAvatar(
        backgroundColor: Colors.white,
        radius: 8,
      ),
      CircleAvatar(
        backgroundColor: AppColors.colorPrimaryDark,
        radius: 6,
      ),
    ],
  );
}

Widget _buildCheckBoxUnselected() {
  return Stack(
    alignment: Alignment.center,
    children: const [
      CircleAvatar(
        backgroundColor: AppColors.grey6C,
        radius: 10,
      ),
      CircleAvatar(
        backgroundColor: Colors.white,
        radius: 8,
      ),
    ],
  );
}
