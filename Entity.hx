extern class Entity implements HasStringID {
	public var id : String;
	public var room : Room;
	public var pos : RoomPosition;

	public function new ();
}