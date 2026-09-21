import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../widgets/google_sign_in_button.dart';

class CustomerLoginScreen extends StatelessWidget {
  const CustomerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const _CustomerLoginMobile();
        } else {
          return const _CustomerLoginWeb();
        }
      },
    );
  }
}

class _CustomerLoginMobile extends StatelessWidget {
  const _CustomerLoginMobile();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface.withOpacity(0.8),
        elevation: 0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.customerAppTitle,
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              l10n.customerLoginTitle,
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: colorScheme.primary,
              child: Icon(Icons.person, size: 18, color: colorScheme.onPrimary),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.margin),
          child: Column(
            children: [
              // Welcome Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    _buildVerifiedBadge(colorScheme),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      l10n.loginAndExplore,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      l10n.welcomeTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      l10n.welcomeSubtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              
              // Value Highlights
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.whyTamHizmet,
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _buildFeatureTile(
                context,
                icon: Icons.engineering,
                title: l10n.feature1Title,
                subtitle: l10n.feature1Desc,
                color: colorScheme.primaryContainer.withOpacity(0.4),
                onColor: colorScheme.onPrimaryContainer,
              ),
              const SizedBox(height: AppSpacing.sm),
              _buildFeatureTile(
                context,
                icon: Icons.shield,
                title: l10n.feature2Title,
                subtitle: l10n.feature2Desc,
                color: const Color(0xFFCCFBF1),
                onColor: const Color(0xFF0F766E),
              ),
              const SizedBox(height: AppSpacing.sm),
              _buildFeatureTile(
                context,
                icon: Icons.reviews,
                title: l10n.feature3Title,
                subtitle: l10n.feature3Desc,
                color: colorScheme.secondaryContainer.withOpacity(0.4),
                onColor: colorScheme.onSecondaryContainer,
              ),
              const SizedBox(height: AppSpacing.lg),

              // Social Proof
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(AppSpacing.sm),
                      ),
                      child: const Icon(Icons.image_outlined, color: Colors.grey),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star, size: 16, color: Color(0xFF92400E)),
                              const SizedBox(width: AppSpacing.xs),
                              Text(
                                l10n.satisfactionRate,
                                style: const TextStyle(
                                  color: Color(0xFF92400E),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            l10n.completedJobs,
                            style: TextStyle(
                              color: colorScheme.onSurface,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Login Action
              GoogleSignInButton(onPressed: () {}),
              const SizedBox(height: AppSpacing.lg),

              // Footer Trust
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerifiedBadge(ColorScheme colorScheme) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: CircleAvatar(
              radius: 28,
              backgroundColor: colorScheme.surface,
              child: Icon(Icons.verified_user, size: 32, color: colorScheme.primary),
            ),
          ),
        ),
        Positioned(
          bottom: -2,
          right: -2,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: colorScheme.primary,
            child: Icon(Icons.bolt, size: 16, color: colorScheme.onPrimary),
          ),
        )
      ],
    );
  }

  Widget _buildFeatureTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required Color color,
      required Color onColor}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: onColor, size: 20),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 14, color: Color(0xFF0F766E)),
            const SizedBox(width: AppSpacing.xs),
            Text(l10n.sslSecure, style: const TextStyle(fontSize: 11)),
            const SizedBox(width: AppSpacing.sm),
            CircleAvatar(radius: 2, backgroundColor: colorScheme.outlineVariant),
            const SizedBox(width: AppSpacing.sm),
            const Icon(Icons.security, size: 14, color: Color(0xFF0F766E)),
            const SizedBox(width: AppSpacing.xs),
            Text(l10n.kvkkSecure, style: const TextStyle(fontSize: 11)),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Text(
            l10n.termsAndPrivacy,
            textAlign: TextAlign.center,
            style: TextStyle(color: colorScheme.outline, fontSize: 12, height: 1.4),
          ),
        ),
      ],
    );
  }
}

