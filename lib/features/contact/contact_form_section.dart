import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/theme/app_theme.dart';
import '../../core/utils/launch_url.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/tilt_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioContactFormSection extends StatefulWidget {
  const PortfolioContactFormSection({super.key});

  @override
  State<PortfolioContactFormSection> createState() => _PortfolioContactFormSectionState();
}

class _PortfolioContactFormSectionState extends State<PortfolioContactFormSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final budgetController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    budgetController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobile = width < 900;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(mobile ? 20 : 28, 104, mobile ? 20 : 28, 110),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Brand.burgundy,
            Brand.burgundyDeep,
            Brand.inkSoft,
            Brand.ink,
          ],
          stops: [0.0, .31, .58, 1.0],
        ),
      ),
      child: SiteWidth(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Reveal(
              from: const Offset(-45, 0),
              child: Text(
                'Get In Touch',
                style: GoogleFonts.poppins(
                  color: Brand.cream,
                  fontSize: mobile ? 40 : 54,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 62,
              height: 5,
              decoration: BoxDecoration(
                color: Brand.rose,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Brand.rose.withOpacity(.22), blurRadius: 16)],
              ),
            ),
            const SizedBox(height: 46),
            Flex(
              direction: mobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveExpanded(
                  expand: !mobile,
                  flex: 10,
                  child: Reveal(
                    from: const Offset(-54, 0),
                    child: _PortfolioContactInfo(mobile: mobile),
                  ),
                ),
                SizedBox(width: mobile ? 0 : 66, height: mobile ? 54 : 0),
                ResponsiveExpanded(
                  expand: !mobile,
                  flex: 11,
                  child: Reveal(
                    delay: const Duration(milliseconds: 160),
                    from: const Offset(54, 0),
                    child: _PortfolioContactForm(
                      nameController: nameController,
                      emailController: emailController,
                      phoneController: phoneController,
                      budgetController: budgetController,
                      messageController: messageController,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PortfolioContactInfo extends StatelessWidget {
  final bool mobile;
  const _PortfolioContactInfo({required this.mobile});

  @override
  Widget build(BuildContext context) {
    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: GoogleFonts.poppins(
            color: Brand.cream,
            fontSize: mobile ? 27 : 34,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        Container(width: 40, height: 4, decoration: BoxDecoration(color: Brand.rose, borderRadius: BorderRadius.circular(6))),
        const SizedBox(height: 26),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 570),
          child: Text(
            "We'd love to hear from you. Let's get in touch and create something amazing together!",
            style: GoogleFonts.poppins(color: Brand.muted, fontSize: 15.5, height: 1.75),
          ),
        ),
        const SizedBox(height: 38),
        _PortfolioInfoItem(
          icon: Icons.phone_in_talk_rounded,
          title: '+92 3326278848',
          subtitle: 'Call us anytime',
          onTap: () => openLink('tel:+923326278848'),
        ),
        const SizedBox(height: 20),
        _PortfolioInfoItem(
          icon: Icons.mail_outline_rounded,
          title: 'ayeshaasif78686@gmail.com',
          subtitle: 'Send us an email',
          onTap: () => openLink('mailto:ayeshaasif78686@gmail.com'),
        ),
        const SizedBox(height: 20),
        _PortfolioInfoItem(
          icon: Icons.location_on_outlined,
          title: '27 Main Street, Kamalia, Toba Tek Singh, Punjab, Pakistan',
          subtitle: 'Our location',
          onTap: () => openLink('https://maps.google.com/?q=27+Main+Street,+Kamalia,+Toba+Tek+Singh,+Punjab,+Pakistan'),
        ),
        const SizedBox(height: 38),
        Text('Follow Me', style: GoogleFonts.poppins(color: Brand.muted, fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 1.4)),
        const SizedBox(height: 15),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _PortfolioSocialIcon(label: 'in', onTap: () => openLink('https://www.linkedin.com/in/ayesha-asif-696919369')),
            _PortfolioSocialIcon(icon: SimpleIcons.github, onTap: () => openLink('https://github.com/')),
            _PortfolioSocialIcon(icon: Icons.mail_outline_rounded, onTap: () => openLink('mailto:ayeshaasif78686@gmail.com')),
          ],
        ),
      ],
    );

    if (mobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          info,
          const SizedBox(height: 26),
        ],
      );
    }

    return SizedBox(
      height: 550,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            right: 180,
            child: Align(alignment: Alignment.topLeft, child: info),
          ),
          
        ],
      ),
    );
  }
}

