package;

using Results;

extern class Creep extends HPEntity {
	/*public var id : String;
	public var name : String;
	public var owner : String;
	public var room : Room;
	public var pos : RoomPosition;
	public var my : Bool;*/
	public var memory : Dynamic;	
	public var body : Array<BodyPart>;
	public var energy : Int;
	public var energyCapacity : Int;
	public var ticksToLive : Int;
	public var fatigue : Int;

	@:overload(function(target : Structure): AttackResult{})
	public function attack(target : Creep) : AttackResult;

	@:overload(function(target : Spawn): AttackResult{})
	@:overload(function(target : Structure): AttackResult{})
	public function rangedAttack (target : Creep) : AttackResult;

	public function build(target : ConstructionSite) : EnergyActionResult;

	@:overload(function(): EnergyResult{})
	public function dropEnergy(amount : Int) : EnergyResult;

	public function getActiveBodyparts(part : BodyPart) : Int;

	public function harvest (target : Source) : EnergyActionResult;

	public function heal ( target : Creep ) : ActionResult;

	public function move ( direction : Direction ) : MoveResult;

	@:overload(function(target : Entity, ?opts : PathOptions): PathResult{})
	@:overload(function(target : {x:Int, y:Int}, ?opts : PathOptions): PathResult{})
	public function moveTo ( x : Int, y : Int, ?opts : PathOptions) : PathResult;

	public function pickup (target : Energy) : PickupResult;

	@:overload(function(target : Structure): EnergyActionResult{})
	public function repair (target : Spawn) : EnergyActionResult;

	public function suicide () : SuicideResult;
	
	@:overload(function(target : Spawn, ?amount: Int): TransferResult{})
	@:overload(function(target : Structure, ?amount: Int): TransferResult{})
	public function transferEnergy (target : Creep, ?amount: Int) : TransferResult;

	public function new (){}
	//public function attack(target : Structure) : AttackResult;
}