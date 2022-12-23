import 'package:flutter/material.dart';

class XListTile extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final IconData? leading;
  final Switch? toggle;
  final GestureTapCallback? onTap;
  final bool divider;
  final bool enabled;
  const XListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.toggle,
    this.divider = false,
    this.enabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          enabled: (toggle != null) ? toggle!.value : true,
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          style: ListTileStyle.list,
          subtitle: subtitle,
          leading: leading != null ? Icon(leading!) : null,
          trailing: toggle,
          onTap: onTap,
        ),
        if (divider == true) const Divider(thickness: 1, indent: 60, endIndent: 60),
      ],
    );
  }
}
