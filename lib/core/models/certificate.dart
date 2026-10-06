/// Representa um certificado exibido na página de Certificados.
class Certificate {
  final String title;
  final String issuer;
  final String date;
  final String verificationUrl;

  const Certificate({
    required this.title,
    required this.issuer,
    required this.date,
    required this.verificationUrl,
  });
}
