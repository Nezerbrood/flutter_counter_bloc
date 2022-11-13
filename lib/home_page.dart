import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/bloc_counter_bloc.dart';
import 'package:flutter_counter/system_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("BlocHOMEWORK"),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocListener(
              bloc: BlocProvider.of<SystemBloc>(context),
              listener: (BuildContext context, state) {
                print("in blocListener");
                if (state is SystemInitial) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("SystemBloc Changed State")));
                }
              },
              child: SizedBox.shrink(),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return Text(
                    state.counter.toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  );
                }
                else{
                  return ErrorWidget(Error());
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<CounterBloc>().add(CounterIncrementEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
