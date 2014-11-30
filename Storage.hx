class Storage
{
    public static var Memory(get, never) : DynamicObject<Dynamic>;
    inline static function get_Memory() : DynamicObject<Dynamic> {
    	return untyped __js__("Memory");
    }
}