package;

import maybe.Maybe;

extern class Game {
	public static var creeps (default, null) : DynamicObject<Creep>;
	public static var flags (default, null) : DynamicObject<Flag>;
	public static var spawns (default, null) : DynamicObject<Spawn>;
	public static var rooms (default, null) : DynamicObject<Room>;
	public static var structures (default, null) : DynamicObject<Structure>;
	public static var time (default, null) : Int;
	public static var cpuLimit (default, null) : Float;

	@:deprecated
	public static inline function getRoom ( name : String ) : Maybe<Room> {
		return getFirstRoom ();
	}

	public static inline function getFirstRoom () : Room {
		var res = null;
		for (room in Game.rooms) {
			res = room;
		}
		return res;
	}

	public static function notify ( message : String ) : Void;
	public static function getObjectById ( id : String ) : Maybe<Entity>;
	public static function getUsedCpu ( callback : ( Float -> Void) ) : Void;
}