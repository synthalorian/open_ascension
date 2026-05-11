import 'package:json_annotation/json_annotation.dart';

part 'lore_entry.g.dart';

enum LoreCategory {
  timeline,
  characters,
  factions,
  locations,
  ascension,
  items,
}

extension LoreCategoryX on LoreCategory {
  String get displayName {
    return const {
      LoreCategory.timeline: 'Timeline',
      LoreCategory.characters: 'Characters',
      LoreCategory.factions: 'Factions',
      LoreCategory.locations: 'Locations',
      LoreCategory.ascension: 'Ascension Lore',
      LoreCategory.items: 'Items',
    }[this]!;
  }
}

@JsonSerializable()
class LoreEntry {
  final String id;
  final String title;
  final LoreCategory category;
  final String summary;
  final String content;
  final String? imageUrl;
  final List<String> relatedIds;

  const LoreEntry({
    required this.id,
    required this.title,
    required this.category,
    required this.summary,
    required this.content,
    this.imageUrl,
    this.relatedIds = const [],
  });

  factory LoreEntry.fromJson(Map<String, dynamic> json) => _$LoreEntryFromJson(json);
  Map<String, dynamic> toJson() => _$LoreEntryToJson(this);
}

const sampleLoreEntries = <LoreEntry>[
  LoreEntry(
    id: 'creation',
    title: 'The Creation of the Universe',
    category: LoreCategory.timeline,
    summary: 'The Pantheon shapes Azeroth and the Great Dark Beyond.',
    content: 'In the beginning, there was the Titan Norgannon, who shaped the universe from the Great Dark Beyond. The Pantheon of Titans created the cosmos, forging stars and planets from the primordial chaos.\n\nAzeroth, once known as Nilguth, was discovered by the Titans and reforged into a world of order. The Pantheon created the mortals to serve as guardians of the planet.',
    relatedIds: ['titan_order', 'night_elves'],
  ),
  LoreEntry(
    id: 'night_elves',
    title: 'The Night Elves',
    category: LoreCategory.characters,
    summary: 'Ancient protectors of Kalimdor, blessed by Elune.',
    content: 'The Night Elves are one of the oldest races on Azeroth. Created by Elune and the Titans, they once ruled the world in the immortal night.\n\nAfter the War of the Ancients, they sacrificed their immortality to defeat the Burning Legion.',
    relatedIds: ['creation', 'azeroth'],
  ),
  LoreEntry(
    id: 'alliance',
    title: 'The Alliance',
    category: LoreCategory.factions,
    summary: 'Coalition of noble races united against the Burning Legion.',
    content: 'The Alliance was founded by King Terenas Menethil II of Lordaeron, uniting humans, dwarves, and night elves against the threat of the Burning Legion.\n\nOver time, the Alliance grew to include draenei refugees and worgen survivors.',
    relatedIds: ['horde', 'creation'],
  ),
  LoreEntry(
    id: 'horde',
    title: 'The Horde',
    category: LoreCategory.factions,
    summary: 'Band of brothers and sisters bound by honor.',
    content: 'Originally founded by Durok the Battle Lord, the Horde was a savage force of orcish clans. After the Dark Portal opened, they invaded Azeroth.\n\nThe New Horde, led by Thrall, rebuilt the orcs as honorable warriors.',
    relatedIds: ['alliance'],
  ),
  LoreEntry(
    id: 'azeroth',
    title: 'Azeroth',
    category: LoreCategory.locations,
    summary: 'The jewel of the universe, shaped by the Titans.',
    content: 'Azeroth, originally named Nilguth, is a world of unparalleled diversity. The Titans reforged it during the primordial era, creating its continents, oceans, and the crystalline core.\n\nMajor continents include Eastern Kingdoms and Kalimdor.',
    relatedIds: ['creation'],
  ),
  LoreEntry(
    id: 'ascension_rebirth',
    title: 'Ascension: Rebirth',
    category: LoreCategory.ascension,
    summary: 'The Project Ascension reimagining of World of Warcraft.',
    content: 'Project Ascension is a private server community that reimagines World of Warcraft with balanced gameplay, community-driven development, and modern quality-of-life features.\n\nThe Ascension timeline diverges from official Warcraft history, offering a fresh perspective on familiar lore.',
    relatedIds: ['creation', 'alliance', 'horde'],
  ),
];
