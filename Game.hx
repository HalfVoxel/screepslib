package;

import maybe.Maybe;

extern class Game {
	public static var creeps : DynamicObject<Creep>;
    public static var flags : DynamicObject<Flag>;
    public static var spawns : DynamicObject<Spawn>;
    public static var structures : DynamicObject<Structure>;
    public static var time : Int;

    public static function getRoom ( name : String ) : Maybe<Room>;
   	public static function notify ( message : String ) : Void;
   	public static function getObjectById ( id : String ) : Maybe<Entity>;
}