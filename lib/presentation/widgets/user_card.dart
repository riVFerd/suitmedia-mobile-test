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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 46, // Adjust the radius as needed
          backgroundImage: NetworkImage(user.avatar),
        ),
        title: Text('${user.firstName} ${user.lastName}'),
        subtitle: Text(user.email),
        onTap: onTap,
      ),
    );
  }
}
