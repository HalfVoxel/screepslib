package;

using Results;

typedef Position = {x:Int, y:Int};

extern class Room {
	
	public static inline var Width = 50;
	public static inline var Height = 50;

	public function find ( type : EntityType ) : Array<Entity>;
	public function lookAt ( target : {x:Int, y:Int} ) : Array<LookResult>;
	public function lookAtArea ( top : Int, left : Int, bottom : Int, right : Int ) : Array< Array< Array<LookResult> > >;

	public function findPathTo (fromPos : Position, toPos : Position, ?opts : PathOptions) : Path;
	public function getPositionAt (x : Int, y : Int) : RoomPosition;

	@:overload(function(pos : Entity, ?name : String, ?color : Color): CreateFlagResult{})
	@:overload(function(pos : Position, ?name : String, ?color : Color): CreateFlagResult{})
	public function createFlag ( x : Int, y : Int, ?name : String, ?color : Color) : CreateFlagResult;

	@:overload(function(pos : Entity, type : StructureType): CreateConstructionSiteResult{})
	@:overload(function(pos : Position, type : StructureType): CreateConstructionSiteResult{})
	public function createConstructionSite ( x : Int, y : Int, type : StructureType) : CreateConstructionSiteResult;

	public function makeSnapshot (?description : String) : Void;
}

class LookResult {
	public var type : FindType;
	public var terrain : TerrainType;
	public var source : Source;
	public var creep : Creep;
	public var spawn : Spawn;
}