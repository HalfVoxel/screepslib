package;

@:enum
abstract AttackResult(Int) to Int {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var InvalidTarget = -7;
    var NotInRange = -9;
    var NoBodyPart = -12;
}

@:enum
abstract MoveResult(Int) to Int {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var Tired = -11;
    var NoBodyPart = -12;
}

@:enum
abstract CreateFlagResult(Int) to Int {
    var Ok = 0;
    var NameExists = -3;
    var InvalidArgs = -10;
}

@:enum
abstract CreateConstructionSiteResult(Int) to Int {
    var Ok = 0;
    var InvalidTarget = -7;
    var InvalidArgs = -10;
}

@:enum
abstract PathResult(Int) to Int {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var Tired = -11;
    var NoBodyPart = -12;
    var InvalidTarget = -7;
    var NoPath = -2;
}

@:enum
abstract ActionResult(Int) to Int {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var InvalidTarget = -7;
    var NotInRange = -9;
    var NoBodyPart = -12;
}

@:enum
abstract SpawnError(Int) to Int {
    var NotOwner = -1;
    var NameExists = -3;
    var Busy = -4;
    var NotEnoughEnergy = -6;
    var InvalidArgs = -10;
    var NotEnoughExtensions = -13;
}

@:enum
abstract EnergyActionResult(Int) to Int {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var NotEnoughEnergy = -6;
    var InvalidTarget = -7;
    var NotInRange = -9;
    var NoBodyPart = -12;
}

@:enum
abstract PickupResult(Int) to Int {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var InvalidTarget = -7;
    var Full = -8;
    var NotInRange = -9;
    var NoBodyPart = -12;    
}

@:enum
abstract TransferResult(Int) to Int {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var NotEnoughEnergy = -6;
    var InvalidTarget = -7;
    var Full = -8;
    var NotInRange = -9;
}

@:enum
abstract EnergyResult(Int) to Int {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
    var NotEnoughEnergy = -6;
}

@:enum
abstract SuicideResult(Int) to Int {
    var Ok = 0;
    var NotOwner = -1;
    var Busy = -4;
}