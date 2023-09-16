class DeveloperProfile {
  final String name;
  final String jobTitle;
  final String shortDescription;
  final String fullDescription;
  final List<SocialLink> socialLinks;
  final bool showLanguages;
  final List<Language> languages;
  final List<WorkExperience> work;
  final List<Project> projects;

  DeveloperProfile(
      {required this.name,
      required this.jobTitle,
      required this.shortDescription,
      required this.fullDescription,
      required this.socialLinks,
      required this.showLanguages,
      required this.languages,
      required this.work,
      required this.projects});

  factory DeveloperProfile.fromJson(Map<String, dynamic> json) {
    return DeveloperProfile(
      name: json['name'],
      jobTitle: json['job_title'],
      shortDescription: json['short_description'],
      fullDescription: json['fullDescription'],
      socialLinks: (json['social_links'] as List).map((e) => SocialLink.fromJson(e)).toList(),
      showLanguages: json['show_languages'],
      languages: (json['languages'] as List).map((e) => Language.fromJson(e)).toList(),
      work: (json['work'] as List).map((e) => WorkExperience.fromJson(e)).toList(),
      projects: (json['projects'] as List).map((e) => Project.fromJson(e)).toList(),
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

class Project {
  final String title;
  final String image;
  final String link;
  final String description;
  final List<String> tags;

  Project({
    required this.title,
    required this.image,
    required this.link,
    required this.description,
    required this.tags,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      image: json['image'],
      link: json['link'],
      description: json['description'],
      tags: List<String>.from(json['tags']),
    );
  }
}
