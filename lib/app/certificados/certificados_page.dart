import 'package:flutter/material.dart';

import '../../core/data/portfolio_data.dart';
import '../../core/extension/context_extension.dart';
import '../../core/models/certificate.dart';
import '../../core/routes/kp_routes.dart';
import '../../core/utils/kp_launcher.dart';
import '../../widgets/base/kp_intro.dart';
import '../../widgets/base/section_tile.dart';
import '../../widgets/layout/kp_scaffold.dart';

class CertificadosPage extends StatelessWidget {
  const CertificadosPage({super.key});

  @override
  Widget build(BuildContext context) => KpScaffold(
    route: KpRoutes.certificados,
    body: CustomScrollView(
      slivers: [
        KpIntro(
          title: 'CERTIFICADOS',
          content:
              'Cursos e certificações que sustentam minha atuação como desenvolvedor Flutter.',
        ).buildSliver(context),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            context.isMobile ? 20 : 32,
            0,
            context.isMobile ? 20 : 32,
            60,
          ),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    for (final certificate in PortfolioData.certificates)
                      _CertificateCard(certificate: certificate),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _CertificateCard extends StatelessWidget {
  final Certificate certificate;
  const _CertificateCard({required this.certificate});

  @override
  Widget build(BuildContext context) {
    return SectionTile(
      semanticLabel: 'Verificar certificado ${certificate.title}',
      onTap: () => openExternalUrl(context, certificate.verificationUrl),
      child: SizedBox(
        width: context.isMobile ? context.width - 64 : 330,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.workspace_premium_outlined,
                  color: context.primaryColor,
                  size: 32,
                ),
                const SizedBox(height: 16),
                Text(
                  certificate.title,
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  certificate.issuer,
                  style: context.bodyMedium?.copyWith(color: Colors.white60),
                ),
                const SizedBox(height: 4),
                Text(
                  certificate.date,
                  style: context.bodySmall?.copyWith(color: Colors.white38),
                ),
                const SizedBox(height: 16),
                Semantics(
                  button: true,
                  label: 'Verificar certificado ${certificate.title}',
                  child: TextButton.icon(
                    onPressed: () =>
                        openExternalUrl(context, certificate.verificationUrl),
                    icon: const Icon(Icons.open_in_new, size: 16),
                    label: const Text('Verificar'),
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