class _CustomerLoginWeb extends StatelessWidget {
  const _CustomerLoginWeb();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.marginLg),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left Side: Marketing & Values
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.xxl),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildWebHeader(l10n, colorScheme),
                        const SizedBox(height: AppSpacing.xl),
                        _buildWebTitle(l10n, colorScheme),
                        const SizedBox(height: AppSpacing.xl),
                        _buildWebFeatures(l10n, colorScheme),
                        const SizedBox(height: AppSpacing.xl),
                        _buildWebSocialProof(l10n, colorScheme),
                      ],
                    ),
                  ),
                ),
                // Right Side: Login Card
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      _buildLoginCard(l10n, colorScheme),
                      const SizedBox(height: AppSpacing.md),
                      _buildProviderCta(l10n, colorScheme),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWebHeader(AppLocalizations l10n, ColorScheme colorScheme) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFCCFBF1),
            borderRadius: BorderRadius.circular(AppSpacing.full),
          ),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: colorScheme.primary, shape: BoxShape.circle),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                l10n.customerPortal,
                style: const TextStyle(
                  color: Color(0xFF0F766E),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(
          l10n.zeroCommission,
          style: TextStyle(color: colorScheme.outline, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildWebTitle(AppLocalizations l10n, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Eviniz ve işiniz için aradığınız uzmanlar',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
        Text(
          'tek dokunuşla',
          style: TextStyle(
            color: colorScheme.primary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
            decoration: TextDecoration.underline,
            decorationColor: colorScheme.primaryContainer,
            decorationThickness: 4,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          l10n.welcomeSubtitle,
          style: TextStyle(color: colorScheme.tertiary, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildWebFeatures(AppLocalizations l10n, ColorScheme colorScheme) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: AppSpacing.md,
      children: [
        _buildWebFeatureItem(Icons.engineering, l10n.feature1Title, l10n.feature1Desc, colorScheme),
        _buildWebFeatureItem(Icons.handshake, 'Komisyonsuz & Serbest', l10n.feature2Desc, colorScheme),
        _buildWebFeatureItem(Icons.verified_user, 'Gerçek Değerlendirmeler', l10n.feature3Desc, colorScheme),
      ],
    );
  }

  Widget _buildWebFeatureItem(IconData icon, String title, String desc, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary, size: 24),
          const SizedBox(height: AppSpacing.sm),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Text(desc, style: TextStyle(color: colorScheme.tertiary, fontSize: 12), maxLines: 3),
        ],
      ),
    );
  }

  Widget _buildWebSocialProof(AppLocalizations l10n, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Text('4.9', style: TextStyle(color: colorScheme.onSurface, fontWeight: FontWeight.bold)),
          Text(' / 5.0', style: TextStyle(color: colorScheme.outline)),
          const SizedBox(width: AppSpacing.md),
          Text(l10n.completedJobs, style: TextStyle(color: colorScheme.tertiary, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildLoginCard(AppLocalizations l10n, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardBadge(l10n, colorScheme),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.welcomeBack, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: AppSpacing.sm),
          Text(l10n.webLoginDesc, style: TextStyle(color: colorScheme.tertiary)),
          const SizedBox(height: AppSpacing.xl),
          GoogleSignInButton(onPressed: () {}),
          const SizedBox(height: AppSpacing.xl),
          _buildTrustRow(l10n, colorScheme),
          const SizedBox(height: AppSpacing.md),
          Center(
            child: Text(
              l10n.termsAndPrivacy,
              textAlign: TextAlign.center,
              style: TextStyle(color: colorScheme.outline, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardBadge(AppLocalizations l10n, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(radius: 20, backgroundColor: Color(0xFFCCFBF1), child: Icon(Icons.lock, size: 20, color: Color(0xFF0F766E))),
        Row(
          children: [
            const Icon(Icons.lock, size: 14, color: Colors.green),
            const SizedBox(width: 4),
            Text(l10n.secureSession, style: TextStyle(color: colorScheme.outline, fontSize: 11)),
          ],
        )
      ],
    );
  }

  Widget _buildTrustRow(AppLocalizations l10n, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTrustItem(Icons.enhanced_encryption, '256-Bit SSL', colorScheme),
        _buildTrustItem(Icons.security, 'KVKK', colorScheme),
        _buildTrustItem(Icons.gpp_good, 'Spamsız', colorScheme),
      ],
    );
  }

  Widget _buildTrustItem(IconData icon, String text, ColorScheme colorScheme) {
    return Row(
      children: [
        Icon(icon, size: 16, color: colorScheme.primary),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: colorScheme.tertiary, fontSize: 11, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildProviderCta(AppLocalizations l10n, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: colorScheme.secondary, child: const Icon(Icons.build, color: Colors.white, size: 18)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.providerCtaTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(l10n.providerCtaSubtitle, style: TextStyle(color: colorScheme.tertiary, fontSize: 12)),
              ],
            ),
          ),
          Text(l10n.providerCtaAction, style: TextStyle(color: colorScheme.secondary, fontWeight: FontWeight.bold)),
          const Icon(Icons.arrow_forward, size: 16, color: Color(0xFF306576)),
        ],
      ),
    );
  }
}
