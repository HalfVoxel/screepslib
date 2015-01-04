using haxe.ds.Option;
import maybe.Maybe;

@:access(RoomPosition)
class SCExtenders {

	public static function findClosestDroppedEnergy ( obj : RoomPosition, ?opts : PathOptions) : Maybe<Energy> {
		var v : Energy = cast obj.findClosest (DroppedEnergy, opts);
		return v;
	}

	public static function findClosestActiveSource ( obj : RoomPosition, ?opts : PathOptions) : Maybe<Source> {
		var v : Source = cast obj.findClosest (SourcesActive, opts);
		return v;
	}

	public static function findClosestFriendlySpawn ( obj : RoomPosition, ?opts : PathOptions) : Maybe<Spawn> {
		var v : Spawn = cast obj.findClosest (MySpawns, opts);
		return v;
	}

	public static function findClosestHostileCreep ( obj : RoomPosition, ?opts : PathOptions) : Maybe<Creep> {
		var v : Creep = cast obj.findClosest (HostileCreeps, opts);
		return v;
	}
}