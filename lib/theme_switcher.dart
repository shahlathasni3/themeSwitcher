import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Switcher',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w700),),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 120,left: 125),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
                  ),
                  onPressed: () => themeProvider.setTheme('light'),
                  child: Text('Light Theme', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                  ),
                  onPressed: () => themeProvider.setTheme('dark'),
                  child: Text('Dark Theme', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.purple),
                  ),
                  onPressed: () => themeProvider.setTheme('custom'),
                  child: Text('Custom Theme', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.red),
                  ),
                  onPressed: () => themeProvider.resetToDefault(),
                  child: Text('Reset to Default', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