class _ContactFullAvatar extends StatefulWidget {
  final double width;
  final double height;
  const _ContactFullAvatar({required this.width, required this.height});

  @override
  State<_ContactFullAvatar> createState() => _ContactFullAvatarState();
}

class _ContactFullAvatarState extends State<_ContactFullAvatar> with SingleTickerProviderStateMixin {
  late final AnimationController c = AnimationController(vsync: this, duration: const Duration(seconds: 6))..repeat(reverse: true);

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduce = MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    Widget avatar(double t) {
      final y = reduce ? 0.0 : math.sin(t * math.pi) * 12;
      return Transform.translate(
        offset: Offset(0, -y),
        child: TiltCard(
          maxTilt: 3.8,
          hoverScale: 1.018,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 10,
                  child: Container(
                    width: widget.width * .72,
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [BoxShadow(color: Brand.rose.withOpacity(.18), blurRadius: 38, spreadRadius: 10)],
                    ),
                  ),
                ),
                Image.asset(
                  'lib/assets/images/contact_avatar.png',
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                  filterQuality: FilterQuality.high,
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (reduce) return avatar(0);
    return AnimatedBuilder(animation: c, builder: (_, __) => avatar(c.value));
  }
}

class _PortfolioInfoItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _PortfolioInfoItem({required this.icon, required this.title, required this.subtitle, required this.onTap});

  @override
  State<_PortfolioInfoItem> createState() => _PortfolioInfoItemState();
}

class _PortfolioInfoItemState extends State<_PortfolioInfoItem> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 190),
          transform: Matrix4.translationValues(hover ? 6 : 0, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 190),
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hover ? Brand.rose.withOpacity(.27) : Brand.plum.withOpacity(.38),
                  border: Border.all(color: Brand.roseSoft.withOpacity(.12)),
                  boxShadow: hover ? [BoxShadow(color: Brand.rose.withOpacity(.18), blurRadius: 20)] : null,
                ),
                child: Icon(widget.icon, color: Brand.cream, size: 24),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: GoogleFonts.poppins(color: Brand.cream, fontSize: 15, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(widget.subtitle, style: GoogleFonts.poppins(color: Brand.rose, fontSize: 11.5, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PortfolioSocialIcon extends StatefulWidget {
  final IconData? icon;
  final String? label;
  final VoidCallback onTap;
  const _PortfolioSocialIcon({this.icon, this.label, required this.onTap})
      : assert(icon != null || label != null);

  @override
  State<_PortfolioSocialIcon> createState() => _PortfolioSocialIconState();
}

class _PortfolioSocialIconState extends State<_PortfolioSocialIcon> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 48,
          height: 48,
          transform: Matrix4.translationValues(0, hover ? -3 : 0, 0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hover ? Brand.rose.withOpacity(.22) : Brand.plum.withOpacity(.34),
            border: Border.all(color: Brand.roseSoft.withOpacity(.13)),
            boxShadow: hover ? [BoxShadow(color: Brand.rose.withOpacity(.15), blurRadius: 18)] : null,
          ),
          child: widget.icon != null
              ? Icon(widget.icon, color: Brand.cream, size: 20)
              : Center(
                  child: Text(
                    widget.label!,
                    style: GoogleFonts.poppins(
                      color: Brand.cream,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class _PortfolioContactForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController budgetController;
  final TextEditingController messageController;
  const _PortfolioContactForm({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.budgetController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    final narrow = MediaQuery.of(context).size.width < 620;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Drop a Line', style: GoogleFonts.poppins(color: Brand.cream, fontSize: narrow ? 27 : 34, fontWeight: FontWeight.w700)),
        const SizedBox(height: 16),
        Container(width: 40, height: 4, decoration: BoxDecoration(color: Brand.rose, borderRadius: BorderRadius.circular(6))),
        const SizedBox(height: 28),
        if (narrow) ...[
          _PortfolioContactField(hint: 'Your Name', controller: nameController),
          const SizedBox(height: 16),
          _PortfolioContactField(hint: 'Your Email', controller: emailController, keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          _PortfolioContactField(hint: 'Phone Number', controller: phoneController, keyboardType: TextInputType.phone),
          const SizedBox(height: 16),
          _PortfolioContactField(hint: 'Budget (Optional)', controller: budgetController),
        ] else ...[
          Row(children: [
            Expanded(child: _PortfolioContactField(hint: 'Your Name', controller: nameController)),
            const SizedBox(width: 16),
            Expanded(child: _PortfolioContactField(hint: 'Your Email', controller: emailController, keyboardType: TextInputType.emailAddress)),
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: _PortfolioContactField(hint: 'Phone Number', controller: phoneController, keyboardType: TextInputType.phone)),
            const SizedBox(width: 16),
            Expanded(child: _PortfolioContactField(hint: 'Budget (Optional)', controller: budgetController)),
          ]),
        ],
        const SizedBox(height: 16),
        _PortfolioContactField(hint: 'Your Message', controller: messageController, maxLines: 6),
        const SizedBox(height: 30),
        _PortfolioSendButton(
          nameController: nameController,
          emailController: emailController,
          phoneController: phoneController,
          budgetController: budgetController,
          messageController: messageController,
        ),
      ],
    );
  }
}

class _PortfolioContactField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType? keyboardType;
  const _PortfolioContactField({required this.hint, required this.controller, this.maxLines = 1, this.keyboardType});

  @override
  State<_PortfolioContactField> createState() => _PortfolioContactFieldState();
}

class _PortfolioContactFieldState extends State<_PortfolioContactField> {
  late final FocusNode focusNode = FocusNode()..addListener(_focusChanged);
  bool focused = false;
  void _focusChanged() {
    if (mounted) setState(() => focused = focusNode.hasFocus);
  }

  @override
  void dispose() {
    focusNode.removeListener(_focusChanged);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: focused ? [BoxShadow(color: Brand.rose.withOpacity(.13), blurRadius: 22, offset: const Offset(0, 8))] : null,
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: focusNode,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        style: GoogleFonts.poppins(color: Brand.cream, fontSize: 14.5),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: GoogleFonts.poppins(color: Brand.muted.withOpacity(.55), fontSize: 14),
          filled: true,
          fillColor: const Color(0xFF351A24).withOpacity(.84),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: widget.maxLines > 1 ? 19 : 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Brand.roseSoft.withOpacity(.17))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Brand.rose, width: 1.5)),
        ),
      ),
    );
  }
}

