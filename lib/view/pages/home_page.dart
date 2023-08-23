import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/providers/questionarios_provider.dart';
import '../widgets/custom_list_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionarios = ref.watch(questionariosProvider);
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        color: Colors.yellow[700],
        child: const Column(
          children: [
            Text('Hello'),
          ],
        ),
      ),
      key: scaffoldKey,
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bem vindo!',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Escolha um Quiz',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => scaffoldKey.currentState?.openDrawer(),
                      child: Icon(
                        Icons.menu,
                        color: Colors.yellow[700],
                        size: 32,
                      ),
                    )
                  ],
                ),
                //
                const SizedBox(height: 40),
                //
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width,
                  child: questionarios.when(
                    data: (data) {
                      return RefreshIndicator(
                        color: Colors.black,
                        onRefresh: () async {
                          // ignore: unused_result
                          ref.refresh(questionariosProvider.future);
                          return Future<void>.delayed(
                            const Duration(seconds: 1),
                          );
                        },
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                                position: index,
                                child: SlideAnimation(
                                    duration:
                                        const Duration(milliseconds: 2500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    horizontalOffset: 30,
                                    verticalOffset: 300.0,
                                    child: FlipAnimation(
                                      duration:
                                          const Duration(milliseconds: 3000),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      flipAxis: FlipAxis.y,
                                      child: CustomListTile(
                                        titulo: data[index].titulo,
                                        urlImageBanner:
                                            data[index].urlImageBanner,
                                        idQuestionario: index,
                                      ),
                                    )));
                          },
                          separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Divider(color: Colors.white, thickness: 1),
                          ),
                          itemCount: data.length,
                        ),
                      );
                    },
                    error: (error, _) => Center(
                      child: Text('$error'),
                    ),
                    loading: () => Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.yellow[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
