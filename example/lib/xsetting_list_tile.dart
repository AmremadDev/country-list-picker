import 'package:flutter/material.dart';

class XSettingListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leading;
  final IconData? trailing;
  final Switch? toggle;
  final GestureTapCallback? onTap;
  final bool divider ;
  const XSettingListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.toggle,
    this.divider = false,
    this.onTap,
  }) : assert(trailing == null || toggle == null, "you can select one widget only for trailing");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold )),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          leading: leading != null ? Icon(leading!) : null,
          trailing: trailing != null ? Icon(trailing!) : toggle,
          onTap: onTap,
        ),
       if (divider == true) const Divider(thickness: 1, indent: 60, endIndent: 60),
      ],
    );
  }
}