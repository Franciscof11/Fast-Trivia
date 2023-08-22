import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/providers/questionarios_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionarios = ref.watch(questionariosProvider);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
                  Icon(
                    Icons.menu,
                    color: Colors.yellow[700],
                    size: 32,
                  )
                ],
              ),
              //
              //
              const SizedBox(height: 80),
              //
              //
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: questionarios.when(
                  data: (data) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data[index].urlImageBanner),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.white, thickness: 2),
                      itemCount: data.length,
                    );
                  },
                  error: (error, _) => Center(
                    child: Text('$error'),
                  ),
                  loading: () => const CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
