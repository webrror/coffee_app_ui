import 'package:flutter/material.dart';

class CoffeeTypeOptions extends StatelessWidget {
  const CoffeeTypeOptions({
    Key? key,
    required this.coffeeType,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String coffeeType;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          children: [
            Text(
              coffeeType,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.orange : Colors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            isSelected
                ? Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(100)),
                    width: 10,
                    height: 5,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
