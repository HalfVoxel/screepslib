using Results;

extern class Spawn extends Structure {
	public var memory : Dynamic;
	public var spawning : SpawnProgress;

	private function createCreep (body : Array<BodyPart>, ?name : String, ?memory : Dynamic) : Dynamic;
}

@:access(Spawn)
class SpawnExtender {
	public static function spawn (spawn : Spawn, body : Array<BodyPart>, ?name : String, ?memory : Dynamic) : SpawnResult {
		var res = spawn.createCreep (body, name, memory);
		if (Std.is(res, String)) {
			return Ok (cast res);
		} else {
			return Error (cast res);
		}
	}
}

enum SpawnResult {
	Error(e : SpawnError);
	Ok(name : String);
}

class SpawnProgress {
	public var name : String;
	public var needTime : Int;
	public var remainingTime : Int;
}