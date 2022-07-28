import 'package:flutter/material.dart';

class UserInforCard extends StatelessWidget {
  const UserInforCard({
    Key? key,
    required this.title,
    required this.tipo,
    required this.icon,
  }) : super(key: key);

  final String title, tipo;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
            width: 2, color: const Color(0xFF2697FF).withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Icon(icon),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tipo,
                    style: Theme.of(context).textTheme.caption!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
