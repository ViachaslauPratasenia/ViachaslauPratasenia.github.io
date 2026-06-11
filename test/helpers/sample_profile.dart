import 'package:personal_website/features/home/data/local/developer_profile.dart';

DeveloperProfile sampleProfile() => DeveloperProfile(
      name: 'Viachaslau Pratasenia',
      email: 'viachaslau.pratasenia@gmail.com',
      subtitle: 'Flutter Developer · Mobile Team Lead',
      fullDescription:
          'I build things with Flutter and lead teams to create amazing products.',
      aboutMe:
          'A highly skilled Flutter developer and Mobile Team Lead with over 7 years in the technology industry.',
      contactMeText:
          'Whether you have a question or just want to say hi, I will try my best to get back to you!',
      recentTechnologies: const ['Flutter', 'Dart', 'JavaScript', 'n8n', 'Stripe', 'RevenueCat'],
      services: [
        Service(title: 'Mobile Apps', description: 'd', icon: 'phone', technologies: const ['Flutter']),
        Service(title: 'Web Dev', description: 'd', icon: 'web', technologies: const ['Flutter Web']),
      ],
      socialLinks: [
        SocialLink(name: 'GitHub', url: 'https://github.com/ViachaslauPratasenia'),
        SocialLink(name: 'LinkedIn', url: 'https://www.linkedin.com/in/viachaslaupratasenia/'),
      ],
      work: [
        WorkExperience(
          title: 'Flutter Developer / Mobile Team Lead',
          companyName: 'Aventus IT — 7VPN',
          companyLink: 'https://aventusit.eu/',
          description: 'Mobile Team Lead on an e-commerce project and developer at 7VPN.',
          workPeriod: '2022 — Present',
          links: [WorkLink(name: '7VPN', url: 'https://7vpn.com/')],
        ),
      ],
      projects: [
        Project(
          title: 'Personal Website',
          image: '',
          linkName: 'Source',
          link: 'https://github.com/ViachaslauPratasenia/ViachaslauPratasenia.github.io',
          description: 'Built with Flutter and hosted on GitHub Pages.',
          tags: const ['Flutter', 'Web', 'GitHub Pages'],
        ),
      ],
      blogPosts: [
        BlogPost(
          title: 'The Easiest Way to Use Environments in Flutter',
          link: 'https://medium.com/@viachaslau.pratasenia/the-easiest-way-to-use-environments-in-flutter-fa7b2cf0ed8d',
          description: 'd',
          tags: const ['Flutter'],
          date: 'Dec 12, 2023',
        ),
      ],
    );
