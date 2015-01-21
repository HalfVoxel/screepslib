package;

import maybe.Maybe;

extern class Game {
	public static var creeps : DynamicObject<Creep>;
    public static var flags : DynamicObject<Flag>;
    public static var spawns : DynamicObject<Spawn>;
    public static var rooms : DynamicObject<Room>;
    public static var structures : DynamicObject<Structure>;
    public static var time : Int;

    @:deprecated
    public static inline function getRoom ( name : String ) : Maybe<Room> {
    	var res = null;
    	for (room in Game.rooms) {
    		res = room;
    	}
    	return res;
    }

   	public static function notify ( message : String ) : Void;
   	public static function getObjectById ( id : String ) : Maybe<Entity>;
}