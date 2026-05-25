import 'package:flutter/foundation.dart';

@immutable
class MplusUpgrade {
  final String level;
  final int mainHandOffHand;
  final int bootsNeckWaistBackFingerFeetWrist;
  final int handsShoulders;
  final int ranged;
  final int trinket;
  final int legsHeadChest;
  final int totemRelic;
  final int twoHand;

  const MplusUpgrade({
    required this.level,
    required this.mainHandOffHand,
    required this.bootsNeckWaistBackFingerFeetWrist,
    required this.handsShoulders,
    required this.ranged,
    required this.trinket,
    required this.legsHeadChest,
    required this.totemRelic,
    required this.twoHand,
  });

  factory MplusUpgrade.fromJson(Map<String, dynamic> json) => MplusUpgrade(
        level: json['level'] as String,
        mainHandOffHand: json['main_hand_off_hand'] as int,
        bootsNeckWaistBackFingerFeetWrist:
            json['boots_neck_waist_back_finger_feet_wrist'] as int,
        handsShoulders: json['hands_shoulders'] as int,
        ranged: json['ranged'] as int,
        trinket: json['trinket'] as int,
        legsHeadChest: json['legs_head_chest'] as int,
        totemRelic: json['totem_relic'] as int,
        twoHand: json['two_hand'] as int,
      );

  Map<String, dynamic> toJson() => {
        'level': level,
        'main_hand_off_hand': mainHandOffHand,
        'boots_neck_waist_back_finger_feet_wrist':
            bootsNeckWaistBackFingerFeetWrist,
        'hands_shoulders': handsShoulders,
        'ranged': ranged,
        'trinket': trinket,
        'legs_head_chest': legsHeadChest,
        'totem_relic': totemRelic,
        'two_hand': twoHand,
      };
}
