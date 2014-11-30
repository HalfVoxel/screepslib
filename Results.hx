package;

@:enum
abstract AttackResult(Int) {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var InvalidTarget = -7;
    var NotInRange = -9;
    var NoBodyPart = -12;
}

@:enum
abstract MoveResult(Int) {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var Tired = -11;
    var NoBodyPart = -12;
}

@:enum
abstract PathResult(Int) {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var Tired = -11;
    var NoBodyPart = -12;
    var InvalidTarget = -7;
    var NoPath = -2;
}

@:enum
abstract ActionResult(Int) {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var InvalidTarget = -7;
    var NotInRange = -9;
    var NoBodyPart = -12;
}

@:enum
abstract SpawnError(Int) {
    var NotOwner = -1;
    var NameExists = -3;
    var Busy = -4;
    var NotEnoughEnergy = -6;
    var InvalidArgs = -10;
    var NotEnoughExtensions = -13;
}

@:enum
abstract EnergyActionResult(Int) {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var NotEnoughEnergy = -6;
    var InvalidTarget = -7;
    var NotInRange = -9;
    var NoBodyPart = -12;
}

@:enum
abstract PickupResult(Int) {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var InvalidTarget = -7;
    var Full = -8;
    var NotInRange = -9;
    var NoBodyPart = -12;    
}

@:enum
abstract TransferResult(Int) {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var NotEnoughEnergy = -6;
    var InvalidTarget = -7;
    var Full = -8;
    var NotInRange = -9;
}

@:enum
abstract EnergyResult(Int) {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var NotEnoughEnergy = -6;
}