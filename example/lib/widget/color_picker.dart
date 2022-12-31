import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final List<Color> colors;
  final ValueChanged<Color>? onColorChanged;
  final Color value;
  final bool enabled;

  const ColorPicker({
    this.colors = const [
      Colors.transparent,
      Colors.white,
      Colors.grey,
      Color(0xFF424242),
      Color(0xFF313030),
      Colors.black,
      Colors.red,
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
    ],
    this.value = Colors.black,
    this.onColorChanged,
    this.enabled = true,
    super.key,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int selectedIndex = 0;
  List<Color> colorList = [];
  @override
  void initState() {
    colorList = widget.colors;
    selectedIndex = colorList.indexOf(widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Flexible(
        child: AbsorbPointer(
          absorbing: !widget.enabled,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.colors.length, crossAxisSpacing: 5),
            itemCount: colorList.length,
            itemBuilder: (BuildContext context, int index) {
              return FloatingActionButton(
                heroTag: null,
                elevation: 5,
                backgroundColor: colorList[index],
                onPressed: () {
                  setState(() => selectedIndex = index);
                  if (widget.onColorChanged != null) widget.onColorChanged!(colorList[index]);
                },
                child: (selectedIndex == index)
                    ? Center(
                        child: Icon(Icons.check,
                            size: 15,
                            color: (colorList[index].value >= 4294961979 ||
                                    colorList[index].value == 0)
                                ? Colors.black
                                : Colors.white),
                      )
                    : null,
              );
            },
          ),
        ),
      ),
    ]);
  }
}
