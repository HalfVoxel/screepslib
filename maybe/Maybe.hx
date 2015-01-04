package maybe;
using haxe.ds.Option;

abstract Maybe<T> (T) from T {
	inline function new (i:T) {
		this = i;
	}

	function or ( defaultValue : T ) : T {
		return this != null ? this : defaultValue;
	}

	public inline function isNone () {
		return this == null;
	}

	public inline function extract () : T {
		if (this == null) throw "Extracting null Maybe";
		return this;
	}

	@to
	public function option () : Option<T> {
		return this != null ? Some(this) : None;
	}
}