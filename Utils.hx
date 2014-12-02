using Results;

class Utils {
    public static function log ( message : String ) {
        if (Game.notify != null) {
            Game.notify (message);
        } else {
            trace (message);
        }
    }

    public static function logOnCriticalError ( v : Int ) {
    	if (v != MoveResult.Ok && v != MoveResult.Tired && v != MoveResult.NoBodyPart && v != EnergyResult.NotEnoughEnergy && v != TransferResult.NotInRange && v != TransferResult.Full ) log (Std.string(v));
    }
    public static function assertCommand ( v : Int ) {
    	if (v != 0) log (Std.string(v));
    }
}