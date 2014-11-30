package;

@:enum
abstract EntityType(Int) {
    var Creeps				= 1;
	var MyCreeps			= 2;
	var HostileCreeps		= 3;
	var MySpawns			= 12;
	var HostileSpawns		= 13;
	var Sources				= 5;
	var SourcesActive		= 4;
	var DroppedEnergy		= 6;
	var Structures			= 7;
	var MyStructures		= 8;
	var HostileStructures	= 9;
	var Flags				= 10;
	var ConstructionSites	= 11;
	var ExitTop				= 14;
	var ExitRight			= 15;
	var ExitBottom			= 16;
	var ExitLeft			= 17;
}