class DeveloperProfile {
  final String name;
  final String jobTitle;
  final String shortDescription;
  final String fullDescription;
  final bool showLanguages;
  final List<SocialLink> socialLinks;
  final List<Language> languages;
  final List<WorkExperience> work;
  final List<Project> projects;

  DeveloperProfile({
    required this.name,
    required this.jobTitle,
    required this.shortDescription,
    required this.fullDescription,
    required this.socialLinks,
    required this.showLanguages,
    required this.languages,
    required this.work,
    required this.projects,
  });
}

class SocialLink {
  final String name;
  final String url;

  SocialLink({required this.name, required this.url});
}

class Language {
  final String name;
  final String level;

  Language({required this.name, required this.level});
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
}

class WorkLink {
  final String name;
  final String url;

  WorkLink({required this.name, required this.url});
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
}
