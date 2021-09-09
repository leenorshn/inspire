import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspire/presentation/blocs/care/care_bloc.dart';

class CarePage extends StatefulWidget {
  const CarePage({Key? key}) : super(key: key);

  @override
  _CarePageState createState() => _CarePageState();
}

class _CarePageState extends State<CarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take care"),
        elevation: 1,
      ),
      body: Container(
        child: BlocBuilder<CareBloc, CareState>(
          builder: (context, state) {
            if (state is CareLoadedSuccess) {
              return ListView.builder(
                  itemCount: state.cares.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text(
                            "${state.cares[index].title}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(state.cares[index].color),
                            ),
                          ),
                          subtitle: Text("${state.cares[index].content}"),
                          leading: SvgPicture.asset(
                            "${state.cares[index].image}",
                            width: 24,
                            height: 32,
                            color: Color(state.cares[index].color),
                          )),
                    );
                  });
            }
            return Center(
              child: Text("Encours..."),
            );
          },
        ),
      ),
    );
  }
}
