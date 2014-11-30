package;

@:enum
abstract BodyPart(String) {
    var Move = "move";
	var Work = "work";
	var Carry = "carry";
	var Attack = "attack";
	var RangedAttack = "ranged_attack";
	var Heal = "heal";
	var Tough = "tough";
}