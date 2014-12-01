package;

extern class RoomPosition {
	public var x : Int;
	public var y : Int;
	public var roomName : String;


	public function inRangeTo (target : RoomPosition, range : Float) : Bool;

	@:overload(function(x : Int, y : Int): Bool{})
	public function isNearTo (target : RoomPosition) : Bool;

	@:overload(function(target : Entity): Bool{})
	public function getDirectionTo (target : RoomPosition) : Bool;

	@:overload(function(x : Int, y : Int): Path{})
	@:overload(function(target : Entity, ?opts : PathOptions): Path{})
	public function findPathTo (target : RoomPosition, ?opts : PathOptions) : Path;


	private function findNearest ( type : EntityType, ?opts : PathOptions) : Entity;

	public function findInRange ( type : EntityType, range : Float, ?opts : PathOptions ) : Array<Entity>;

	@:overload(function(x : Int, y : Int): Bool{})
	@:overload(function(target : Entity): Bool{})
	public function equalsTo (target : RoomPosition) : Bool;
}