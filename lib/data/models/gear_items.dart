import 'gear_item.dart';

/// All 200+ gear items organized by raid/source.
const sampleGearItems = <GearItem>[
  // ═══════════════════════════════════════
  // NAXXRAMAS (T7)
  // ═══════════════════════════════════════
  // Head
  GearItem(id: 'necro_knight_helm', name: 'Necro-Knight Helm', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.plate, rarity: GearRarity.epic,
      itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Anub\'Rekhan)',
      stats: {'stamina': 52, 'intellect': 38, 'armor': 820, 'crit': 28, 'haste': 18}),

  GearItem(id: 'plagueheart_corona', name: 'Plagueheart Corona', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Heigan)',
      stats: {'stamina': 45, 'intellect': 58, 'spellPower': 60, 'crit': 25}),

  GearItem(id: 'mankrik_eye', name: 'Eye of Mankrik\'s Revenge', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.mail, rarity: GearRarity.epic,
      itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Gluth)',
      stats: {'agility': 48, 'stamina': 42, 'attackPower': 40, 'crit': 25, 'armor': 580}),

  GearItem(id: 'hood_spectral', name: 'Hood of Spectral Guile', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.leather, rarity: GearRarity.epic,
      itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Noth)',
      stats: {'agility': 42, 'intellect': 38, 'stamina': 36, 'crit': 25, 'armor': 380}),

  GearItem(id: 'crown_untold', name: 'Crown of Untold Secrets', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Faerlina)',
      stats: {'stamina': 45, 'intellect': 55, 'spirit': 30, 'spellPower': 65}),

  // Shoulders
  GearItem(id: 'pt_spaulders', name: 'Spaulders of the Grand Crusader',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Four Horsemen)',
      stats: {'strength': 28, 'stamina': 38, 'armor': 640, 'dodge': 22, 'parry': 20}),

  GearItem(id: 'mantle_torn_battle', name: 'Mantle of Torn Battle Plans',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Gothik)',
      stats: {'agility': 32, 'stamina': 28, 'attackPower': 42, 'crit': 18, 'haste': 18, 'armor': 420}),

  GearItem(id: 'shoulders_plague', name: 'Shoulderpads of the Plague',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Loatheb)',
      stats: {'agility': 30, 'intellect': 26, 'stamina': 24, 'spellPower': 35, 'armor': 300}),

  // Chest
  GearItem(id: 'chestplate_angelic', name: 'Angelic Guardian Chestplate',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Kel\'Thuzad)',
      stats: {'strength': 40, 'stamina': 55, 'intellect': 18, 'armor': 1050, 'crit': 28, 'haste': 18}),

  GearItem(id: 'robe_void', name: 'Robes of the Void', slot: GearSlot.chest,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Kel\'Thuzad)',
      stats: {'stamina': 52, 'intellect': 62, 'spirit': 28, 'spellPower': 75, 'haste': 22}),

  GearItem(id: 'chest_feral_spirit', name: 'Chestguard of Ferocious Spirit',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Maexxna)',
      stats: {'agility': 45, 'stamina': 40, 'attackPower': 50, 'crit': 28, 'haste': 18, 'armor': 440}),

  // Hands
  GearItem(id: 'gauntlets_tower', name: 'Gauntlets of Towering Rage',
      slot: GearSlot.hands, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Patchwerk)',
      stats: {'strength': 25, 'stamina': 30, 'attackPower': 35, 'armor': 560, 'crit': 18}),

  GearItem(id: 'gloves_cryptstalker', name: 'Cryptstalker Gloves', slot: GearSlot.hands,
      type: GearType.armor, armorType: ArmorType.mail, rarity: GearRarity.epic,
      itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Sapphiron)',
      stats: {'agility': 28, 'stamina': 25, 'attackPower': 40, 'hit': 15, 'crit': 15, 'armor': 360}),

  // Waist
  GearItem(id: 'belt_undying', name: 'Girdle of the Undying Champion',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 200, requiredLevel: 80, source: 'Naxxramas (Heigan)',
      stats: {'strength': 22, 'stamina': 32, 'armor': 500, 'crit': 18, 'expertise': 15}),

  GearItem(id: 'belt_whispering', name: 'Belt of Whispering Shadows',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 200, requiredLevel: 80, source: 'Naxxramas (Gothik)',
      stats: {'stamina': 28, 'intellect': 36, 'spellPower': 45, 'haste': 18}),

  // Legs
  GearItem(id: 'legplates_untold', name: 'Legplates of the Unconquered',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Sapphiron)',
      stats: {'strength': 35, 'stamina': 45, 'intellect': 12, 'armor': 820, 'dodge': 22, 'haste': 18}),

  GearItem(id: 'leggings_deadly', name: 'Deadly Gladiator\'s Pants',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Noth)',
      stats: {'agility': 35, 'stamina': 32, 'attackPower': 42, 'crit': 22, 'resilience': 25, 'armor': 500}),

  // Feet
  GearItem(id: 'boots_plague', name: 'Treads of the Plague Bearer',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 200, requiredLevel: 80, source: 'Naxxramas (Gluth)',
      stats: {'strength': 20, 'stamina': 28, 'attackPower': 30, 'armor': 460, 'haste': 18}),

  GearItem(id: 'boots_abyssal', name: 'Boots of the Abyssal Caller',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 200, requiredLevel: 80, source: 'Naxxramas (Loatheb)',
      stats: {'stamina': 25, 'intellect': 32, 'spellPower': 42, 'spirit': 18}),

  // Wrist
  GearItem(id: 'bracers_necrotic', name: 'Necrotic Bracers',
      slot: GearSlot.wrist, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Naxxramas',
      stats: {'stamina': 22, 'intellect': 20, 'spellPower': 30, 'haste': 14}),

  // Neck
  GearItem(id: 'neck_kelthuzad', name: 'Pendant of the Lich King',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Kel\'Thuzad)',
      stats: {'stamina': 35, 'intellect': 25, 'crit': 22, 'haste': 18}),

  GearItem(id: 'neck_frostwyrm', name: 'Frostwyrm Fang Necklace',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Sapphiron)',
      stats: {'agility': 25, 'stamina': 22, 'attackPower': 35, 'crit': 18}),

  GearItem(id: 'neck_tainted', name: 'Tainted Heart of the Scourge',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Naxxramas (Four Horsemen)',
      stats: {'stamina': 28, 'intellect': 20, 'spirit': 18, 'spellPower': 30}),

  // Rings
  GearItem(id: 'ring_signet_abominations', name: 'Signet of the Abominations',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Anub\'Rekhan)',
      stats: {'strength': 22, 'stamina': 28, 'crit': 20, 'hit': 18}),

  GearItem(id: 'ring_soul_torn', name: 'Ring of Torn Souls',
      slot: GearSlot.wrist2, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Maexxna)',
      stats: {'agility': 22, 'stamina': 22, 'attackPower': 30, 'crit': 18}),

  // Weapons
  GearItem(id: 'mh_naxx_blade', name: 'Blade of the Fallen Champion',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Kel\'Thuzad)',
      stats: {'strength': 28, 'stamina': 25, 'attackPower': 55, 'hit': 15, 'crit': 18}),

  GearItem(id: 'twohand_justice', name: 'Justice Bringer',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.polearm,
      rarity: GearRarity.epic, itemLevel: 213, requiredLevel: 80, source: 'Naxxramas (Four Horsemen)',
      stats: {'strength': 32, 'stamina': 28, 'attackPower': 60, 'crit': 22, 'hit': 18}),

  GearItem(id: 'wand_bonechill', name: 'Wand of the Bonechill', slot: GearSlot.ranged,
      type: GearType.weapon, weaponType: WeaponType.wand,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Naxxramas',
      stats: {'intellect': 16, 'stamina': 12, 'spellPower': 28}),

  // ═══════════════════════════════════════
  // ULDUAR (T8)
  // ═══════════════════════════════════════
  // Head
  GearItem(id: 'helm_yogg', name: 'Visage of the Faceless Horror', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.plate, rarity: GearRarity.epic,
      itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Yogg-Saron)',
      stats: {'stamina': 58, 'intellect': 42, 'armor': 920, 'crit': 32, 'haste': 22}),

  GearItem(id: 'hood_frost', name: 'Hood of the Frost King', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.mail, rarity: GearRarity.epic,
      itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Freya)',
      stats: {'agility': 52, 'stamina': 45, 'attackPower': 50, 'crit': 28, 'armor': 660}),

  GearItem(id: 'coven_cowl', name: 'Cowl of the Withering Coven', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Mimiron)',
      stats: {'stamina': 50, 'intellect': 62, 'spellPower': 68, 'haste': 28}),

  GearItem(id: 'helm_obsidian', name: 'Helm of the Obsidian Sanctum', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.leather, rarity: GearRarity.epic,
      itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Hodir)',
      stats: {'agility': 46, 'intellect': 40, 'stamina': 38, 'crit': 28, 'armor': 420}),

  // Shoulders
  GearItem(id: 'spaulder_razorscale', name: 'Spaulders of the Razorscale',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Flame Leviathan)',
      stats: {'strength': 32, 'stamina': 40, 'armor': 720, 'dodge': 24, 'parry': 22}),

  GearItem(id: 'mantle_nature', name: 'Shoulderpads of the Eternal Guardian',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Mimiron)',
      stats: {'stamina': 35, 'intellect': 42, 'spellPower': 48, 'crit': 22, 'haste': 18}),

  // Chest
  GearItem(id: 'chest_iron_conclave', name: 'Chestguard of the Iron Conclave',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Yogg-Saron)',
      stats: {'strength': 44, 'stamina': 58, 'armor': 1180, 'crit': 32, 'haste': 22}),

  GearItem(id: 'robe_astral', name: 'Robe of Astral Convergence', slot: GearSlot.chest,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Freya)',
      stats: {'stamina': 55, 'intellect': 68, 'spirit': 32, 'spellPower': 82, 'haste': 26}),

  GearItem(id: 'chest_wild_hunt', name: 'Breastplate of the Wild Hunt',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Mimiron)',
      stats: {'agility': 50, 'stamina': 45, 'attackPower': 60, 'crit': 32, 'haste': 22, 'armor': 520}),

  // Hands
  GearItem(id: 'gauntlets_treadmill', name: 'Handguards of Steadying Resolve',
      slot: GearSlot.hands, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Freya)',
      stats: {'agility': 32, 'stamina': 28, 'attackPower': 45, 'crit': 22, 'armor': 340}),

  GearItem(id: 'gauntlets_hodir', name: 'Hoar Frost Gauntlets',
      slot: GearSlot.hands, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Hodir)',
      stats: {'strength': 28, 'stamina': 30, 'attackPower': 38, 'armor': 640, 'hit': 18}),

  // Legs
  GearItem(id: 'legplates_freya', name: 'Legplates of the Lifeless Witness',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Freya)',
      stats: {'strength': 38, 'stamina': 50, 'intellect': 15, 'armor': 920, 'dodge': 24, 'haste': 22}),

  GearItem(id: 'leggings_mage_burn', name: 'Mageburn Leggings', slot: GearSlot.legs,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 226, requiredLevel: 80, source: 'Ulduar (XT-002)',
      stats: {'stamina': 44, 'intellect': 55, 'spellPower': 65, 'crit': 28}),

  GearItem(id: 'leggings_icehowl', name: 'Leggings of the Icehowl Beast',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Thorim)',
      stats: {'agility': 40, 'stamina': 38, 'attackPower': 50, 'crit': 26, 'haste': 18, 'armor': 540}),

  // Waist
  GearItem(id: 'girdle_mimiron', name: 'Girdle of the Unseen Protector',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Mimiron)',
      stats: {'strength': 24, 'stamina': 35, 'armor': 560, 'crit': 22, 'expertise': 18}),

  GearItem(id: 'belt_xt002', name: 'Waistband of the Broken Heart',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (XT-002)',
      stats: {'stamina': 32, 'intellect': 42, 'spellPower': 48, 'haste': 22}),

  // Feet
  GearItem(id: 'boots_icehowl', name: 'Boots of the Ice Howl',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Hodir)',
      stats: {'agility': 28, 'stamina': 28, 'attackPower': 38, 'crit': 20, 'armor': 400}),

  GearItem(id: 'boots_freya', name: 'Treads of the Life Binder',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Freya)',
      stats: {'agility': 30, 'intellect': 26, 'stamina': 24, 'spellPower': 40, 'armor': 320}),

  // Neck
  GearItem(id: 'neck_uldurum', name: 'Pendant of the Iron Council',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Assembly of Iron)',
      stats: {'strength': 22, 'stamina': 26, 'attackPower': 35, 'hit': 18}),

  GearItem(id: 'neck_yogg', name: 'Lariat of a Thousand Veils',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Yogg-Saron)',
      stats: {'stamina': 32, 'intellect': 25, 'crit': 25, 'haste': 20}),

  // Rings
  GearItem(id: 'ring_uldurum_broken', name: 'Ring of the Unbroken Circle',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Assembly of Iron)',
      stats: {'agility': 24, 'stamina': 24, 'attackPower': 35, 'crit': 20}),

  GearItem(id: 'ring_ancient', name: 'Ancient Ring of the Keepers',
      slot: GearSlot.wrist2, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (XT-002)',
      stats: {'stamina': 25, 'intellect': 22, 'spellPower': 35, 'haste': 18}),

  // Weapons
  GearItem(id: 'mh_uldurum_sword', name: 'Sword of the Iron Council',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Assembly of Iron)',
      stats: {'strength': 30, 'stamina': 28, 'attackPower': 62, 'hit': 18, 'crit': 18}),

  GearItem(id: 'staff_freya', name: 'Branch of the Ancient Tree',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Freya)',
      stats: {'stamina': 38, 'intellect': 48, 'spellPower': 72, 'spirit': 32, 'haste': 26}),

  GearItem(id: 'mh_freya_axe', name: 'Blade of the Iron Thicket',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.axe,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Ulduar (Freya)',
      stats: {'agility': 30, 'stamina': 25, 'attackPower': 50, 'crit': 22, 'hit': 18}),

  GearItem(id: 'bow_ulduar', name: 'Thunderhead Longbow', slot: GearSlot.ranged,
      type: GearType.weapon, weaponType: WeaponType.bow,
      rarity: GearRarity.rare, itemLevel: 213, requiredLevel: 80, source: 'Ulduar',
      stats: {'agility': 22, 'stamina': 18, 'attackPower': 32}),

  // ═══════════════════════════════════════
  // ICC (T10)
  // ═══════════════════════════════════════
  // Head
  GearItem(id: 'helm_lk_plate', name: 'Crown of the Frozen King', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.plate, rarity: GearRarity.epic,
      itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lich King)',
      stats: {'stamina': 62, 'intellect': 48, 'armor': 1080, 'crit': 36, 'haste': 26}),

  GearItem(id: 'hood_blood_queen', name: 'Cowl of the Blood Queen', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Blood Queen Lan\'thel)',
      stats: {'stamina': 55, 'intellect': 72, 'spellPower': 85, 'haste': 36}),

  GearItem(id: 'helm_sindragosa', name: 'Helm of Scaled Fury', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.mail, rarity: GearRarity.epic,
      itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Sindragosa)',
      stats: {'agility': 58, 'stamina': 50, 'attackPower': 60, 'crit': 34, 'armor': 750}),

  GearItem(id: 'helm_deathwhisper', name: 'Hood of the Whispering Death', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.leather, rarity: GearRarity.epic,
      itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lady Deathwhisper)',
      stats: {'agility': 52, 'intellect': 45, 'stamina': 42, 'crit': 32, 'armor': 470}),

  // Shoulders
  GearItem(id: 'spaulders_lk_plate', name: 'Shoulderplates of the Frozen Wastes',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lich King)',
      stats: {'strength': 35, 'stamina': 44, 'armor': 820, 'dodge': 28, 'parry': 24}),

  GearItem(id: 'mantle_deathwhisper', name: 'Mantle of Corrupted Whisperings',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lady Deathwhisper)',
      stats: {'stamina': 38, 'intellect': 48, 'spellPower': 55, 'crit': 26, 'haste': 22}),

  GearItem(id: 'spaulders_rotface', name: 'Shoulderpads of the Festering Rot',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Rotface)',
      stats: {'agility': 35, 'stamina': 32, 'attackPower': 45, 'crit': 24, 'armor': 480}),

  // Chest
  GearItem(id: 'chest_lk_plate', name: 'Cuirass of the Frozen Throne',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lich King)',
      stats: {'strength': 50, 'stamina': 65, 'armor': 1380, 'crit': 36, 'haste': 26}),

  GearItem(id: 'robe_blood_queen', name: 'Robe of the Crimson Queen', slot: GearSlot.chest,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Blood Queen Lan\'thel)',
      stats: {'stamina': 58, 'intellect': 78, 'spirit': 38, 'spellPower': 92, 'haste': 32}),

  GearItem(id: 'chest_sindragosa_plate', name: 'Chestplate of the Frost Wyrm',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Sindragosa)',
      stats: {'agility': 52, 'stamina': 50, 'attackPower': 65, 'crit': 36, 'haste': 26, 'armor': 580}),

  GearItem(id: 'chest_festergut', name: 'Chestguard of Festering Bile',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Festergut)',
      stats: {'agility': 48, 'intellect': 42, 'stamina': 40, 'spellPower': 60, 'armor': 480}),

  // Hands
  GearItem(id: 'gauntlets_putricide', name: 'Gauntlets of the Alchemist',
      slot: GearSlot.hands,      type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Professor Putricide)',
      stats: {'agility': 35, 'stamina': 30, 'attackPower': 48, 'crit': 26, 'armor': 380}),

  GearItem(id: 'gauntlets_lk_plate', name: 'Gauntlets of the Frozen King',
      slot: GearSlot.hands, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lich King)',
      stats: {'strength': 30, 'stamina': 35, 'attackPower': 42, 'armor': 720, 'hit': 20}),

  // Legs
  GearItem(id: 'legplates_valithria', name: 'Leggings of the Dreamwalker',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Valithria)',
      stats: {'agility': 44, 'stamina': 42, 'attackPower': 55, 'crit': 30, 'haste': 22, 'armor': 580}),

  GearItem(id: 'leggings_lk_cloth', name: 'Leggings of the Lost Conqueror',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lich King)',
      stats: {'stamina': 50, 'intellect': 62, 'spellPower': 75, 'crit': 32}),

  GearItem(id: 'legplates_rotface', name: 'Legplates of Rotted Flesh',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Rotface)',
      stats: {'strength': 42, 'stamina': 55, 'intellect': 18, 'armor': 1020, 'dodge': 28, 'haste': 22}),

  // Waist
  GearItem(id: 'girdle_deathbringer', name: 'Girdle of the Deathbringer',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Deathbringer Saurfang)',
      stats: {'strength': 28, 'stamina': 38, 'armor': 620, 'crit': 26, 'expertise': 20}),

  GearItem(id: 'belt_blood_queen', name: 'Belt of the Crimson Plague',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Blood Queen Lan\'thel)',
      stats: {'stamina': 35, 'intellect': 48, 'spellPower': 55, 'haste': 26}),

  // Feet
  GearItem(id: 'boots_sindragosa', name: 'Sabatons of the Frost Queen',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Sindragosa)',
      stats: {'strength': 24, 'stamina': 32, 'attackPower': 35, 'armor': 520, 'haste': 22}),

  GearItem(id: 'boots_valithria', name: 'Boots of the Dreamwalker\'s Path',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Valithria)',
      stats: {'agility': 32, 'stamina': 30, 'attackPower': 42, 'crit': 24, 'armor': 440}),

  // Neck
  GearItem(id: 'neck_sindragosa', name: 'Sindragosa\'s Cruel Clutch',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Sindragosa)',
      stats: {'agility': 28, 'stamina': 26, 'attackPower': 42, 'crit': 22}),

  GearItem(id: 'neck_lk_cloth', name: 'Amulet of the Burning Soul',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Professor Putricide)',
      stats: {'stamina': 35, 'intellect': 30, 'spellPower': 42, 'haste': 24}),

  GearItem(id: 'neck_deathwhisper', name: 'Pendant of the Frozen Soul',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lady Deathwhisper)',
      stats: {'stamina': 35, 'intellect': 28, 'spirit': 22, 'spellPower': 40}),

  // Rings
  GearItem(id: 'ring_lk_melee', name: 'Signet of the Frozen King',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lich King)',
      stats: {'strength': 25, 'stamina': 30, 'crit': 24, 'hit': 20}),

  GearItem(id: 'ring_lk_caster', name: 'Band of the Crimson Conclave',
      slot: GearSlot.wrist2, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Blood Queen Lan\'thel)',
      stats: {'stamina': 28, 'intellect': 25, 'spellPower': 42, 'haste': 22}),

  GearItem(id: 'ring_putricide', name: 'Ring of the Putricide Experiment',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Professor Putricide)',
      stats: {'agility': 26, 'stamina': 26, 'attackPower': 38, 'crit': 22}),

  // Weapons
  GearItem(id: 'mh_shadowmourne', name: 'Shadowmourne', slot: GearSlot.twoHand,
      type: GearType.weapon, weaponType: WeaponType.axe,
      rarity: GearRarity.legendary, itemLevel: 284, requiredLevel: 80, source: 'Icecrown Citadel (Legendary Quest)',
      stats: {'strength': 45, 'stamina': 38, 'attackPower': 80, 'crit': 28, 'haste': 24}),

  GearItem(id: 'mh_valanyr', name: 'Val\'anyr, Hammer of Ancient Kings',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.mace,
      rarity: GearRarity.legendary, itemLevel: 245, requiredLevel: 80, source: 'Ulduar (Legendary Quest)',
      stats: {'intellect': 55, 'stamina': 42, 'spellPower': 85, 'spirit': 38, 'haste': 30}),

  GearItem(id: 'mh_lk_blade', name: 'Blade of the Frozen Throne', slot: GearSlot.mainHand,
      type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Lich King)',
      stats: {'strength': 35, 'stamina': 32, 'attackPower': 70, 'hit': 22, 'crit': 20}),

  GearItem(id: 'staff_lk', name: 'Staff of Primordial Suffering',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Professor Putricide)',
      stats: {'stamina': 45, 'intellect': 58, 'spellPower': 88, 'spirit': 38, 'haste': 34}),

  GearItem(id: 'mh_sindragosa', name: 'Sindragosa\'s Tooth', slot: GearSlot.mainHand,
      type: GearType.weapon, weaponType: WeaponType.mace,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Sindragosa)',
      stats: {'agility': 35, 'stamina': 30, 'attackPower': 55, 'crit': 26, 'hit': 20}),

  GearItem(id: 'crossbow_lk', name: 'Silverscope Crossbow', slot: GearSlot.ranged,
      type: GearType.weapon, weaponType: WeaponType.crossbow,
      rarity: GearRarity.rare, itemLevel: 245, requiredLevel: 80, source: 'Icecrown Citadel',
      stats: {'agility': 28, 'stamina': 22, 'attackPower': 40}),

  GearItem(id: 'wand_burning', name: 'Wand of the Burning Soul', slot: GearSlot.ranged,
      type: GearType.weapon, weaponType: WeaponType.wand,
      rarity: GearRarity.rare, itemLevel: 245, requiredLevel: 80, source: 'Icecrown Citadel',
      stats: {'intellect': 20, 'stamina': 15, 'spellPower': 35, 'crit': 15}),

  GearItem(id: 'throwing_deathwhisper', name: 'Throwing Dagger of the Dark Lady',
      slot: GearSlot.ranged, type: GearType.weapon, weaponType: WeaponType.thrown,
      rarity: GearRarity.rare, itemLevel: 245, requiredLevel: 80, source: 'Icecrown Citadel (Lady Deathwhisper)',
      stats: {'agility': 20, 'stamina': 15, 'attackPower': 35, 'crit': 15}),

  GearItem(id: 'relic_idol_moon', name: 'Idol of Lunar Eclipse', slot: GearSlot.relic,
      type: GearType.armor, armorType: null,
      rarity: GearRarity.rare, itemLevel: 245, requiredLevel: 80, source: 'Icecrown Citadel',
      stats: {'intellect': 22, 'stamina': 18, 'spellPower': 40}),

  GearItem(id: 'mh_blood_queen', name: 'Death\'s Verdict', slot: GearSlot.mainHand,
      type: GearType.weapon, weaponType: WeaponType.axe,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Blood Queen Lan\'thel)',
      stats: {'agility': 28, 'intellect': 22, 'spellPower': 50, 'crit': 22, 'haste': 18}),

  GearItem(id: 'offhand_valithria', name: 'Dreamwarden Shield', slot: GearSlot.offHand,
      type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Valithria)',
      stats: {'stamina': 28, 'intellect': 22, 'spellPower': 35, 'spirit': 18, 'blockValue': 80}),

  // ═══════════════════════════════════════
  // TOC (Trial of the Crusader - T9)
  // ═══════════════════════════════════════
  GearItem(id: 'helm_toc_plate', name: 'Helm of the Argent Champion', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.plate, rarity: GearRarity.epic,
      itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Jaraxxus)',
      stats: {'stamina': 56, 'intellect': 40, 'armor': 950, 'crit': 30, 'haste': 20}),

  GearItem(id: 'cowl_toc_cloth', name: 'Cowl of the Dark Heart', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Faction Champions)',
      stats: {'stamina': 48, 'intellect': 60, 'spellPower': 70, 'crit': 26}),

  GearItem(id: 'helm_toc_leather', name: 'Mask of the Twilight Assassin', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.leather, rarity: GearRarity.epic,
      itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Faction Champions)',
      stats: {'agility': 50, 'intellect': 42, 'stamina': 40, 'crit': 30, 'armor': 440}),

  GearItem(id: 'shoulders_toc_plate', name: 'Shoulderplates of the Argent Dawn',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Anub\'arak)',
      stats: {'strength': 30, 'stamina': 38, 'armor': 750, 'dodge': 22, 'parry': 20}),

  GearItem(id: 'chest_toc_plate', name: 'Chestguard of the Argent Vanguard',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Jaraxxus)',
      stats: {'strength': 42, 'stamina': 55, 'armor': 1150, 'crit': 30, 'haste': 20}),

  GearItem(id: 'robe_toc_cloth', name: 'Robe of the Silver Covenant', slot: GearSlot.chest,
      type: GearType.armor, armorType: ArmorType.cloth, rarity: GearRarity.epic,
      itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Faction Champions)',
      stats: {'stamina': 52, 'intellect': 65, 'spirit': 30, 'spellPower': 78, 'haste': 24}),

  GearItem(id: 'hands_toc_plate', name: 'Gauntlets of the Silver Hand',
      slot: GearSlot.hands, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Faction Champions)',
      stats: {'strength': 28, 'stamina': 32, 'attackPower': 40, 'armor': 680, 'crit': 20}),

  GearItem(id: 'belt_toc_plate', name: 'Belt of the Argent Onslaught',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Faction Champions)',
      stats: {'strength': 22, 'stamina': 35, 'armor': 540, 'crit': 22, 'expertise': 18}),

  GearItem(id: 'legs_toc_mail', name: 'Legguards of the Shimmering Wave',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Jaraxxus)',
      stats: {'agility': 38, 'stamina': 36, 'attackPower': 48, 'crit': 24, 'haste': 20, 'armor': 520}),

  GearItem(id: 'feet_toc_cloth', name: 'Sandals of the Silver Hand',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Anub\'arak)',
      stats: {'stamina': 28, 'intellect': 34, 'spellPower': 45, 'spirit': 20}),

  GearItem(id: 'neck_toc_melee', name: 'Choker of the Argent Crusade',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Anub\'arak)',
      stats: {'agility': 26, 'stamina': 24, 'attackPower': 38, 'crit': 20}),

  GearItem(id: 'neck_toc_caster', name: 'Pendant of the Sunreavers',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Faction Champions)',
      stats: {'stamina': 30, 'intellect': 26, 'spellPower': 38, 'haste': 20}),

  GearItem(id: 'ring_toc_melee', name: 'Signet of the Crusader',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Jaraxxus)',
      stats: {'strength': 22, 'stamina': 26, 'crit': 20, 'hit': 18}),

  GearItem(id: 'ring_toc_caster', name: 'Band of the Argent Champion',
      slot: GearSlot.wrist2, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Faction Champions)',
      stats: {'stamina': 25, 'intellect': 22, 'spellPower': 35, 'haste': 18}),

  GearItem(id: 'mh_toc_sword', name: 'Sword of the Crusader\'s Flame',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Anub\'arak)',
      stats: {'strength': 28, 'stamina': 26, 'attackPower': 58, 'hit': 18, 'crit': 20}),

  GearItem(id: 'staff_toc', name: 'Light\'s Vengeance', slot: GearSlot.twoHand,
      type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Jaraxxus)',
      stats: {'stamina': 35, 'intellect': 45, 'spellPower': 68, 'spirit': 30, 'haste': 24}),

  GearItem(id: 'mh_toc_mace', name: 'Hammer of the Lightbringer',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.mace,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Trial of the Crusader (Faction Champions)',
      stats: {'intellect': 32, 'stamina': 28, 'spellPower': 52, 'hit': 18, 'crit': 16}),

  GearItem(id: 'bow_toc', name: 'Crossbow of the Iron Vow', slot: GearSlot.ranged,
      type: GearType.weapon, weaponType: WeaponType.crossbow,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Trial of the Crusader',
      stats: {'agility': 20, 'stamina': 16, 'attackPower': 34}),

  // ═══════════════════════════════════════
  // HEROIC DAILY / DUNGEON ITEMS
  // ═══════════════════════════════════════
  GearItem(id: 'helm_herald_dungeon', name: 'Helm of the Frostbrood', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.mail, rarity: GearRarity.rare,
      itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Trial of the Champion)',
      stats: {'agility': 40, 'stamina': 35, 'attackPower': 35, 'crit': 18, 'armor': 540}),

  GearItem(id: 'chest_herald_dungeon', name: 'Chestguard of the Frozen Hall',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Forgotten Chambers)',
      stats: {'stamina': 42, 'intellect': 48, 'spellPower': 50, 'haste': 18}),

  GearItem(id: 'boots_dungeon_plate', name: 'Treads of the Ice Crown Guard',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Hall of Reflection)',
      stats: {'strength': 18, 'stamina': 25, 'attackPower': 28, 'armor': 440, 'hit': 15}),

  GearItem(id: 'neck_dungeon', name: 'Necklace of the Frozen Heart',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Forge of Souls)',
      stats: {'stamina': 24, 'intellect': 18, 'spellPower': 30, 'haste': 15}),

  GearItem(id: 'ring_dungeon_melee', name: 'Band of the Frozen Vanguard',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Pit of Saron)',
      stats: {'strength': 18, 'stamina': 22, 'crit': 16, 'hit': 15}),

  GearItem(id: 'mh_dungeon_sword', name: 'Blade of the Silver Covenant',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Halls of Reflection)',
      stats: {'strength': 22, 'stamina': 20, 'attackPower': 48, 'hit': 15, 'crit': 16}),

  // ═══════════════════════════════════════
  // PVP ARENA / HONOR GEAR
  // ═══════════════════════════════════════
  GearItem(id: 'helm_pvp_plate', name: 'Deadly Gladiator\'s Plate Helm',
      slot: GearSlot.head, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'PvP Arena (S8)',
      stats: {'strength': 35, 'stamina': 45, 'armor': 920, 'crit': 24, 'resilience': 40}),

  GearItem(id: 'helm_pvp_cloth', name: 'Deadly Gladiator\'s Cowl',
      slot: GearSlot.head, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'PvP Arena (S8)',
      stats: {'stamina': 42, 'intellect': 52, 'spellPower': 62, 'resilience': 38}),

  GearItem(id: 'chest_pvp_mail', name: 'Deadly Gladiator\'s Chain Armor',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'PvP Arena (S8)',
      stats: {'agility': 40, 'stamina': 40, 'attackPower': 52, 'crit': 24, 'resilience': 36, 'armor': 520}),

  GearItem(id: 'legs_pvp_leather', name: 'Deadly Gladiator\'s Legs',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'PvP Arena (S8)',
      stats: {'agility': 36, 'stamina': 35, 'attackPower': 46, 'crit': 22, 'resilience': 32}),

  GearItem(id: 'ring_pvp_melee', name: 'Deadly Gladiator\'s Ring',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'PvP Arena (S8)',
      stats: {'agility': 22, 'stamina': 24, 'attackPower': 32, 'crit': 18, 'resilience': 30}),

  GearItem(id: 'mh_pvp_mace', name: 'Deadly Gladiator\'s Slicer',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'PvP Arena (S8)',
      stats: {'strength': 28, 'stamina': 25, 'attackPower': 55, 'hit': 18, 'resilience': 30}),

  GearItem(id: 'staff_pvp', name: 'Deadly Gladiator\'s Staff',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'PvP Arena (S8)',
      stats: {'stamina': 35, 'intellect': 45, 'spellPower': 65, 'spirit': 28, 'resilience': 36}),

  GearItem(id: 'bow_pvp', name: 'Deadly Gladiator\'s Longbow',
      slot: GearSlot.ranged, type: GearType.weapon, weaponType: WeaponType.bow,
      rarity: GearRarity.rare, itemLevel: 232, requiredLevel: 80, source: 'PvP Arena (S8)',
      stats: {'agility': 20, 'stamina': 16, 'attackPower': 35, 'resilience': 22}),

  // ═══════════════════════════════════════
  // RARE / EPIC BOE (Blacksmithing/Engineering drops)
  // ═══════════════════════════════════════
  GearItem(id: 'helm_titanium', name: 'Titanium Spellshock Helm',
      slot: GearSlot.head, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'stamina': 35, 'intellect': 28, 'armor': 820, 'crit': 20, 'haste': 16}),

  GearItem(id: 'chest_saronite', name: 'Saronite Stormbracers',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'strength': 32, 'stamina': 42, 'armor': 1050, 'hit': 18, 'crit': 18}),

  GearItem(id: 'belt_savage_saronite', name: 'Savage Saronite Belt',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'strength': 20, 'stamina': 30, 'armor': 480, 'crit': 18, 'expertise': 15}),

  GearItem(id: 'hands_dark_iron', name: 'Dark Iron Gauntlets', slot: GearSlot.hands,
      type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'agility': 20, 'stamina': 18, 'attackPower': 30, 'armor': 320, 'crit': 14}),

  GearItem(id: 'staff_northrend', name: 'Staff of Northrend Ice',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.epic, itemLevel: 200, requiredLevel: 75, source: 'Engineering',
      stats: {'stamina': 28, 'intellect': 35, 'spellPower': 52, 'spirit': 22}),

  GearItem(id: 'goggles_destructive', name: 'Destructive Skyflare Diamond',
      slot: GearSlot.head, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 75, source: 'Engineering',
      stats: {'agility': 25, 'intellect': 22, 'attackPower': 35, 'crit': 16, 'armor': 360}),

  // ═══════════════════════════════════════
  // LEGENDARY WEAPONS (more)
  // ═══════════════════════════════════════
  GearItem(id: 'mh_thunderfury', name: 'Thunderfury, Blessed Blade of the Windseeker',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.legendary, itemLevel: 245, requiredLevel: 80, source: 'Legendary Quest',
      stats: {'agility': 32, 'stamina': 28, 'attackPower': 60, 'crit': 24, 'haste': 20}),

  GearItem(id: 'mh_sulfuras', name: "Sulfuras, Hand of Ragnaros", slot: GearSlot.twoHand,
      type: GearType.weapon, weaponType: WeaponType.mace,
      rarity: GearRarity.legendary, itemLevel: 268, requiredLevel: 80, source: 'Legendary Quest',
      stats: {'strength': 42, 'stamina': 35, 'attackPower': 75, 'crit': 26, 'haste': 22}),

  GearItem(id: 'staff_medivh', name: "Atiesh, Greatstaff of the Guardian",
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.legendary, itemLevel: 245, requiredLevel: 80, source: 'Legendary Quest',
      stats: {'stamina': 42, 'intellect': 52, 'spellPower': 80, 'spirit': 36, 'haste': 28}),

  GearItem(id: 'bow_rhok_delar', name: 'Rhok\'Delar, Longbow of the Ancients',
      slot: GearSlot.ranged, type: GearType.weapon, weaponType: WeaponType.bow,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Heroic Dungeon (Heroic ICC)',
      stats: {'agility': 32, 'stamina': 25, 'attackPower': 48, 'crit': 22}),

  // ═══════════════════════════════════════
  // EMBLEM OF FROST (Wintergrasp/Emblem Gear)
  // ═══════════════════════════════════════
  GearItem(id: 'chest_eoff_plate', name: 'Battleplate of the Frostborn Hero',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 258, requiredLevel: 80, source: 'Emblem of Frost',
      stats: {'strength': 46, 'stamina': 58, 'armor': 1280, 'crit': 32, 'haste': 24}),

  GearItem(id: 'robe_eoff_cloth', name: 'Robe of the Frozen Conclave',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 258, requiredLevel: 80, source: 'Emblem of Frost',
      stats: {'stamina': 54, 'intellect': 70, 'spirit': 35, 'spellPower': 82, 'haste': 30}),

  GearItem(id: 'legs_eoff_mail', name: 'Legguards of the Frozen Waste',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 258, requiredLevel: 80, source: 'Emblem of Frost',
      stats: {'agility': 42, 'stamina': 40, 'attackPower': 52, 'crit': 28, 'haste': 22, 'armor': 560}),

  GearItem(id: 'neck_eoff_caster', name: "Ashen Verdict's Pendant",
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 258, requiredLevel: 80, source: 'Ashen Verdict Exalted',
      stats: {'stamina': 32, 'intellect': 28, 'spellPower': 42, 'haste': 24}),

  GearItem(id: 'neck_eoff_melee', name: "Ashen Verdict's Band",
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 258, requiredLevel: 80, source: 'Ashen Verdict Exalted',
      stats: {'strength': 22, 'stamina': 26, 'attackPower': 38, 'crit': 20}),

  GearItem(id: 'ring_eoff', name: "Ashen Verdict's Seal",
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 258, requiredLevel: 80, source: 'Ashen Verdict Exalted',
      stats: {'agility': 24, 'stamina': 26, 'attackPower': 36, 'crit': 22}),

  GearItem(id: 'mh_eoff_sword', name: 'Ardent Edge of the Verdict',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.epic, itemLevel: 258, requiredLevel: 80, source: 'Emblem of Frost',
      stats: {'strength': 30, 'stamina': 28, 'attackPower': 62, 'hit': 20, 'crit': 20}),

  GearItem(id: 'staff_eoff', name: 'Staff of the Ashen Council',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.epic, itemLevel: 258, requiredLevel: 80, source: 'Emblem of Frost',
      stats: {'stamina': 42, 'intellect': 52, 'spellPower': 78, 'spirit': 36, 'haste': 30}),

  // ═══════════════════════════════════════
  // EXTRA UTILITY ITEMS (Rings, Necks, Trinkets)
  // ═══════════════════════════════════════
  GearItem(id: 'trinket_corpse_tongue', name: 'Corpse Tongue Coin', slot: GearSlot.shoulder,
      type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Professor Putricide)',
      stats: {'agility': 30, 'stamina': 25, 'attackPower': 40, 'crit': 22}),

  GearItem(id: 'trinket_blood', name: 'Blood of the Old God', slot: GearSlot.shoulder,
      type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 268, requiredLevel: 80, source: 'Icecrown Citadel (Yogg-Saron)',
      stats: {'stamina': 30, 'intellect': 28, 'spellPower': 40, 'crit': 24}),

  // ═══════════════════════════════════════
  // MORE DUNGEON / RARE / REPUTATION GEAR
  // ═══════════════════════════════════════
  GearItem(id: 'helm_dungeon_ahs', name: 'Helm of the Ahn\'Kahar Guardian',
      slot: GearSlot.head, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Heroic Dungeon (Ahn\'Kahar)',
      stats: {'stamina': 35, 'intellect': 25, 'armor': 780, 'crit': 18, 'haste': 14}),

  GearItem(id: 'chest_dungeon_gun', name: 'Chestplate of the Gunship Commander',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Gunship Battle)',
      stats: {'strength': 28, 'stamina': 38, 'armor': 980, 'hit': 16, 'crit': 16}),

  GearItem(id: 'legs_dungeon_gundrak', name: 'Legguards of Gundrak',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Heroic Dungeon (Gundrak)',
      stats: {'agility': 28, 'stamina': 26, 'attackPower': 35, 'crit': 16, 'armor': 400}),

  GearItem(id: 'boots_dungeon_drak', name: "Drak'Tharon Sabatons",
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Heroic Dungeon (Drak\'Tharon)',
      stats: {'agility': 22, 'stamina': 20, 'attackPower': 28, 'armor': 300, 'crit': 14}),

  GearItem(id: 'belt_dungeon_violet', name: 'Belt of the Violet Hold',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Heroic Dungeon (Violet Hold)',
      stats: {'stamina': 24, 'intellect': 28, 'spellPower': 35, 'haste': 14}),

  GearItem(id: 'hands_dungeon_utgarde', name: 'Utgarde Grip',
      slot: GearSlot.hands, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.rare, itemLevel: 187, requiredLevel: 70, source: 'Heroic Dungeon (Utgarde Keep)',
      stats: {'agility': 16, 'stamina': 15, 'attackPower': 22, 'armor': 260}),

  GearItem(id: 'wrist_dungeon_nexus', name: 'Nexus Warper Bracers',
      slot: GearSlot.wrist, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.rare, itemLevel: 187, requiredLevel: 70, source: 'Heroic Dungeon (The Nexus)',
      stats: {'stamina': 14, 'intellect': 16, 'spellPower': 22, 'crit': 10}),

  GearItem(id: 'neck_reputation_kirin', name: "Kirin Tor Signet of Mastery",
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Kirin Tor Exalted',
      stats: {'stamina': 28, 'intellect': 24, 'spellPower': 38, 'haste': 20}),

  GearItem(id: 'neck_reputation_wyrmrest', name: "Wyrmrest Signet of Accord",
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Wyrmrest Accord Exalted',
      stats: {'stamina': 28, 'intellect': 24, 'spellPower': 38, 'crit': 20}),

  GearItem(id: 'neck_reputation_knights', name: "Knight's Grace Pendant",
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Argent Crusade Exalted',
      stats: {'strength': 22, 'stamina': 24, 'attackPower': 36, 'hit': 16}),

  GearItem(id: 'ring_reputation_sons', name: 'Signet of the Sons of Stormwind',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.rare, itemLevel: 213, requiredLevel: 80, source: 'Sons of Hodir Revered',
      stats: {'stamina': 20, 'intellect': 18, 'spellPower': 30, 'haste': 14}),

  GearItem(id: 'ring_reputation_earthen', name: 'Ring of the Earthen Ring',
      slot: GearSlot.wrist2, type: GearType.armor, armorType: null,
      rarity: GearRarity.rare, itemLevel: 213, requiredLevel: 80, source: 'The Wyrmrest Accord Revered',
      stats: {'agility': 18, 'stamina': 20, 'attackPower': 28, 'crit': 14}),

  GearItem(id: 'mh_dungeon_ahs', name: 'Ahn\'Kahar Bloodletter',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.dagger,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Heroic Dungeon (Ahn\'Kahar)',
      stats: {'agility': 18, 'stamina': 15, 'attackPower': 35, 'hit': 12}),

  GearItem(id: 'mh_dungeon_drak', name: 'Drak\'mar Maul',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.mace,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Heroic Dungeon (Drak\'Tharon)',
      stats: {'intellect': 20, 'stamina': 16, 'spellPower': 38, 'hit': 14}),

  GearItem(id: 'mh_dungeon_violet', name: 'Blade of the Violet Thief',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Heroic Dungeon (Violet Hold)',
      stats: {'strength': 18, 'stamina': 16, 'attackPower': 38, 'crit': 12}),

  GearItem(id: 'staff_dungeon_nexus', name: 'Nexus Focus Staff',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.rare, itemLevel: 187, requiredLevel: 70, source: 'Heroic Dungeon (The Nexus)',
      stats: {'stamina': 20, 'intellect': 28, 'spellPower': 42, 'spirit': 18, 'haste': 12}),

  GearItem(id: 'polearm_dungeon_drak', name: 'Drakkari Polearm of Ages',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.polearm,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Heroic Dungeon (Gundrak)',
      stats: {'agility': 20, 'stamina': 18, 'attackPower': 40, 'crit': 14}),

  GearItem(id: 'bow_dungeon_utgarde', name: 'Vrykul Battle Bow',
      slot: GearSlot.ranged, type: GearType.weapon, weaponType: WeaponType.bow,
      rarity: GearRarity.uncommon, itemLevel: 172, requiredLevel: 68, source: 'Heroic Dungeon (Utgarde Keep)',
      stats: {'agility': 14, 'stamina': 12, 'attackPower': 24}),

  GearItem(id: 'wand_dungeon_nexus', name: 'Wand of the Arcane Sentinel',
      slot: GearSlot.ranged, type: GearType.weapon, weaponType: WeaponType.wand,
      rarity: GearRarity.uncommon, itemLevel: 172, requiredLevel: 68, source: 'Heroic Dungeon (The Nexus)',
      stats: {'intellect': 12, 'stamina': 10, 'spellPower': 20}),

  GearItem(id: 'helm_dungeon_cos', name: 'Helm of the Cosmic Infuser',
      slot: GearSlot.head, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Cosmopolitan)',
      stats: {'agility': 42, 'intellect': 38, 'stamina': 35, 'spellPower': 40, 'armor': 440}),

  GearItem(id: 'shoulder_dungeon_cos', name: 'Spaulders of the Lost Patrol',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Halls of Stone)',
      stats: {'strength': 24, 'stamina': 30, 'armor': 680, 'dodge': 18, 'parry': 16}),

  GearItem(id: 'belt_dungeon_forge', name: 'Girdle of the Frozen Soul',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Forge of Souls)',
      stats: {'stamina': 26, 'intellect': 34, 'spellPower': 40, 'spirit': 18}),

  GearItem(id: 'feet_dungeon_pit', name: 'Pit Lord Stompers',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 80, source: 'Heroic Dungeon (Pit of Saron)',
      stats: {'strength': 20, 'stamina': 26, 'attackPower': 30, 'armor': 480, 'hit': 15}),

  GearItem(id: 'chest_dungeon_halls', name: 'Chestguard of Stone Reflection',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 80, source: 'Heroic Dungeon (Halls of Stone)',
      stats: {'agility': 26, 'stamina': 24, 'attackPower': 34, 'crit': 16, 'armor': 440}),

  GearItem(id: 'offhand_titan', name: 'Titanium Shield Wall', slot: GearSlot.offHand,
      type: GearType.armor, armorType: null,
      rarity: GearRarity.rare, itemLevel: 213, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'stamina': 24, 'intellect': 18, 'spellPower': 28, 'blockValue': 60}),

  GearItem(id: 'offhand_saronite', name: 'Saronite Bulwark', slot: GearSlot.offHand,
      type: GearType.armor, armorType: null,
      rarity: GearRarity.rare, itemLevel: 213, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'stamina': 26, 'blockValue': 70, 'block': 0.08}),

  GearItem(id: 'mh_cobalt', name: 'Cobalt Cleaver', slot: GearSlot.mainHand,
      type: GearType.weapon, weaponType: WeaponType.axe,
      rarity: GearRarity.uncommon, itemLevel: 187, requiredLevel: 68, source: 'Blacksmithing',
      stats: {'strength': 14, 'stamina': 12, 'attackPower': 28, 'crit': 10}),

  GearItem(id: 'mh_saronite_mace', name: 'Saronite Warhammer',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.mace,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'strength': 20, 'stamina': 18, 'attackPower': 42, 'hit': 14}),

  GearItem(id: 'staff_titanium', name: 'Titanium Spellblade',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'intellect': 24, 'stamina': 20, 'spellPower': 48, 'haste': 16}),

  GearItem(id: 'mh_savage_saronite', name: 'Savage Saronite Blade',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'strength': 24, 'stamina': 22, 'attackPower': 50, 'crit': 16, 'hit': 14}),

  GearItem(id: 'bow_saronite', name: 'Saronite Longbow', slot: GearSlot.ranged,
      type: GearType.weapon, weaponType: WeaponType.bow,
      rarity: GearRarity.rare, itemLevel: 187, requiredLevel: 75, source: 'Engineering',
      stats: {'agility': 16, 'stamina': 14, 'attackPower': 30, 'crit': 12}),

  GearItem(id: 'goggles_steelweave', name: 'Steelweave Goggles', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 75, source: 'Engineering',
      stats: {'agility': 28, 'intellect': 24, 'attackPower': 38, 'crit': 18, 'armor': 400}),

  GearItem(id: 'goggles_charged', name: 'Charged Visor', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.rare, itemLevel: 219, requiredLevel: 75, source: 'Engineering',
      stats: {'agility': 24, 'intellect': 26, 'spellPower': 38, 'crit': 16, 'armor': 360}),

  // ═══════════════════════════════════════
  // MORE RARE / EPIC / REPUTATION / BOE
  // ═══════════════════════════════════════
  GearItem(id: 'helm_frostworg', name: 'Frostworg\'s Helm', slot: GearSlot.head,
      type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'agility': 46, 'stamina': 40, 'attackPower': 45, 'crit': 26, 'armor': 620}),

  GearItem(id: 'chest_frostworg', name: 'Chestguard of the Frostworg',
      slot: GearSlot.chest, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'agility': 44, 'intellect': 38, 'stamina': 36, 'spellPower': 48, 'armor': 480}),

  GearItem(id: 'legs_frostwog_plate', name: 'Frostworg Legguards',
      slot: GearSlot.legs, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'strength': 36, 'stamina': 48, 'intellect': 14, 'armor': 880, 'dodge': 22, 'haste': 20}),

  GearItem(id: 'neck_emblem_frost', name: 'Pendant of the Frostwyrm',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'stamina': 30, 'intellect': 26, 'spellPower': 40, 'haste': 22}),

  GearItem(id: 'ring_emblem_crusade', name: 'Ring of the Crusader\'s Honor',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'strength': 22, 'stamina': 24, 'crit': 20, 'hit': 18}),

  GearItem(id: 'mh_sword_triumph', name: 'Blade of the Triumph',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'strength': 28, 'stamina': 24, 'attackPower': 58, 'hit': 18, 'crit': 20}),

  GearItem(id: 'mace_emblem_heal', name: 'Gavel of the Lightbringer',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.mace,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'intellect': 30, 'stamina': 24, 'spellPower': 55, 'hit': 18, 'crit': 16}),

  GearItem(id: 'staff_emblem_triumph', name: 'Staff of the Crusade',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.epic, itemLevel: 245, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'stamina': 36, 'intellect': 46, 'spellPower': 70, 'spirit': 32, 'haste': 26}),

  GearItem(id: 'shoulders_frostwolf', name: 'Frostwolf Shoulderpads',
      slot: GearSlot.shoulder, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'strength': 28, 'stamina': 36, 'armor': 700, 'dodge': 20, 'parry': 18}),

  GearItem(id: 'hands_frostwolf_caster', name: 'Frostweave Handwraps',
      slot: GearSlot.hands, type: GearType.armor, armorType: ArmorType.cloth,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'stamina': 24, 'intellect': 32, 'spellPower': 38, 'haste': 16}),

  GearItem(id: 'boots_frostwolf_leather', name: 'Boots of the Winterspring',
      slot: GearSlot.feet, type: GearType.armor, armorType: ArmorType.leather,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'agility': 28, 'stamina': 22, 'attackPower': 38, 'crit': 18, 'armor': 340}),

  GearItem(id: 'belt_frostwolf_plate', name: 'Frostwolf Girdle',
      slot: GearSlot.waist, type: GearType.armor, armorType: ArmorType.plate,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'strength': 22, 'stamina': 32, 'armor': 520, 'crit': 20, 'expertise': 16}),

  GearItem(id: 'wrist_frostwolf', name: 'Frostwyrm Bracers',
      slot: GearSlot.wrist, type: GearType.armor, armorType: ArmorType.mail,
      rarity: GearRarity.rare, itemLevel: 226, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'agility': 18, 'stamina': 16, 'attackPower': 25, 'armor': 300}),

  GearItem(id: 'neck_champions', name: 'Medallion of the Argent Champion',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Argent Crusade Exalted',
      stats: {'stamina': 26, 'intellect': 22, 'spellPower': 36, 'haste': 18}),

  GearItem(id: 'ring_champions', name: 'Signet of the Silver Crusade',
      slot: GearSlot.wrist1, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Argent Crusade Exalted',
      stats: {'agility': 20, 'stamina': 22, 'attackPower': 32, 'crit': 18}),

  GearItem(id: 'neck_wyrmrest_caster', name: "Wyrmrest's Pendant of Magic",
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Wyrmrest Accord Exalted',
      stats: {'stamina': 26, 'intellect': 22, 'spirit': 18, 'spellPower': 36}),

  GearItem(id: 'neck_kirin_mastery', name: 'Mastery of the Kirin Tor',
      slot: GearSlot.neck, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Kirin Tor Exalted',
      stats: {'stamina': 26, 'intellect': 22, 'spellPower': 36, 'haste': 18}),

  GearItem(id: 'ring_wyrmrest', name: 'Band of the Wyrmrest Accord',
      slot: GearSlot.wrist2, type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 80, source: 'Wyrmrest Accord Exalted',
      stats: {'stamina': 24, 'intellect': 20, 'spellPower': 32, 'hit': 16}),

  GearItem(id: 'ring_frostworg', name: 'Ring of the Frostworg', slot: GearSlot.wrist2,
      type: GearType.armor, armorType: null,
      rarity: GearRarity.epic, itemLevel: 232, requiredLevel: 80, source: 'Emblem of Triumph',
      stats: {'stamina': 24, 'intellect': 20, 'spellPower': 34, 'haste': 18}),

  GearItem(id: 'mh_saronite_axe', name: 'Saronite Axe of the North',
      slot: GearSlot.mainHand, type: GearType.weapon, weaponType: WeaponType.axe,
      rarity: GearRarity.rare, itemLevel: 200, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'strength': 18, 'stamina': 16, 'attackPower': 38, 'hit': 14}),

  GearItem(id: 'mh_froststeel', name: 'Froststeel Edge', slot: GearSlot.mainHand,
      type: GearType.weapon, weaponType: WeaponType.sword,
      rarity: GearRarity.rare, itemLevel: 213, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'agility': 18, 'stamina': 14, 'attackPower': 35, 'crit': 14}),

  GearItem(id: 'staff_froststeel', name: 'Froststeel Longstaff', slot: GearSlot.twoHand,
      type: GearType.weapon, weaponType: WeaponType.staff,
      rarity: GearRarity.rare, itemLevel: 213, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'stamina': 22, 'intellect': 28, 'spellPower': 45, 'spirit': 20, 'crit': 14}),

  GearItem(id: 'polearm_saronite', name: 'Saronite Polearm of the North',
      slot: GearSlot.twoHand, type: GearType.weapon, weaponType: WeaponType.polearm,
      rarity: GearRarity.epic, itemLevel: 226, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'strength': 26, 'stamina': 22, 'attackPower': 52, 'crit': 18, 'haste': 16}),

  GearItem(id: 'dagger_saronite', name: 'Saronite Shiv', slot: GearSlot.mainHand,
      type: GearType.weapon, weaponType: WeaponType.dagger,
      rarity: GearRarity.rare, itemLevel: 213, requiredLevel: 75, source: 'Blacksmithing',
      stats: {'agility': 20, 'stamina': 14, 'attackPower': 38, 'haste': 14}),
];
