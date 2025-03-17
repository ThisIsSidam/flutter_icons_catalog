import 'package:flutter/material.dart';
import 'package:flutter_icons_catalog/flutter_icons_catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IconTestScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class IconTestScreen extends StatefulWidget {
  const IconTestScreen({super.key});

  @override
  State<IconTestScreen> createState() => _IconTestScreenState();
}

class _IconTestScreenState extends State<IconTestScreen> {
  final IconsCatalog _catalog = IconsCatalog();
  IconData _selectedIcon = Icons.star;

  void _showIconPicker() {
    final List<IconData> icons =
        _catalog.getIconDataList(includeVariants: false);
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50,
            ),
            itemBuilder: (context, index) {
              final IconData icon = icons[index];
              return InkWell(
                onTap: () {
                  setState(() => _selectedIcon = icon);
                  Navigator.pop(context);
                },
                child: Icon(icon, size: 32),
              );
            },
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get name of selected icon and convert back to IconData
    final String? iconName = _catalog.getName(_selectedIcon);
    final IconData? reconvertedIcon =
        iconName != null ? _catalog.getIconData(iconName) : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons Catalog Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('Selected:', style: TextStyle(fontSize: 20)),
                InkWell(
                  onTap: _showIconPicker,
                  child: Icon(_selectedIcon, size: 50),
                ),
                Text('Name: ${iconName ?? "Unknown"}'),
              ],
            ),
            Column(
              children: [
                const Text('After conversion:', style: TextStyle(fontSize: 20)),
                Icon(reconvertedIcon ?? Icons.error, size: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
