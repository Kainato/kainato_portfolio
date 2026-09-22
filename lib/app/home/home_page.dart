import 'package:flutter/material.dart';
import 'package:kainato_portfolio/app/home/home_controller.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/enum/assets.dart';
import '../../core/extension/context_extension.dart';
import '../../core/models/contact_link.dart';
import '../../core/models/portfolio_project.dart';
import '../../core/routes/kp_routes.dart';
import '../../core/utils/kp_launcher.dart';
import '../../widgets/base/kp_fallback_image.dart';
import '../../widgets/base/kp_intro.dart';
import '../../widgets/base/section_tile.dart';
import '../../widgets/base/skill_chip.dart';
import '../../widgets/layout/kp_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) => KpScaffold(
    route: KpRoutes.home,
    onSectionTap: _controller.scrollToSection,
    body: SelectionArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _hero(context)),
          SliverToBoxAdapter(
            key: _controller.sobreKey,
            child: const SizedBox.shrink(),
          ),
          KpIntro(
            title: 'SOBRE MIM',
            content: PortfolioData.about,
          ).buildSliver(context),
          SliverToBoxAdapter(child: _about(context)),
          SliverToBoxAdapter(
            key: _controller.projetosKey,
            child: const SizedBox.shrink(),
          ),
          KpIntro(
            title: 'PROJETOS',
            content:
                'Cases apresentados pelo problema, processo, decisões e resultado — não apenas pelo código.',
          ).buildSliver(context),
          SliverToBoxAdapter(child: _projects(context)),
          KpIntro(
            title: 'PROCESSO',
            content:
                'Minhas etapas de trabalho, da concepção com metodologias ágeis (Scrum/Kanban) até a entrega final.',
          ).buildSliver(context),
          SliverToBoxAdapter(child: _process(context)),
          SliverToBoxAdapter(
            key: _controller.contatoKey,
            child: _contact(context),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 70)),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                '© 2026 ${PortfolioData.name} • Flutter Developer',
                style: const TextStyle(color: Colors.white38),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    ),
  );

  Widget _hero(BuildContext context) {
    final isDesktop = context.isDesktop;

    final textColumn = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PortfolioData.tagline,
          style: TextStyle(
            letterSpacing: 2,
            color: context.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'Olá, eu sou\n${PortfolioData.name}.',
          style: context.displayLarge?.copyWith(
            fontWeight: FontWeight.w800,
            height: 1,
            fontSize: context.isMobile ? 40 : null,
          ),
        ),
        const SizedBox(height: 25),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(
            PortfolioData.heroDescription,
            style: const TextStyle(
              fontSize: 22,
              height: 1.5,
              color: Colors.white70,
            ),
          ),
        ),
        const SizedBox(height: 35),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            Semantics(
              button: true,
              label: 'Ir para a seção de projetos',
              child: FilledButton(
                onPressed: () => _controller.scrollToSection('projetos'),
                child: const Text('Ver projetos'),
              ),
            ),
            Semantics(
              button: true,
              label: 'Abrir perfil no GitHub em uma nova aba',
              child: OutlinedButton(
                onPressed: () =>
                    openExternalUrl(context, 'https://github.com/Kainato'),
                child: const Text('GitHub'),
              ),
            ),
            Semantics(
              button: true,
              label: 'Ver currículo completo',
              child: OutlinedButton(
                onPressed: () =>
                    openExternalUrl(context, PortfolioData.resumeUrl),
                child: const Text('Ver currículo'),
              ),
            ),
          ],
        ),
      ],
    );

    final image = Semantics(
      label: 'Ilustração de avatar do desenvolvedor',
      child: KpFallbackImage(
        assetPath: Assets.dashatar.path,
        width: 280,
        height: 280,
      ),
    );

    return Container(
      constraints: const BoxConstraints(minHeight: 650),
      padding: EdgeInsets.all(context.isMobile ? 20 : 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: textColumn),
                    const SizedBox(width: 40),
                    image,
                  ],
                )
              : textColumn,
        ),
      ),
    );
  }

  Widget _about(BuildContext context) => Padding(
    padding: _controller.sectionPadding(context),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                _InfoCard(
                  title: '6+ anos',
                  text: 'Experiência com desenvolvimento Flutter & Dart',
                ),
                _InfoCard(
                  title: 'Full Stack Mobile',
                  text: 'Provider, MobX, GetX, Laravel e Filament',
                ),
                _InfoCard(
                  title: 'Produto',
                  text: 'Foco em problema, usuário e resultado de negócio',
                ),
              ],
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final skill in PortfolioData.skills)
                  SkillChip(skill: skill),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget _projects(BuildContext context) => Padding(
    padding: _controller.sectionPadding(context),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          children: [
            for (final project in PortfolioData.projects)
              _ProjectCard(project: project),
          ],
        ),
      ),
    ),
  );

  Widget _process(BuildContext context) => Padding(
    padding: _controller.sectionPadding(context),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Wrap(
          spacing: 18,
          runSpacing: 28,
          children: [
            _step(context, '01', 'Problema', 'O que precisava ser resolvido?'),
            _step(context, '02', 'Pesquisa', 'O que foi descoberto?'),
            _step(context, '03', 'Design', 'Quais decisões foram tomadas?'),
            _step(context, '04', 'Código', 'Como a solução foi implementada?'),
            _step(context, '05', 'Resultado', 'O que mudou depois?'),
          ],
        ),
      ),
    ),
  );

  Widget _step(BuildContext context, String n, String title, String text) =>
      SizedBox(
        width: context.isMobile ? context.width - 40 : 205,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              n,
              style: TextStyle(
                color: context.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              text,
              style: const TextStyle(color: Colors.white54, height: 1.35),
            ),
          ],
        ),
      );

  Widget _contact(BuildContext context) => Container(
    margin: const EdgeInsets.only(top: 90),
    padding: EdgeInsets.symmetric(
      horizontal: context.isMobile ? 20 : 32,
      vertical: 70,
    ),
    color: context.surfaceContainerLow,
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VAMOS CONVERSAR?',
              style: TextStyle(
                color: context.primaryColor,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Tem um projeto interessante?',
              style: TextStyle(
                fontSize: context.isMobile ? 28 : 38,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                for (final link in PortfolioData.contactLinks)
                  _ContactChip(link: link),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String text;
  const _InfoCard({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return SectionTile(
      child: SizedBox(
        width: context.isMobile ? context.width - 40 : 340,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: context.bodyMedium?.copyWith(
                    color: Colors.white60,
                    height: 1.4,
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

class _ProjectCard extends StatelessWidget {
  final PortfolioProject project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final url = project.url;
    return SectionTile(
      semanticLabel: url != null ? 'Abrir projeto ${project.title}' : null,
      onTap: url != null ? () => openExternalUrl(context, url) : null,
      child: Card(
        margin: const EdgeInsets.only(bottom: 24),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.order,
                style: TextStyle(
                  color: context.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                project.title,
                style: context.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                project.subtitle,
                style: context.bodyLarge?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 18),
              Text(
                project.stack,
                style: const TextStyle(color: Color(0xFFB8A9FF)),
              ),
              const SizedBox(height: 18),
              Text(
                project.description,
                style: const TextStyle(height: 1.5, color: Colors.white60),
              ),
              if (url != null) ...[
                const SizedBox(height: 18),
                Semantics(
                  button: true,
                  label: 'Ver case de ${project.title}',
                  child: TextButton(
                    onPressed: () => openExternalUrl(context, url),
                    child: const Text('Ver case →'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactChip extends StatelessWidget {
  final ContactLink link;
  const _ContactChip({required this.link});

  @override
  Widget build(BuildContext context) {
    return SectionTile(
      semanticLabel: 'Abrir ${link.label}: ${link.value}',
      onTap: () => openExternalUrl(context, link.url),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: context.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(link.icon, color: context.primaryColor, size: 20),
            const SizedBox(width: 10),
            Text(link.value, style: context.bodyMedium),
          ],
        ),
      ),
    );
  }
}
