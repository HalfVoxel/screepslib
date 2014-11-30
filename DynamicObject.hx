abstract DynamicObject<T>(Dynamic<T>) from Dynamic<T> {

	public inline function new() {
		this = {};
	}

	@:arrayAccess
	public inline function set(key:String, value:T):Void {
		//#if js
		//return untyped this[key] = value;
		//#else
		Reflect.setField(this, key, value);
		//#end
	}

	@:arrayAccess
	public inline function get(key:String):Null<T> {
		#if js
		return untyped this[key];
		#else
		return Reflect.field(this, key);
		#end
	}

	public inline function exists(key:String):Bool {
		return Reflect.hasField(this, key);
	}

	public inline function remove(key:String):Bool {
		return Reflect.deleteField(this, key);
	}

	public inline function keys():Array<String> {
		return Reflect.fields(this);
	}

	public function iterator() {
		return new DynObjIterator<T> (cast this);
	}
}

class DynObjIterator<T> {
	var keys : Array<String>;
	var obj : DynamicObject<T>;
	var i : Int = 0;

	public function new(obj : DynamicObject<T>) {
		this.keys = obj.keys();
		this.obj = obj;
	}

	public function hasNext() {
		return i < keys.length;
	}
	
	public function next() {
		return obj[keys[i++]];
	}
}