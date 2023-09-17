import 'package:personal_website/features/home/data/developer_profile_dto.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';

class DeveloperProfileMapper {
  static DeveloperProfile map(DeveloperProfileDto dto) {
    return DeveloperProfile(
      name: dto.name ?? '',
      jobTitle: dto.jobTitle ?? '',
      shortDescription: dto.shortDescription ?? '',
      fullDescription: dto.fullDescription ?? '',
      showLanguages: dto.showLanguages ?? false,
      socialLinks: dto.socialLinks
              ?.map(
                (e) => SocialLink(name: e.name ?? '', url: e.url ?? ''),
              )
              .toList() ??
          [],
      languages: dto.languages
              ?.map(
                (e) => Language(name: e.name ?? '', level: e.level ?? ''),
              )
              .toList() ??
          [],
      work: dto.work
              ?.map((e) => WorkExperience(
                    title: e.title ?? '',
                    companyLink: e.companyLink ?? '',
                    description: e.description ?? '',
                    from: e.from ?? '',
                    to: e.to ?? '',
                    links: e.links
                            ?.map(
                              (link) => WorkLink(name: link.name ?? '', url: link.url ?? ''),
                            )
                            .toList() ??
                        [],
                    skills: e.skills?.whereType<String>().toList() ?? [],
                  ))
              .toList() ??
          [],
      projects: dto.projects
              ?.map((e) => Project(
                    title: e.title ?? '',
                    description: e.description ?? '',
                    image: e.image ?? '',
                    link: e.link ?? '',
                    tags: e.tags?.whereType<String>().toList() ?? [],
                  ))
              .toList() ??
          [],
    );
  }
}
