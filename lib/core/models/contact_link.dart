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
}
