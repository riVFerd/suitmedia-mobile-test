import 'package:flutter/material.dart';
import 'package:flutter_suitmedia/logic/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final void Function()? onTap;

  const UserCard({
    super.key,
    required this.user,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(right: 8),
        child: Image.network(user.avatar),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
      onTap: onTap,
    );
  }
}
