import 'package:flutter/material.dart';

enum ContactLinkType { phone, email, linkedin, github, website }

/// Representa um canal de contato exibido na seção "Contato" do portfólio.
class ContactLink {
  final ContactLinkType type;
  final String label;
  final String value;
  final String url;
  final IconData icon;

  const ContactLink({
    required this.type,
    required this.label,
    required this.value,
    required this.url,
    required this.icon,
  });

  // Links de contato exibidos na seção de contato do aplicativo
  static const List<ContactLink> contactLinks = [
    ContactLink(
      type: ContactLinkType.email,
      label: 'E-mail',
      value: 'caiocaladaraujo@gmail.com',
      url: 'mailto:caiocaladaraujo@gmail.com',
      icon: Icons.email_outlined,
    ),
    ContactLink(
      type: ContactLinkType.linkedin,
      label: 'LinkedIn',
      value: 'linkedin.com/in/caio-calado',
      url: 'https://linkedin.com/in/caio-calado',
      icon: Icons.business_center_outlined,
    ),
    ContactLink(
      type: ContactLinkType.github,
      label: 'GitHub',
      value: 'github.com/Kainato',
      url: 'https://github.com/Kainato',
      icon: Icons.code,
    ),
  ];
}
