import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_tutorial/logic/cubit/counter_cubit.dart';
import 'package:flutter_cubit_tutorial/presentation/screens/second_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  'You have pushed the button this many times: ${state.isPressed}',
                );
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  const snackBar = SnackBar(
                    content: Text('Incremented'),
                    duration: Duration(microseconds: 300),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (state.wasIncremented == false) {
                  const snackBar = SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(microseconds: 300),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'NEGATIVE NUMBER ${state.counterValue.toString()}',
                    style: const TextStyle(fontSize: 18),
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'POSITIVE NUMBER ${state.counterValue.toString()}',
                    style: const TextStyle(fontSize: 18),
                  );
                }

                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).incrementValue();
                  },
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrementValue();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text('Second Screen'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text('Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
