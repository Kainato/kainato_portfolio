import 'package:flutter/material.dart';

import '../../core/routes/kp_routes.dart';
import '../../widgets/base/kp_intro.dart';
import '../../widgets/layout/kp_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => KpScaffold(
    route: KpRoutes.home,
    body: SelectionArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _hero(context)),
          KpIntro(
            title: 'SOBRE MIM',
            content:
                'Desenvolvedor focado em transformar problemas reais em experiências digitais úteis, claras e bem construídas.',
          ).buildSliver(context),
          SliverToBoxAdapter(child: _about()),
          KpIntro(
            title: 'PROJETOS',
            content:
                'Cases apresentados pelo problema, processo, decisões e resultado — não apenas pelo código.',
          ).buildSliver(context),
          SliverToBoxAdapter(child: _projects()),
          KpIntro(
            title: 'PROCESSO',
            content:
                'Minhas etapas detalhadas do desenvolvimento, desde a concepção até a entrega final.',
          ).buildSliver(context),
          SliverToBoxAdapter(child: _process()),
          SliverToBoxAdapter(child: _contact()),
          const SliverToBoxAdapter(child: SizedBox(height: 70)),
          const SliverToBoxAdapter(
            child: Center(
              child: Text(
                '© 2026 Caio Araújo • Flutter Developer',
                style: TextStyle(color: Colors.white38),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    ),
  );

  Widget _hero(BuildContext context) => Container(
    constraints: const BoxConstraints(minHeight: 650),
    padding: const EdgeInsets.all(32),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FLUTTER • MOBILE • UI/UX',
              style: TextStyle(
                letterSpacing: 2,
                color: Color(0xFF9B85FF),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'Olá, eu sou\nCaio Araújo.',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            const SizedBox(height: 25),
            const SizedBox(
              width: 720,
              child: Text(
                'Desenvolvedor Flutter apaixonado por criar soluções digitais que unem tecnologia, clareza e uma boa experiência para quem usa.',
                style: TextStyle(
                  fontSize: 22,
                  height: 1.5,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 35),
            Wrap(
              spacing: 14,
              children: [
                FilledButton(
                  onPressed: () {},
                  child: const Text('Ver projetos'),
                ),
                OutlinedButton(onPressed: () {}, child: const Text('GitHub')),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget _about() => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        children: [
          _card('5+ anos', 'Experiência com desenvolvimento'),
          _card('Flutter', 'Dart, BLoC, APIs e interfaces'),
          _card('Produto', 'Foco em problema, usuário e resultado'),
        ],
      ),
    ),
  );

  Widget _card(String title, String text) => SizedBox(
    width: 340,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _projects() => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Column(
        children: [
          _project(
            '01',
            'Teatech / Clínica Mundos',
            'Sistema digital para apoiar rotinas de uma clínica.',
            'Flutter • REST API • BLoC',
          ),
          _project(
            '02',
            'Flutter Quest',
            'Experiência gamificada para organizar objetivos e progresso.',
            'Flutter • Dart • Local Storage',
          ),
          _project(
            '03',
            'Projeto autoral',
            'Seu próximo case pode nascer aqui.',
            'Flutter • Seu stack',
          ),
        ],
      ),
    ),
  );

  Widget _project(String n, String title, String subtitle, String tech) => Card(
    margin: const EdgeInsets.only(bottom: 24),
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            n,
            style: const TextStyle(
              color: Color(0xFF9B85FF),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 18),
          Text(tech, style: const TextStyle(color: Color(0xFFB8A9FF))),
          const SizedBox(height: 18),
          const Text(
            'Descreva aqui contexto, problema, decisões de UX/UI, implementação e impacto do projeto.',
            style: TextStyle(height: 1.5, color: Colors.white60),
          ),
          const SizedBox(height: 18),
          TextButton(onPressed: () {}, child: const Text('Ver case →')),
        ],
      ),
    ),
  );

  Widget _process() => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Wrap(
        spacing: 18,
        runSpacing: 28,
        children: [
          _step('01', 'Problema', 'O que precisava ser resolvido?'),
          _step('02', 'Pesquisa', 'O que foi descoberto?'),
          _step('03', 'Design', 'Quais decisões foram tomadas?'),
          _step('04', 'Código', 'Como a solução foi implementada?'),
          _step('05', 'Resultado', 'O que mudou depois?'),
        ],
      ),
    ),
  );

  Widget _step(String n, String title, String text) => SizedBox(
    width: 205,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          n,
          style: const TextStyle(
            color: Color(0xFF9B85FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(text, style: const TextStyle(color: Colors.white54, height: 1.35)),
      ],
    ),
  );

  Widget _contact() => Container(
    margin: const EdgeInsets.only(top: 90),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 70),
    color: const Color(0xFF11141C),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VAMOS CONVERSAR?',
              style: TextStyle(
                color: Color(0xFF9B85FF),
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Tem um projeto interessante?',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 18),
            Text(
              'LinkedIn • GitHub • E-mail',
              style: TextStyle(color: Colors.white60, fontSize: 18),
            ),
          ],
        ),
      ),
    ),
  );
}
