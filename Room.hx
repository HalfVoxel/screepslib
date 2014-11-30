package;

extern class Room {
	
	public function find ( type : EntityType ) : Array<Entity>;
	public function lookAt ( target : {x:Int, y:Int} ) : Array<LookResult>;
	public function findPathTo (fromPos : RoomPosition, toPos : RoomPosition, ?opts : PathOptions) : Path;
	public function makeSnapshot (?description : String) : Void;
}

class LookResult {
	public var type : FindType;
	public var terrain : TerrainType;
	public var source : Source;
	public var creep : Creep;
	public var spawn : Spawn;
}