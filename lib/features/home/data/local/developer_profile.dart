class DeveloperProfile {
  final String name;
  final String email;
  final String subtitle;
  final String fullDescription;
  final String aboutMe;
  final String contactMeText;
  final List<String> recentTechnologies;
  final List<SocialLink> socialLinks;
  final List<WorkExperience> work;
  final List<Project> projects;
  final List<BlogPost> blogPosts;

  DeveloperProfile({
    required this.name,
    required this.email,
    required this.subtitle,
    required this.fullDescription,
    required this.aboutMe,
    required this.contactMeText,
    required this.recentTechnologies,
    required this.socialLinks,
    required this.work,
    required this.projects,
    required this.blogPosts,
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
  final String companyName;
  final String companyLink;
  final String description;
  final String workPeriod;
  final List<WorkLink> links;

  WorkExperience({
    required this.title,
    required this.companyName,
    required this.companyLink,
    required this.description,
    required this.workPeriod,
    required this.links,
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
  final String linkName;
  final String link;
  final String description;
  final List<String> tags;

  Project({
    required this.title,
    required this.image,
    required this.linkName,
    required this.link,
    required this.description,
    required this.tags,
  });
}

class BlogPost {
  final String title;
  final String link;
  final String description;
  final List<String> tags;
  final String date;

  BlogPost({
    required this.title,
    required this.link,
    required this.description,
    required this.tags,
    required this.date,
  });
}
