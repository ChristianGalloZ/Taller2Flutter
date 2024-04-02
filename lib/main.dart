
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Practice for Test';
    return MaterialApp(
      // title: appTitle,
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green
                  ),
                  child: Column(
                    children: [                
                      Text(
                        'I am big title',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      Text(
                        'I am medium subtitle',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'I am a normal text',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),

                      ),
                      
                    ],
                  ),
                ),
              ),
              ListTile(title: const Text('Option #1'), onTap: () {}),
              ListTile(title: const Text('Option #2'), onTap: () {}),
              ListTile(title: const Text('Option #3'), onTap: () {}),
              ListTile(title: const Text('Option #4'), onTap: () {}),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.green,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              TextSection(
                description:
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from '
                    'Kandersteg, followed by a half-hour walk through pastures '
                    'and pine forest, leads you to the lake, which warms to 20 '
                    'degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summer toboggan run.',
              ),
              ButtonSection(),
              ButtonsSection(),
              
              ListTile(title:  Text('Element #0'),),
              ListTile(title:  Text('Element #1'),),
              ListTile(title:  Text('Element #2'),),
              ListTile(title:  Text('Element #3'),),
              TextSection(
                description:
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from '
                    'Kandersteg, followed by a half-hour walk through pastures '
                    'and pine forest, leads you to the lake, which warms to 20 '
                    'degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summer toboggan run.',
              ),
              Text('END OF APPLICATION',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                ),
              ),
            ],
          
          ),
        ),
      ),
    );
  }
}

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded( 
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: Colors.greenAccent),
              child: const Text('Select Alarm'),
            ),
          ),
          Expanded( 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.greenAccent),
            onPressed: () {},
            child: const Text('Select Key'),
          ),
          ),
          Expanded( 
            child: OutlinedButton(
              onPressed: () {},
              style:
                  OutlinedButton.styleFrom(foregroundColor: Colors.greenAccent),
              child: const Text('Select Camera'),
            ),
          ),
        ],
      ),
    );
  }
}




class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    final Color color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.alarm,
            label: '',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.key,
            label: '',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.camera_alt,
            label: '',
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

// Clases que llamo dentro de mis clases de MyApp (Tercer nivel de jerarquia)
class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 45;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        Text('$_favoriteCount'),
      ],
    );
  }
}