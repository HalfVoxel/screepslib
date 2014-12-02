package;

using haxe.ds.Option;

extern class Game {
	public static var creeps : DynamicObject<Creep>;
    public static var flags : DynamicObject<Flag>;
    public static var spawns : DynamicObject<Spawn>;
    public static var structures : DynamicObject<Structure>;
    public static var time : Int;

    private static function getRoom ( name : String ) : Room;
   	public static function notify ( message : String ) : Void;
   	public static function getObjectById ( id : String ) : Entity;
   	
    public static inline function getRoomByName ( name : String ) : Option<Room> {
		var v = getRoom(name);
		return v != null ? Some(v) : None;
	}
}