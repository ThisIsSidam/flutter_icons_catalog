import 'package:flutter/material.dart';
import 'package:flutter_icons_catalog/src/maps/base_icon_map.dart';
import 'package:flutter_icons_catalog/src/maps/icon_map.dart';
import 'package:flutter_icons_catalog/src/maps/icon_name_maps.dart';

class IconsCatalog {
  String? getName(IconData icon) {
    final String? name = primaryIconNameMap[icon];
    if (name != null) return name;
    return duplicatedIconNameMap[icon];
  }

  IconData? getIconData(String name, {bool isBase = false}) {
    if (isBase) {
      return baseIconMap[name];
    }
    return iconMap[name];
  }

  List<IconData> getIconDataList({bool includeVariants = true}) {
    if (includeVariants) return iconMap.values.toList();
    return baseIconMap.values.toList();
  }
}
