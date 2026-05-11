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

// Comprehensive Warcraft & Ascension Lore Entries
const sampleLoreEntries = <LoreEntry>[

  // ============================================================
  // TIMELINE
  // ============================================================

  LoreEntry(
    id: 'creation',
    title: 'The Titans & the Great Dark Beyond',
    category: LoreCategory.timeline,
    summary: 'The Pantheon awakens and begins shaping the cosmos from the Great Dark.',
    content: 'Before any world existed, the Titans slumbered within the Great Dark Beyond — an infinite void of cosmic forces. These godlike beings emerged one by one, each embodying a different aspect of creation. Aman\'Thul, the Highfather, led the Pantheon toward order. Sargeras, the champion, fought the demons of the Twisting Nether. Eonar nurtured life, Norgannon wielded the arcane, Khaz\'goroth shaped the earth, and Golganneth commanded the seas and skies.\n\nTogether, they traveled the cosmos, forging worlds wherever they found titans still slumbering — replacing chaos with order, darkness with light. Each world they touched became a jewel in the Great Dark. But one world would matter more than any other — Azeroth.',
    relatedIds: ['titan_order', 'old_gods', 'azeroth'],
  ),

  LoreEntry(
    id: 'titan_order',
    title: 'The Ordering of Azeroth',
    category: LoreCategory.timeline,
    summary: 'The Titans reforge a corrupted world, imprisoning the Old Gods beneath the surface.',
    content: 'When the Pantheon discovered Azeroth (then called Nilguth), the world was already dominated by the Old Gods — parasitic cosmic entities that had corrupted the prison-world of the sleeping World-Soul. The Titans waged a massive campaign to purge Azeroth of this corruption. Y\'Shaarj, the seven-headed Old God, was so deeply embedded in the world that when Khaz\'goroth ripped it from the surface, it wounded Azeroth itself — creating what would become the Well of Eternity.\n\nThe remaining Old Gods — N\'Zoth, C\'Thun, and Yogg-Saron — were imprisoned in underground vaults rather than removed, as doing so would have destroyed the World-Soul. The Titanic Keepers were left to ward the prison-seals and watch over the world.',
    relatedIds: ['creation', 'war_of_ancients'],
  ),

  LoreEntry(
    id: 'war_of_ancients',
    title: 'The War of the Ancients',
    category: LoreCategory.timeline,
    summary: 'The Burning Legion\'s first invasion shakes the world to its foundations.',
    content: 'The Highborne, led by Queen Azshara, used the Well of Eternity\'s power recklessly, eventually opening a doorway to the Twisting Nether. Sargeras — now the master of the demonic Burning Legion — found his portal to Azeroth. The first invasion was apocalyptic.\n\nIllidan Stormrage, brother to Malfurion, betrayed his people and drank from the Well to gain demonic power — yet his true motives were far more complex. He sought to steal Sargeras\'s soul. Neltharion (later Deathwing), empowered by the Old Gods, created the Demon Soul to enslave the Dragon Aspects.\n\nThe war ended when Malfurion Stormrage collapsed the Well, shattering the supercontinent and creating the Maelstrom. Azeroth was forever changed.',
    relatedIds: ['titan_order', 'night_elves', 'illidan', 'azeroth'],
  ),

  LoreEntry(
    id: 'sundering',
    title: 'The Sundering',
    category: LoreCategory.timeline,
    summary: 'The Well of Eternity\'s collapse shatters the continent, reshaping the world.',
    content: 'When the Well collapsed, the resulting cataclysm tore the single supercontinent apart. The seas rushed into the void at the world\'s center, forming the Maelstrom — a permanent, violent storm that rages to this day.\n\nThe survivors of the war found themselves scattered across new landmasses. The Eastern Kingdoms — once Kalimdor\'s eastern shore — became a separate continent entirely. Nordrassil, the World Tree, was planted on Mount Hyjal on the western shores of the new Kalimdor. Its purpose: to heal the wounds of the Well and provide a buffer between the physical world and the Emerald Dream.\n\nThe Highborne who survived were exiled by their kaldorei sisters. They crossed the Great Sea and would eventually become the high elves of what would be known as Quel\'Thalas.',
    relatedIds: ['war_of_ancients', 'night_elves'],
  ),

  LoreEntry(
    id: 'dark_portal',
    title: 'The Opening of the Dark Portal',
    category: LoreCategory.timeline,
    summary: 'Ner\'zhul\'s desperation opens a gateway between Draenor and Azeroth.',
    content: 'On the world of Draenor, the dying shaman Ner\'zhul opened dimensional portals in a desperate attempt to find new worlds for his people to conquer. The resulting magical backlash tore Draenor apart — but before the world shattered, it created a stable portal: the Dark Portal.\n\nMedivh, the Last Guardian — secretly possessed by Sargeras — had been preparing for this moment. Through his connection to Gul\'dan, he opened the gate from the Azeroth side in the Blasted Lands. The orcish Horde poured through.\n\nThis was the beginning of what would be known as the First War, and it would forever change both worlds. Draenor became Outland. Azeroth would face an invasion unlike anything it had seen before.',
    relatedIds: ['first_war', 'second_war'],
  ),

  LoreEntry(
    id: 'first_war',
    title: 'The First War',
    category: LoreCategory.timeline,
    summary: 'The Horde invades Azeroth and destroys Stormwind.',
    content: 'The orcish Horde, guided by the demonic Gul\'dan and his Council of Shadow, swept across Azeroth\'s southern continent. The humans of Stormwind were caught off-guard. King Llane Wrynn defended his kingdom, but internal betrayal — the orc Garona assassinating Llane — crippled the human resistance.\n\nSir Anduin Lothar, champion of Stormwind, fled with the remnants of his kingdom north to Lordaeron, carrying the young Prince Varian Wrynn with him. Stormwind was burned. The Horde had won — but Lothar would not let it stand.\n\nThis defeat became the catalyst for the greatest alliance the world had ever seen: the Alliance of Lordaeron.',
    relatedIds: ['dark_portal', 'second_war', 'alliance'],
  ),

  LoreEntry(
    id: 'second_war',
    title: 'The Second War',
    category: LoreCategory.timeline,
    summary: 'The Alliance of Lordaeron forms to fight the orcish Horde across the continent.',
    content: 'Lord Lothar united the seven human kingdoms with dwarves, gnomes, elves, and even the troll-fighting Amani into the Alliance of Lordaeron. The Second War was fought across the entire continent — the naval Battle of Hillsbrad, the siege of Quel\'Thalas, the destruction of Grim Batol.\n\nThe Tide of the war shifted at Blackrock Mountain, where Orgrim Doomhammer killed Medivh and Lothar fell in battle. His second-in-command, Turalyon, rallied the Alliance and drove the Horde back. The Dark Portal was destroyed — but the cost was tremendous.\n\nThe orcs were rounded up and placed in internment camps. Doomhammer vanished. And in secret, in the shadows, Ner\'zhul began building something new — the Scourge.',
    relatedIds: ['first_war', 'third_war', 'alliance', 'horde'],
  ),

  LoreEntry(
    id: 'third_war',
    title: 'The Third War',
    category: LoreCategory.timeline,
    summary: 'The Scourge rises, the Sunwell falls, and the world faces its darkest hour.',
    content: 'While the Alliance fought the Horde, Kel\'Thuzad — a Kirin Tor mage turned cultist — prepared for the return of his master. The Cult of the Damned infiltrated villages across Lordaeron with a magical plague. Prince Arthas Menethil, driven by a desire to save his people, purged the city of Stratholme — slaughtering the very citizens he sought to protect.\n\nArthas traveled to Northrend, where he claimed the blade Frostmourne. Soul-bound to the Lich King, he returned as a death knight and murdered his own father, King Terenas. Lordaeron was consumed.\n\nThe Sunwell was corrupted. Quel\'Thalas burned. Silvermoon fell. The Third War ended with the Legion defeated at Mount Hyjal, but the cost — a kingdom destroyed, people turned to undead, elves losing their connection to the Light — would echo for generations.',
    relatedIds: ['second_war', 'arthas', 'illidan', 'thrall', 'kel_thuzad'],
  ),

  LoreEntry(
    id: 'tbc_lore',
    title: 'The Burning Crusade',
    category: LoreCategory.timeline,
    summary: 'Illidan rules Outland as the Dark Portal reopens and the Legion returns.',
    content: 'Five years after the Third War, the Dark Portal reopened. This time, the forces of Outland were the target. Illidan Stormrage — the Betrayer, now the self-proclaimed lord of Outland — had assembled an army of naga and blood elves. The naaru of Outland, led by K\'ure, revealed the truth about their purpose: they are the crystallized heart of the naaru race, and they seek to spread the Light.\n\nBut Illidan\'s rule was challenged by his own brother, Malfurion. The draenei\'s prophet Velen warned of a greater threat — Kil\'jaeden, the second-in-command of the Burning Legion. The forces of the Alliance and the Horde pursued their own agendas, but they all converged on the Black Temple.',
    relatedIds: ['third_war', 'illidan', 'dark_portal'],
  ),

  LoreEntry(
    id: 'wrath_lore',
    title: 'The Wrath of the Lich King',
    category: LoreCategory.timeline,
    summary: 'The Lich King rises anew and the forces of Azeroth march to Northrend.',
    content: 'Arthas had fulfilled his destiny — he had merged with Ner\'zhul to become the Lich King. From Icecrown Citadel, he ruled the Scourge, a vast undead army that threatened all of Azeroth. When the Lich King struck at the capitals of Stormwind and Orgrimmar, it became clear: if the Scourge was not stopped, nothing would survive.\n\nThe forces of the Alliance and the Horde sailed to Northrend, landing at the icy shores of Borean Tundra and the Howling Fjord. The Argent Crusade and the Knights of the Ebon Blade — former Scourge commanders freed from the Lich King\'s control — joined forces against him.\n\nBut the Lich King had prepared for this. He had raised the dead of Northrend — the vrykul, the nerubians, the ancient guardians — and turned them into weapons. The siege of Icecrown Citadel would become the most epic battle in Azeroth\'s history.',
    relatedIds: ['third_war', 'arthas', 'kel_thuzad'],
  ),

  LoreEntry(
    id: 'cataclysm',
    title: 'The Cataclysm',
    category: LoreCategory.timeline,
    summary: 'Deathwing shatters the world, and the Dragon Aspects face their final battle.',
    content: 'While the heroes of Azeroth fought the Lich King, Deathwing — once Neltharion the Earth-Warder — awakened deep within Deepholm. Freed from his prison, he rose from the Elemental Plane and shattered the barriers between worlds. The resulting Cataclysm reshaped the entire continent of Azeroth.\n\nThe Barrens were split in two. Thousand Needles flooded. Duskwood darkened further. The Stonetalon Mountains became a war zone. And in the south, the goblins of Kezan and the worgen of Gilneas were forced into the Horde and Alliance respectively.\n\nBut the ultimate price was paid at the Dragon Soul. The Dragon Aspects, wielding the combined power of all five flights and the Dragon Soul itself, struck down Deathwing at the Maelstrom. Their powers diminished forever, the Age of Dragons ended. The Aspects were mortal.',
    relatedIds: ['wrath_lore', 'sundering', 'titan_order'],
  ),

  // ============================================================
  // CHARACTERS
  // ============================================================

  LoreEntry(
    id: 'arthas',
    title: 'Arthas Menethil',
    category: LoreCategory.characters,
    summary: 'The fallen prince of Lordaeron who became the Lich King.',
    content: 'Arthas Menethil was the crown prince of Lordaeron, beloved son of King Terenas Menethil II. Trained by Uther the Lightbringer in the ways of the Light and the blade, he was destined to be one of the greatest paladins Azeroth would ever know.\n\nBut when the plague of undeath swept through Lordaeron, Arthas\'s righteous fury turned to obsession. He purged Stratholme. He traveled to Northrend. He claimed Frostmourne — and with it, his soul.\n\nAs a death knight, he destroyed his own kingdom, murdered his father, and helped raise the dead. When he finally merged with Ner\'zhul in the Frozen Throne, the Lich King was born — but Arthas was finally at peace... with himself, for the first time.',
    relatedIds: ['third_war', 'wrath_lore', 'frostmourne', 'kel_thuzad'],
  ),

  LoreEntry(
    id: 'illidan',
    title: 'Illidan Stormrage',
    category: LoreCategory.characters,
    summary: 'The Betrayer — a demon-hunter whose true nature defied understanding.',
    content: 'Born a twin to Malfurion Stormrage, Illidan was powerful in arcane magic from birth — and cursed by it. His golden eyes, marked by his affinity for the arcane, made him an outcast among the Night Elves. Only his brother\'s love and Tyrande Whisperwind\'s affection kept him from madness.\n\nIn the War of the Ancients, Illidan drank from the Well of Eternity to gain demonic power. He believed he was stealing Sargeras\'s soul. He was wrong — and right. Sargeras saw potential in Illidan, marking him forever. For millennia, Illidan wandered, hunted by his own people.\n\nHe created a second Well of Eternity — an act of creation born of exile. He ruled Outland. He was defeated, redeemed, destroyed. Illidan was always more than what he appeared: not quite hero, not quite villain, but a force of nature who refused to be anyone else.',
    relatedIds: ['war_of_ancients', 'night_elves', 'tbc_lore', 'night_elves'],
  ),

  LoreEntry(
    id: 'thrall',
    title: 'Thrall (Go\'el)',
    category: LoreCategory.characters,
    summary: 'The warchief who freed the orcs and restored their honor.',
    content: 'Born Go\'el to Durotan and Draka on Draenor, Thrall was taken as a slave by the humans of Lordaeron after the Second War. Raised as a gladiator, he escaped and discovered the truth of his heritage. With the help of the orcs and Grom Hellscream, he freed his people from the internment camps.\n\nThrall traveled to Kalimdor, where he founded Durotar. He made the difficult choice to ally with Jaina Proudmoore\'s humans at Mount Hyjal. He served as Warchief of the Horde for years, rebuilding the orcs\' honor and connection to the shamanistic traditions that had been corrupted by the Burning Legion.\n\nHis greatest legacy was not his power — it was proving that the orcs could be more than what the Legion had made them.',
    relatedIds: ['third_war', 'horde', 'second_war'],
  ),

  LoreEntry(
    id: 'jaina',
    title: 'Jaina Proudmoore',
    category: LoreCategory.characters,
    summary: 'The most powerful human sorceress, heir to the Kirin Tor.',
    content: 'Jaina Proudmoore was the youngest daughter of Admiral Daelin Proudmoore of Kul Tiras. Gifted in the arcane arts, she studied under Archmage Antonidas in Dalaran and was destined for greatness. Her love for Arthas was genuine — and his fall to darkness would break her in ways she never expected.\n\nShe led the survivors of Lordaeron to Kalimdor, where she allied with Thrall\'s Horde against the Burning Legion. She founded the city of Theramore as a beacon of peace between the Alliance and Horde — until her father\'s fleet destroyed it.\n\nJaina became the leader of the Kirin Tor in Dalaran. Her patience wore thin as the world tore itself apart, and she would eventually lead Kul Tiras back into the Alliance on her own terms.',
    relatedIds: ['arthas', 'thrall', 'third_war', 'second_war'],
  ),

  LoreEntry(
    id: 'uther',
    title: 'Uther the Lightbringer',
    category: LoreCategory.characters,
    summary: 'The first paladin of the Silver Hand and mentor to Arthas.',
    content: 'Uther the Lightbringer was the first paladin of the Silver Hand, chosen by Archbishop Alonsus Faol himself. He became one of the greatest champions of the Light — a warrior-priest who combined martial prowess with divine magic.\n\nHe took Arthas Menethil as his apprentice, teaching the young prince the ways of the Light and duty. When Arthas claimed Frostmourne and became a death knight, Uther was horrified — to see his student become the very evil he had sworn to fight.\n\nUther died defending his students from the death knight who had once been his favorite pupil. His funeral was attended by the entire Alliance. Even Arthas visited his grave — but only to spite the Light he had abandoned.',
    relatedIds: ['arthas', 'third_war', 'alliance'],
  ),

  LoreEntry(
    id: 'kel_thuzad',
    title: 'Kel\'Thuzad',
    category: LoreCategory.characters,
    summary: 'The necromancer who built the Cult of the Damned and served the Lich King.',
    content: 'Kel\'Thuzad was once a respected archmage of the Kirin Tor, a scholar of vast knowledge and ambition. His interest in necromancy was considered heretical, and he was expelled from Dalaran. In his exile, he heard the call of the Lich King.\n\nHe founded the Cult of the Damned — a secret society dedicated to the worship of death. Through the cult, the plague was disseminated throughout Lordaeron, setting in motion the Third War. Kel\'Thuzad was killed by Arthas — but the Lich King raised him as a lich, and his service continued.\n\nKel\'Thuzad was the architect of the Plague of Undeath. Without him, the Scourge might never have consumed Lordaeron. His name became synonymous with death, and his legacy lived on long after he was finally defeated at Naxxramas.',
    relatedIds: ['arthas', 'third_war', 'wrath_lore'],
  ),

  LoreEntry(
    id: 'sargeras',
    title: 'Sargeras, the Dark Titan',
    category: LoreCategory.characters,
    summary: 'The fallen champion of the Titan Pantheon who became the master of the Burning Legion.',
    content: 'Sargeras was the greatest warrior the Titans had ever produced. He was the champion of the Pantheon, the enforcer who fought the demons of the Twisting Nether and kept the cosmos safe. But one battle changed him forever.\n\nHe discovered that the demons were not mindless creatures — they were intelligent beings, created by the Void Lords in the Twisting Nether. The Void Lords sought to corrupt all worlds, and Sargeras realized the Titans\' mission was futile. In his despair and rage, he turned against the Pantheon entirely.\n\nHe shattered his prison — a world — and released the demons. He formed the Burning Legion: an army of demons and corrupted beings destined to cleanse every world in the cosmos. His goal became total destruction — not of evil, but of the universe itself.',
    relatedIds: ['creation', 'war_of_ancients', 'titan_order'],
  ),

  LoreEntry(
    id: 'varian',
    title: 'Varian Wrynn',
    category: LoreCategory.characters,
    summary: 'The lion of Stormwind, king of the Alliance.',
    content: 'Varian Wrynn was the son of King Llane Wrynn and heir to the throne of Stormwind. When the Horde invaded during the First War, he was evacuated by Sir Anduin Lothar to Lordaeron at age seven. He grew up as the crown prince of a kingdom in exile.\n\nHe was kidnapped, enslaved, and lost — yet he fought in the gladiatorial pits of Orgrimmar, where he earned the name "Lo\'Gosh" (the ghost wolf). He eventually returned to Stormwind, but the trauma had changed him. Beneath the king was a warrior who had survived by fighting.\n\nVarian led the Alliance in the Northrend campaign and the war against the Horde. He was the embodiment of strength and sacrifice.',
    relatedIds: ['first_war', 'second_war', 'alliance'],
  ),

  // ============================================================
  // FACTIONS
  // ============================================================

  LoreEntry(
    id: 'alliance',
    title: 'The Alliance of Lordaeron',
    category: LoreCategory.factions,
    summary: 'United nations of humanity standing against darkness.',
    content: 'The Alliance was founded in the aftermath of the First War, when the orcs of the Horde destroyed Stormwind and threatened the northern kingdoms of Lordaeron. King Terenas Menethil II of Lordaeron, recognizing that no single kingdom could stand alone, united the seven human kingdoms — Lordaeron, Stormwind, Kul Tiras, Dalaran, Stromgarde, Gilneas, and Alterac — under a single banner.\n\nThe Alliance grew to include the dwarves of Ironforge, the gnomes of Gnomeregan, the high elves of Quel\'Thalas, and even the trolls of the Darkspear tribe who had been displaced by the Horde. This was a coalition of necessity, but it became a coalition of purpose.\n\nThe Alliance fought and won the Second War, but internal rivalries weakened it over time. Still, it remained the greatest force for order in Azeroth.',
    relatedIds: ['first_war', 'second_war', 'horde', 'jaina', 'varian'],
  ),

  LoreEntry(
    id: 'horde',
    title: 'The Horde',
    category: LoreCategory.factions,
    summary: 'A fractured coalition of outcasts, orcs, and the forsaken.',
    content: 'The original Horde was an army of orcs corrupted by the Burning Legion, brought through the Dark Portal to conquer Azeroth. After the Second War, the surviving orcs were interned in camps across Lordaeron — broken, listless, defeated.\n\nThrall changed everything. He freed the orcs, restored their connection to shamanistic traditions, and led them to Kalimdor where they founded Durotar. Under Thrall, the Horde became a coalition of necessity: orcs seeking redemption, trolls seeking allies, the Forsaken — undead seeking a place in the world — and eventually the blood elves of Quel\'Thalas.\n\nThe New Horde was defined by a code: honor, loyalty, and the willingness to fight for the survival of all its peoples. But beneath that code, the scars of corruption never fully healed.',
    relatedIds: ['first_war', 'second_war', 'alliance', 'thrall'],
  ),

  LoreEntry(
    id: 'night_elves',
    title: 'The Kaldorei (Night Elves)',
    category: LoreCategory.factions,
    summary: 'Ancient protectors of Kalimdor and guardians of the Emerald Dream.',
    content: 'The kaldorei are among the oldest immortal races on Azeroth. Born from the Well of Eternity and blessed by Elune, the Moon Goddess, they once ruled the supercontinent of Kalimdor in an age of magic and splendor. Their obsession with the arcane led to the War of the Ancients, the Sundering, and the loss of their immortality.\n\nAfter the Sundering, the Night Elves became guardians of the Emerald Dream through their connection to the druid Malfurion Stormrage. For ten thousand years, they maintained the balance between the natural and spiritual worlds.\n\nThe Night Elves remain aloof from the rest of Azeroth, but when threatened, they fight with the ferocity of ancient beings who have survived the loss of everything that mattered to them.',
    relatedIds: ['war_of_ancients', 'illidan', 'sundering'],
  ),

  LoreEntry(
    id: 'kirin_tor',
    title: 'The Kirin Tor of Dalaran',
    category: LoreCategory.factions,
    summary: 'The ruling body of the magocratic city of Dalaran.',
    content: 'The Kirin Tor is the council of powerful archmages who rule the floating city of Dalaran. Founded over a thousand years before the First War, Dalaran was built as a sanctuary for the study of the arcane arts. The Kirin Tor governed the city and its vast network of magical libraries.\n\nThe council was led by a conclave of archmages, each representing a different school of magic. Among the most famous were Antonidas, Jaina Proudmoore, and the traitor Kel\'Thuzad.\n\nDalaran played a crucial role in every major conflict. During the Third War, the city was besieged by the Scourge. After the Scourge was defeated, Dalaran was rebuilt and re-centered as an independent power, no longer part of the Alliance but neutral in the great conflicts of Azeroth.',
    relatedIds: ['kel_thuzad', 'jaina', 'third_war'],
  ),

  LoreEntry(
    id: 'burning_legion',
    title: 'The Burning Legion',
    category: LoreCategory.factions,
    summary: 'Sargeras\'s infinite demonic army, destined to destroy all creation.',
    content: 'The Burning Legion is the most destructive force in the cosmos. Led by Sargeras, the Dark Titan, the Legion is composed of countless demons, corrupted titans, and shattered beings who have been subjugated by Sargeras\'s will.\n\nThe Legion\'s purpose is simple: destroy every world, every civilization, every spark of life in the universe. Sargeras believes this is the only way to prevent the Void Lords from corrupting all of creation — if everything is destroyed, nothing can be corrupted.\n\nThe Legion invaded Azeroth three times: during the War of the Ancients, the Third War, and the Burning Crusade. Each invasion was met with resistance, but the Legion always returns — because Sargeras does not stop. The Legion is endless, and its hunger for destruction is absolute.',
    relatedIds: ['sargeras', 'war_of_ancients', 'third_war', 'tbc_lore'],
  ),

  LoreEntry(
    id: 'scourge',
    title: 'The Scourge',
    category: LoreCategory.factions,
    summary: 'The undead army of the Lich King, consuming all in its path of undeath.',
    content: 'The Scourge is an army of undead creatures created and commanded by the Lich King. Born from the Ner\'zhul\'s fusion with Arthas in Northrend, the Scourge was designed to be the ultimate weapon — an army that could consume any world, any civilization, any life it encountered.\n\nThe Scourge is not simply the dead; it is the dead who have been stripped of their will and forced into servitude. The victims of the plague that swept through Lordaeron became the foot soldiers. The fallen heroes became the commanders. The kings became the generals.\n\nAt its height, the Scourge consumed most of the Eastern Kingdoms. The only things that stood between Azeroth and total undeath were the Alliance, the Horde, and the Argent Crusade — united against their own dead.',
    relatedIds: ['arthas', 'kel_thuzad', 'third_war', 'wrath_lore'],
  ),

  // ============================================================
  // LOCATIONS
  // ============================================================

  LoreEntry(
    id: 'azeroth',
    title: 'Azeroth',
    category: LoreCategory.locations,
    summary: 'The jewel of the universe, home to all of the known worlds of Azeroth.',
    content: 'Azeroth is a world like no other. When the Titans discovered it, they found something they had never seen before: a World-Soul of unprecedented power slumbering deep within the planet. They reforged the world — replacing chaos with order, darkness with light, corruption with purity — but they could not fully heal the wounds of the Old Gods beneath the surface.\n\nThe major continents of Azeroth include: the Eastern Kingdoms (Lordaeron, Azeroth, Khaz Modan, Quel\'Thalas), Kalimdor, Northrend, Pandaria, and the newly discovered Dragon Isles. Each continent tells a different story of survival, conflict, and the eternal struggle between order and chaos.\n\nAzeroth is not just a world — it is a living entity, the physical manifestation of a Titan. Everything that happens on Azeroth echoes in the cosmos above. The fate of Azeroth is the fate of all.',
    relatedIds: ['creation', 'titan_order', 'sundering', 'cataclysm'],
  ),

  LoreEntry(
    id: 'lordaeron',
    title: 'Lordaeron',
    category: LoreCategory.locations,
    summary: 'The fallen kingdom of humanity, now a desolate wasteland of undeath.',
    content: 'Lordaeron was once the greatest human kingdom in the world. Its capital, now known as Undercity, was built atop the ruins after the Scourge swept through during the Third War. The city was once a beacon of culture, learning, and the power of the Light.\n\nThe fall of Lordaeron was the single most devastating event in the history of the Alliance. King Terenas Menethil II was murdered by his own son. The people of Lordaeron were infected with a magical plague of undeath and transformed into the Scourge. The capital was transformed into a city of the dead.\n\nToday, Lordaeron is known as the Tirisfal Glades — a place of perpetual twilight where the undead Forsaken live in the ruins of what was once humanity\'s greatest hope.',
    relatedIds: ['third_war', 'arthas', 'scourge', 'uther'],
  ),

  LoreEntry(
    id: 'kalimdor',
    title: 'Kalimdor',
    category: LoreCategory.locations,
    summary: 'The ancient continent of the Night Elves and the site of the final battle against the Legion.',
    content: 'Kalimdor is the westernmost of Azeroth\'s major continents and the oldest. Its name means "Land of Eternal Starlight" in the kaldorei tongue. The continent is home to the Night Elves, the Tauren, and a vast wilderness that stretches from the lush forests of Ashenvale to the deserts of Tanaris.\n\nAfter the Sundering, Kalimdor was reshaped. The Night Elves planted the World Tree Nordrassil at Mount Hyjal to protect the world from further invasions. Over the millennia, the orcs and their allies landed on its shores, seeking refuge from the Scourge.\n\nThe most famous battle of Kalimdor was the Battle of Mount Hyjal, where the Alliance and Horde united against the Burning Legion. The victory at Hyjal is a defining moment in Azeroth\'s history — it is where enemies became allies, and where the world learned the meaning of sacrifice.',
    relatedIds: ['azeroth', 'night_elves', 'third_war', 'sundering'],
  ),

  LoreEntry(
    id: 'duskwood',
    title: 'Duskwood',
    category: LoreCategory.locations,
    summary: 'A cursed forest where the sun never rises and the undead roam.',
    content: 'Duskwood was once Brightwood — a lush, sunlit forest filled with life. But during the Third War, a powerful magical ritual corrupted the land. The sky darkened, the trees withered, and the dead rose to wander the forest forever.\n\nThe inhabitants of Duskwood fled or were consumed. The town of Darkshire became a fortified outpost of the Alliance, but it is surrounded by death. The undead are everywhere — in the crypts, in the forest, and in the old ruins of Raven Hill Cemetery.\n\nDuskwood is cursed, and the curse is permanent. Even when the Scourge was defeated, the curse remained. The forest is a reminder of the cost of the Third War and the power of death magic. It is a place where even the most devout of the Light must admit that some wounds do not heal.',
    relatedIds: ['lordaeron', 'scourge', 'third_war', 'varian'],
  ),

  LoreEntry(
    id: 'northrend',
    title: 'Northrend',
    category: LoreCategory.locations,
    summary: 'The frozen continent where the Lich King sits upon the Frozen Throne.',
    content: 'Northrend is a continent of ice, snow, and death at the northern pole of the Eastern Kingdoms. It is the seat of the Lich King\'s power and the heart of the Scourge. The continent has been frozen since the dawn of the world, and the ice has only been cracked by the Lich King\'s arrival.\n\nThe continent is shaped like a skull — or perhaps a crown — and is home to some of the most dangerous places in Azeroth: Icecrown Citadel, the fortress of the Lich King; Naxxramas, the floating necropolis of Kel\'Thuzad; the Dragonblight, where dragons lay down to die; and the Howling Fjord, home of the vrykul.\n\nNorthrend is the site of the final invasion of the Lich King. The Argent Crusade and the Knights of the Ebon Blade, led by Tirion Fordring and Darion Mograine, laid siege to Icecrown Citadel and defeated the Lich King. The cost was unimaginable — but the result was the end of an age.',
    relatedIds: ['wrath_lore', 'arthas', 'scourge', 'kel_thuzad'],
  ),

  LoreEntry(
    id: 'silvermoon',
    title: 'Silvermoon City',
    category: LoreCategory.locations,
    summary: 'The jewel of Quel\'Thalas, ruined and rebuilt by the blood elves.',
    content: 'Silvermoon was the capital of Quel\'Thalas — the kingdom of the high elves. It was the most beautiful city in the world, built with golden spires and enchanted architecture that reflected the sun itself. Its people were immortal, its magic was limitless, and its isolation protected them from the wars of the world.\n\nThen came the Third War. Arthas Menethil marched through Quel\'Thalas with the Scourge. The Sunwell was corrupted. Silvermoon burned. The high elves were slaughtered by the thousands, and those who survived were driven into exile.\n\nWhen the survivors returned, they found their city in ruins. They renamed themselves "blood elves" and fought to rebuild what was destroyed. Silvermoon was rebuilt — but it was no longer the golden city of immortals. It was a city of survivors, haunted by loss, determined to endure.',
    relatedIds: ['third_war', 'arthas', 'night_elves', 'kirin_tor'],
  ),

  // ============================================================
  // ASCENSION
  // ============================================================

  LoreEntry(
    id: 'ascension_history',
    title: 'Project Ascension: History',
    category: LoreCategory.ascension,
    summary: 'The story of a private server that became a community-driven game engine.',
    content: 'Project Ascension began as a private World of Warcraft server run by a community of dedicated players who wanted something different. Rather than replicating the official game, they reimagined it — creating a classless system where any ability could be combined with any other, building custom heroes from the ground up.\n\nThe server launched with a small community but grew rapidly as word spread. Within months, Ascension had a player base rivaling official private servers. The development team worked tirelessly, adding custom content, balancing mechanics, and creating features that didn\'t exist in the retail game.\n\nAscension became more than just a server — it became a community of people who love the mechanics of World of Warcraft but wanted to play the game differently. Its success spawned multiple realms, each with different rulesets and playstyles.',
    relatedIds: ['og_classes', 'ascension_servers'],
  ),

  LoreEntry(
    id: 'og_classes',
    title: 'The Original Nine Classes',
    category: LoreCategory.ascension,
    summary: 'The classes that defined World of Warcraft and Project Ascension.',
    content: 'The original nine classes of World of Warcraft — Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, and Warlock — each represent a different aspect of combat and a different playstyle. Each class has three specializations, each of which defines the role the character will play in a group or in PvP.\n\nWarriorking of melee combat. Paladin is the holy warrior. Hunter is the master of the hunt. Rogue is the stealthy assassin. Priest is the healer of the Light. Death Knight is the undead warrior. Shaman is the spiritualist. Mage is the arcane spellcaster. Warlock is the demonic pact-maker.\n\nIn Project Ascension, these nine classes form the foundation of the classless hero system. You can mix abilities from any class — but the class system remains the backbone of the game. Understanding the OG classes is essential to understanding Ascension.',
    relatedIds: ['ascension_history', 'mystic_system'],
  ),

  LoreEntry(
    id: 'mystic_system',
    title: 'The Mystic Enchant System',
    category: LoreCategory.ascension,
    summary: 'Ascension\'s signature feature — powerful enchantments that customize your hero.',
    content: 'Mystic Enchants are the defining feature of Project Ascension\'s gameplay. These are powerful, customizable enchantments that can be applied to your equipment — weapons, armor, and other gear. Each enchant provides unique benefits: stat boosts, proc effects, damage over time, healing, and more.\n\nEnchants are categorized by slot (Weapon, Head, Chest, Legs, Feet) and by tier (Common, Uncommon, Rare, Epic, Legendary). Higher-tier enchants provide greater benefits but are also harder to obtain. Some enchants are class-specific, some are universal, and some are unique to Ascension\'s custom content.\n\nThe Mystic Enchant system allows players to customize their heroes in ways that official WoW never could. Two players can have the same class and spec but completely different playstyles based on the enchants they choose.',
    relatedIds: ['og_classes', 'ascension_history'],
  ),

  LoreEntry(
    id: 'ascension_servers',
    title: 'Ascension Server Realms',
    category: LoreCategory.ascension,
    summary: 'The three main realms of Project Ascension and what makes each unique.',
    content: 'Project Ascension operates on three main realms:\n\nAzeroth Reborn — The main realm. Classless system with custom content including new dungeons, mechanics, and hidden power. Players can mix abilities from any class and create truly unique heroes.\n\nWrath of the Lich King — WotLK content with classless heroes. The focus is on the Northrend storyline and the fight against the Lich King, but with the ability to customize your hero\'s abilities and talents.\n\nAscension: Classless — The pure classless experience. Any ability or talent within your reach, no restrictions. This is the realm for players who want maximum freedom and power.\n\nEach realm has its own community, its own ruleset, and its own playstyle. The server also runs events, tournaments, and special challenges to keep the community engaged.',
    relatedIds: ['ascension_history', 'og_classes'],
  ),

  LoreEntry(
    id: 'conquest_azeroth',
    title: 'Conquest of Azeroth',
    category: LoreCategory.ascension,
    summary: 'The ultimate custom experience — 21 completely new classes from Warcraft lore.',
    content: 'Conquest of Azeroth (CoA) is a special game mode within Project Ascension that features 21 completely new custom classes derived from Warcraft lore. Each class has three specializations, and each class represents a different archetype or faction from the Warcraft universe.\n\nCoA is the most ambitious custom content ever created for a private WoW server. The classes include everything from Dragonspawn and Dragonkin to Elemental Lords, Old God cultists, and ancient titan constructs. Each class has been designed with unique mechanics, abilities, and visual effects that don\'t exist in retail WoW.\n\nAccess to CoA is limited and requires special permission. Players can earn access through Donor Points, participation in AH travel guides, newsletter invites, or giveaways. It is the pinnacle of the Ascension experience.',
    relatedIds: ['ascension_history', 'og_classes'],
  ),

  // ============================================================
  // ITEMS
  // ============================================================

  LoreEntry(
    id: 'frostmourne',
    title: 'Frostmourne',
    category: LoreCategory.items,
    summary: 'The cursed blade that bound Arthas Menethil to the Lich King.',
    content: 'Frostmourne is one of the most powerful weapons ever forged. It was created by the Lich King (Ner\'zhul) on the planet of Icecrown and sent to Northrend, where it was trapped in a block of ice. When Arthas found it, he believed he was claiming a weapon that would help him defeat the Scourge.\n\nHe was wrong.\n\nFrostmourne consumed Arthas\'s soul the moment he touched it. It was a weapon of the Lich King, designed to enslave the soul of whoever claimed it. When Arthas used Frostmourne to destroy Lordaeron, he was already a prisoner of the blade. Frostmourne did not just kill — it bound. It did not just cut — it consumed. It was the most cursed weapon in the history of Azeroth, and its story is the story of Arthas\'s fall.',
    relatedIds: ['arthas', 'wrath_lore', 'third_war', 'scourge'],
  ),

  LoreEntry(
    id: 'thunderfury',
    title: 'Thunderfury, Blessed Blade of the Windseeker',
    category: LoreCategory.items,
    summary: 'The legendary sword of elemental lightning, wielded by the greatest warriors.',
    content: 'Thunderfury is one of the most legendary weapons in Azeroth. It was forged by the Elemental Lord of Wind — Ragnaros\'s rival — from the essence of the Thundering Wind. The blade is imbued with lightning and the power of storms. It was once wielded by the wind elementals, but was captured and reforged by mortals.\n\nThunderfury is not just a weapon — it is a force of nature. When it strikes, it sends arcs of lightning to nearby enemies, dealing damage and slowing them. Its power is immense, and only the greatest weaponsmiths of Azeroth can replicate its effects.\n\nThe blade has a long history: it was wielded by the Thunderlord clan of orcs, then by the Alliance champions, and now it is one of the most sought-after weapons in the game. Thunderfury is the definition of legendary.',
    relatedIds: ['second_war', 'alliance', 'horde'],
  ),

  LoreEntry(
    id: 'dragon_soul',
    title: 'The Dragon Soul',
    category: LoreCategory.items,
    summary: 'The disk artifact created by Deathwing that controlled the Dragon Aspects.',
    content: 'The Dragon Soul was a disk-shaped artifact created by Neltharion (later Deathwing) during the War of the Ancients. It was designed to channel the combined power of all five Dragon Aspects — Red, Blue, Green, Bronze, and Black — into a single weapon of unimaginable power.\n\nThe artifact was used against the Burning Legion, but its true purpose was far more sinister. Neltharion used it to enslave the aspects themselves, turning them against the Legion. When Malfurion realized what was happening, he destroyed the artifact — but the damage was done.\n\nThe Dragon Soul was reforged during the Cataclysm and used to defeat Deathwing himself. It is one of the most powerful artifacts in the history of Azeroth, and its legacy echoes through the ages.',
    relatedIds: ['war_of_ancients', 'cataclysm', 'titan_order'],
  ),

  LoreEntry(
    id: 'ashbringer',
    title: 'Ashbringer',
    category: LoreCategory.items,
    summary: 'The blade forged to destroy undeath, wielded by the greatest paladin.',
    content: 'Ashbringer was forged by Magni Bronzebeard, dwarf-king of Ironforge, from a crystal of pure Light. The blade was designed to be the ultimate weapon against the Scourge — a sword that could destroy the dead and purify the unholy.\n\nAlexandros Mograine, one of the greatest paladins of the Silver Hand, claimed Ashbringer and used it to devastating effect against the Scourge. The blade earned its name at the Battle of Naxxramas, where it literally turned the dead to ash. When Alexandros was betrayed and killed by his own son, Ashbringer was claimed by the Scourge and corrupted by Kel\'Thuzad.\n\nThe blade was eventually reclaimed by Tirion Fordring, who used it to break free from the influence of Arthas and become one of the greatest paladins of the Light. Ashbringer is the weapon of the greatest champion of the Light in Azeroth\'s history.',
    relatedIds: ['third_war', 'scourge', 'kel_thuzad', 'arthas'],
  ),

  LoreEntry(
    id: 'sunwell',
    title: 'The Sunwell',
    category: LoreCategory.items,
    summary: 'The source of power for the high elves and blood elves of Quel\'Thalas.',
    content: 'The Sunwell is a fount of pure arcane magic created by the high elves after they founded Quel\'Thalas. It was a gift from the Titan Norgannon, and it powered the entire elven civilization. Every high elf who lived in Quel\'Thalas drew their power from the Sunwell, and the Sunwell itself was the source of their immortality.\n\nDuring the Third War, Arthas invaded Quel\'Thalas, corrupted the Sunwell, and used it to resurrect Kel\'Thuzad as a lich. The Sunwell was destroyed. The high elves who survived became blood elves, seeking new sources of magic to sustain their race.\n\nThe Sunwell was eventually restored by Velen, the prophet of the draenei, who infused it with the Light. The blood elves could now draw their power from both the arcane and the Light, and the Sunwell became a symbol of redemption.',
    relatedIds: ['third_war', 'arthas', 'kel_thuzad', 'silvermoon'],
  ),
];
