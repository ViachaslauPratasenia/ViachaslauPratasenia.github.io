class DeveloperProfile {
  final String name;
  final String jobTitle;
  final String shortDescription;
  final String fullDescription;
  final List<SocialLink> socialLinks;
  final List<Language> languages;
  final List<WorkExperience> work;

  DeveloperProfile({
    required this.name,
    required this.jobTitle,
    required this.shortDescription,
    required this.fullDescription,
    required this.socialLinks,
    required this.languages,
    required this.work,
  });

  factory DeveloperProfile.fromJson(Map<String, dynamic> json) {
    return DeveloperProfile(
      name: json['name'],
      jobTitle: json['job_title'],
      shortDescription: json['short_description'],
      fullDescription: json['fullDescription'],
      socialLinks: (json['social_links'] as List).map((e) => SocialLink.fromJson(e)).toList(),
      languages: (json['languages'] as List).map((e) => Language.fromJson(e)).toList(),
      work: (json['work'] as List).map((e) => WorkExperience.fromJson(e)).toList(),
    );
  }
}

class SocialLink {
  final String name;
  final String url;

  SocialLink({required this.name, required this.url});

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Language {
  final String name;
  final String level;

  Language({required this.name, required this.level});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'],
      level: json['level'],
    );
  }
}

class WorkExperience {
  final String title;
  final String companyLink;
  final String description;
  final String from;
  final String to;
  final List<WorkLink> links;
  final List<String> skills;

  WorkExperience({
    required this.title,
    required this.companyLink,
    required this.description,
    required this.from,
    required this.to,
    required this.links,
    required this.skills,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    return WorkExperience(
      title: json['title'],
      companyLink: json['company_link'],
      description: json['description'],
      from: json['from'],
      to: json['to'],
      links: (json['links'] as List).map((e) => WorkLink.fromJson(e)).toList(),
      skills: List<String>.from(json['skills']),
    );
  }
}

class WorkLink {
  final String name;
  final String url;

  WorkLink({required this.name, required this.url});

  factory WorkLink.fromJson(Map<String, dynamic> json) {
    return WorkLink(
      name: json['name'],
      url: json['url'],
    );
  }
}