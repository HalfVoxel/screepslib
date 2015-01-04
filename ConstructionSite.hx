using Creep;

extern class ConstructionSite extends OwnedEntity {
	public var progress : Int;
	public var progressTotal : Int;
	public var structureType : StructureType;
	public var ticksToLive : Int;
	
	public function remove () : Void;
}