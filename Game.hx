package;

extern class Game {
	public static var creeps : DynamicObject<Creep>;
    public static var flags : DynamicObject<Flag>;
    public static var spawns : DynamicObject<Spawn>;
    public static var structures : DynamicObject<Structure>;
    public static var time : Int;

    static function notify ( message : String ) : Void;
}