import 'package:flutter/material.dart';

class KpIntro extends StatelessWidget {
  final String title;
  final String content;

  /// Este widget renderiza uma seção introdutória com um título curto e uma mensagem principal de destaque.
  /// Ele é adequado para páginas de apresentação, portfólios e landing pages,
  /// ajudando a comunicar a identidade profissional ou institucional de forma clara, visualmente impactante e responsiva.
  ///
  /// Ele é construído como um *[StatelessWidget]* e pode ser extendido com um *[SliverToBoxAdapter]* para integração com listas de rolagem.
  const KpIntro({super.key, required this.title, required this.content});

  SliverToBoxAdapter buildSliver(BuildContext context) {
    return SliverToBoxAdapter(child: build(context));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 90, 32, 35),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF9B85FF),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
