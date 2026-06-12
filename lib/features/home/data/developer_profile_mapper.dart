import 'package:personal_website/features/home/data/developer_profile_dto.dart';
import 'package:personal_website/features/home/data/local/developer_profile.dart';

class DeveloperProfileMapper {
  static DeveloperProfile map(DeveloperProfileDto dto) {
    return DeveloperProfile(
      name: dto.name ?? '',
      email: dto.email ?? '',
      subtitle: dto.subtitle ?? '',
      fullDescription: dto.fullDescription ?? '',
      aboutMe: dto.aboutMe ?? '',
      contactMeText: dto.contactMeText ?? '',
      recentTechnologies: dto.recentTechnologies,
      heroRole: dto.heroRole ?? 'Flutter Developer · Mobile Team Lead',
      heroMeta: (dto.heroMeta != null && dto.heroMeta!.isNotEmpty)
          ? dto.heroMeta!
              .map((e) => HeroMeta(value: e.value ?? '', label: e.label ?? ''))
              .toList()
          : [
              HeroMeta(value: '7+', label: 'years'),
              HeroMeta(value: 'Flutter', label: '/ Dart'),
              HeroMeta(value: 'iOS · Android · Web · Desktop', label: ''),
            ],
      skills: Skills(
        recently: dto.skills?.recently.isNotEmpty == true
            ? dto.skills!.recently
            : dto.recentTechnologies,
        // Fall back to the defaults whenever the list is absent OR empty, so a
        // partial `skills` object (key present, sub-list missing) still renders.
        platforms: dto.skills?.platforms.isNotEmpty == true
            ? dto.skills!.platforms
            : const ['iOS', 'Android', 'Web', 'Windows', 'macOS', 'Linux'],
        tooling: dto.skills?.tooling.isNotEmpty == true
            ? dto.skills!.tooling
            : const ['Xcode', 'Android Studio', 'Figma', 'Firebase', 'GCP'],
        services: dto.skills?.services.isNotEmpty == true ? dto.skills!.services : const [],
      ),
      socialLinks: dto.socialLinks
              ?.map(
                (e) => SocialLink(name: e.name ?? '', url: e.url ?? ''),
              )
              .toList() ??
          [],
      work: dto.work
              ?.map((e) => WorkExperience(
                    title: e.title ?? '',
                    companyName: e.companyName ?? '',
                    companyLink: e.companyLink ?? '',
                    description: e.description ?? '',
                    workPeriod: e.workPeriod ?? '',
                    links: e.links
                            ?.map(
                              (link) => WorkLink(name: link.name ?? '', url: link.url ?? ''),
                            )
                            .toList() ??
                        [],
                  ))
              .toList() ??
          [],
      projects: dto.projects
              ?.map((e) => Project(
                    title: e.title ?? '',
                    description: e.description ?? '',
                    image: e.image ?? '',
                    linkName: e.linkName ?? '',
                    link: e.link ?? '',
                    tags: e.tags?.whereType<String>().toList() ?? [],
                  ))
              .toList() ??
          [],
      blogPosts: dto.blogPosts
              ?.map((e) => BlogPost(
                    title: e.title ?? '',
                    description: e.description ?? '',
                    link: e.link ?? '',
                    tags: e.tags?.whereType<String>().toList() ?? [],
                    date: e.date ?? '',
                  ))
              .toList() ??
          [],
    );
  }
}
