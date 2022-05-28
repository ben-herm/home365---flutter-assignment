import 'package:flutter/material.dart';
import 'package:home_365_assignment/core/UI/widgets/loaders/main_circular_loader.dart';

class CustomButton extends StatelessWidget {
  final Widget text;
  final Color color;
  final VoidCallback onTap;
  final bool loading;
  const CustomButton({
    required this.text,
    required this.color,
    required this.onTap,
    this.loading = false,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width * 0.35,
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: loading
              ? const MainCircularLoader()
              : Center(
                  child: Ink(
                    color: color,
                    child: text,
                  ),
                ),
        ),
        color: Colors.transparent,
      ),
      color: color,
    );
  }
}
