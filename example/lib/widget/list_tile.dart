import 'package:flutter/material.dart';

class XListTile extends StatelessWidget {
  final String? titleAsString;
  final Widget? titleAsWidget;

  final Widget? subtitleASWidge;
  final String? subtitleASString;

  final IconData? leading;
  final Switch? toggle;
  final GestureTapCallback? onTap;
  final bool enabled;
  const XListTile({
    super.key,
    this.titleAsString,
    this.titleAsWidget,
    this.subtitleASString,
    this.subtitleASWidge,
    this.leading,
    this.toggle,
    this.enabled = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: (toggle != null) ? toggle!.value : true,
      title: titleAsWidget ??
          ((titleAsString != null)
              ? Text(titleAsString!,
                  style: TextStyle(
                      color: enabled == true ? null : Theme.of(context).disabledColor,
                      fontWeight: FontWeight.bold))
              : null),
      style: ListTileStyle.list,
      subtitle: subtitleASWidge ??
          ((subtitleASString != null)
              ? Text(subtitleASString!, style: const TextStyle(fontWeight: FontWeight.bold))
              : null),
      leading: leading != null ? Icon(leading!) : null,
      trailing: toggle,
      onTap: onTap,
    );
  }
}
