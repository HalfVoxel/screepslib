using haxe.ds.Option;

@:access(RoomPosition)
class SCExtenders {

	public static function findClosest ( obj : RoomPosition, type : EntityType, ?opts : PathOptions) : Option<Entity> {
		var v = obj.findNearest (type, opts);
		return v != null ? Some(v) : None;
	}

	public static function findClosestDroppedEnergy ( obj : RoomPosition, ?opts : PathOptions) : Option<Energy> {
		var v : Energy = cast obj.findNearest (DroppedEnergy, opts);
		return v != null ? Some(v) : None;
	}

	public static function findClosestActiveSource ( obj : RoomPosition, ?opts : PathOptions) : Option<Source> {
		var v : Source = cast obj.findNearest (SourcesActive, opts);
		return v != null ? Some(v) : None;
	}

	public static function findClosestFriendlySpawn ( obj : RoomPosition, ?opts : PathOptions) : Option<Spawn> {
		var v : Spawn = cast obj.findNearest (MySpawns, opts);
		return v != null ? Some(v) : None;
	}

	public static function findClosestHostileCreep ( obj : RoomPosition, ?opts : PathOptions) : Option<Creep> {
		var v : Creep = cast obj.findNearest (HostileCreeps, opts);
		return v != null ? Some(v) : None;
	}
}