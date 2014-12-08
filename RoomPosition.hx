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
	public function findPathTo (target : {x:Int, y:Int}, ?opts : PathOptions) : Path;


	private function findNearest ( type : EntityType, ?opts : PathOptions) : Entity;

	public function findInRange ( type : EntityType, range : Float, ?opts : PathOptions ) : Array<Entity>;

	@:overload(function(x : Int, y : Int): Bool{})
	@:overload(function(target : Entity): Bool{})
	public function equalsTo (target : RoomPosition) : Bool;

	public static inline function squaredDistance (a : {x:Int,y:Int}, b : {x:Int,y:Int}) : Int {
		return (a.x-b.x)*(a.x-b.x) + (a.y-b.y)*(a.y-b.y);
	}

	public static inline function manhattanDistance (a : {x:Int,y:Int}, b : {x:Int,y:Int}) : Int {
		return Std.int (Math.abs(a.x-b.x)) + Std.int (Math.abs(a.y-b.y));
	}

	public static inline function chebyshevDistance (a : {x:Int,y:Int}, b : {x:Int,y:Int}) : Int {
		return Std.int (Math.max (Math.abs(a.x-b.x), Math.abs(a.y-b.y)));
	}
}