class _PortfolioSendButton extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController budgetController;
  final TextEditingController messageController;
  const _PortfolioSendButton({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.budgetController,
    required this.messageController,
  });

  @override
  State<_PortfolioSendButton> createState() => _PortfolioSendButtonState();
}

class _PortfolioSendButtonState extends State<_PortfolioSendButton> {
  bool hover = false;

  Future<void> _send() async {
    if (widget.nameController.text.trim().isEmpty || widget.emailController.text.trim().isEmpty || widget.messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill your name, email and message.'),
          backgroundColor: Brand.burgundy,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
      return;
    }
    final subject = 'Portfolio message from ${widget.nameController.text.trim()}';
    final body = '''Name: ${widget.nameController.text.trim()}
Email: ${widget.emailController.text.trim()}
Phone: ${widget.phoneController.text.trim()}
Budget: ${widget.budgetController.text.trim().isEmpty ? 'Not specified' : widget.budgetController.text.trim()}

Message:
${widget.messageController.text.trim()}''';
    final uri = Uri(
      scheme: 'mailto',
      path: 'ayeshaasif78686@gmail.com',
      queryParameters: {'subject': subject, 'body': body},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Could not open your email app.'),
          backgroundColor: Brand.burgundy,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: _send,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 190),
          transform: Matrix4.translationValues(0, hover ? -3 : 0, 0)..scale(hover ? 1.02 : 1.0),
          padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 17),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Brand.rose, Brand.violet]),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Brand.rose.withOpacity(hover ? .26 : .14), blurRadius: hover ? 28 : 18, offset: const Offset(0, 9))],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Send Message', style: GoogleFonts.poppins(color: Colors.white, fontSize: 14.5, fontWeight: FontWeight.w700)),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

