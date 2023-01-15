import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_tutorial/logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
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
                    'EVEN NUMBER ${state.counterValue.toString()}',
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text('Go to Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
