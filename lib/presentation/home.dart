import 'package:cube/presentation/cube_widget.dart';
import 'package:cube/solution.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var patternTextInput = '';
  var pathTextInput = '';
  final _textController = TextEditingController(text: '111111');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  label: const Text('Generate'),
                  icon: const Icon(Icons.pattern_rounded),
                  onPressed: () {
                    if (_textController.text.length != 6) {
                      return;
                    }

                    setState(() {
                      patternTextInput = _textController.text;
                      pathTextInput = trace(tiles: patternTextInput);
                    });
                  },
                ),
                const SizedBox(width: 15),
                SizedBox(
                  width: 200,
                  child: CupertinoTextField(
                    controller: _textController,
                    maxLength: 6,
                  ),
                ),
              ],
            ),
            if (patternTextInput.isNotEmpty)
              Card(
                elevation: 10,
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CubeWidget(
                    patternText: patternTextInput,
                    pathText: pathTextInput,
                    isGenerated: true,
                  ),
                ),
              ),
            const SizedBox(height: 15),
            const CubeWidget(
              patternText: '123212',
              pathText: 'ABCADBEFCEDF',
            ),
            const SizedBox(height: 15),
            const CubeWidget(
              patternText: '123123',
              pathText: 'ABCADEFDBECF',
            ),
            const SizedBox(height: 15),
            const CubeWidget(patternText: '111111', pathText: 'ABEF'),
            const SizedBox(height: 15),
            const CubeWidget(patternText: '222222', pathText: 'ACFEDF'),
            const SizedBox(height: 15),
            const CubeWidget(patternText: '333333', pathText: 'ADFECF'),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
