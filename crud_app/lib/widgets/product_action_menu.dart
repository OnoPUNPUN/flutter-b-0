import 'package:flutter/material.dart';

class ProductActionMenu extends StatelessWidget {
  const ProductActionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Update"),
            onTap: () {
              Navigator.pop(context, "update");
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text("Delete", style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context, "delete");
            },
          ),
        ],
      ),
    );
  }
}
