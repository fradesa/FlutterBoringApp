// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boring_app/boring_drawer_tile_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoringDrawerEntry extends StatelessWidget {
  final String path;
  final String label;
  final Icon? icon;
  final List<BoringDrawerEntry>? subEntries;
  final BoringDrawerTileStyle drawerTileStyle;

  BoringDrawerEntry(
      {super.key,
      required this.path,
      required this.label,
      this.icon,
      this.subEntries,
      this.drawerTileStyle = const BoringDrawerTileStyle()});

  bool get _hasSubentries => subEntries != null && subEntries!.isNotEmpty;

  bool checkIfSelected(BuildContext context) {
    final loc = GoRouter.of(context).location;
    return path == loc ||
        (!_hasSubentries && path != "/" && loc.contains(path));
  }

  late final Color textColor =
      drawerTileStyle.selectedColor.computeLuminance() > 0.5
          ? Colors.black
          : Colors.white;
  Color _textColor(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.color!;
  }

  Color _unselectedTextColor(BuildContext context) {
    return Theme.of(context).unselectedWidgetColor;
  }

  Widget tile(BuildContext context) {
    //if (entry.subEntries == null || entry.subEntries!.isEmpty) {
    final isSelected = checkIfSelected(context);
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: Text(label, style: drawerTileStyle.labelTextStlye),
          textColor: isSelected
              ? drawerTileStyle.selectedTextColor ?? (_textColor(context))
              : drawerTileStyle.unSelectedTextColor ??
                  _unselectedTextColor(context),
          iconColor: isSelected
              ? drawerTileStyle.selectedTextColor ?? (_textColor(context))
              : drawerTileStyle.unSelectedTextColor ??
                  _unselectedTextColor(context),

          hoverColor: isSelected
              ? Colors.transparent
              : drawerTileStyle.selectedColor.withAlpha(150),
          shape:
              RoundedRectangleBorder(borderRadius: drawerTileStyle.tileRadius),
          onTap: () => GoRouter.of(context).push(path),
          //selected: isSelected,
        ),
        SizedBox(
          height: drawerTileStyle.tileSpacing,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!checkIfSelected(context)) return tile(context);
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        // @fradesa A cosa serve questo hero?
        Hero(
          tag: "tag",
          child: ClipRRect(
            borderRadius: drawerTileStyle.tileRadius,
            child: SizedBox(
              height: 48,
              child: Container(color: drawerTileStyle.selectedColor),
            ),
          ),
        ),
        tile(context),
      ],
    );
  }
}


// class BoringPageGroup implements BoringPageBase {
//   String title;
//   List<BoringPage> pages;
//   BoringPageGroup({
//     required this.title,
//     required this.pages,
//   });
//   @override
//   List<BoringEntry> get getDrawerEntries => pages
//       .map((e) => e.getDrawerEntries)
//       .expand((element) => element)
//       .toList();
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("CIAO QUI"),
//     );
//   }
//   @override
//   List<GoRoute> getRoutes() {
//   }
// }
