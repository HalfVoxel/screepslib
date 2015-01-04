Screeps Library for Haxe
========================

This library wraps the Screeps (http://screeps.com) API to be usable from Haxe.
This is done in order to provide a typesafe environment to code Screeps AIs as
type errors and exceptions in Screeps are critical since they can crash your whole AI while you are
not even there watching it, thus allowing enemies to crush your 'empire'.

It also creates a good inheritance structure for Screeps entities (game objects) to allow
you to more easily work with them in a typesafe way.

Some call which return either an object or null have had their return types changed to Maybe<T>.
For example RoomPosition.findClosest. Changing it to Maybe<T> forces you to check if it is null or not as not
properly handling null objects can throw exceptions (see note above).
But of course, if you really want to ignore all that safe stuff, there is a method called extract on the Maybe
object which returns the underlaying object.

Usage
=====

Clone the repo as a git submodule

```Shell
git submodule add https://github.com/HalfVoxel/screepslib.git screepslib
```

Then you can start using it basically like the original Screeps API.

```Haxe
var spawn = ...;
// Type inference allows us to gets rid of the Game. prefix
spawn.createCreep([Move,Work,Carry], "Worker1");
```

```Haxe
for (creep in Game.creeps) {
	switch (creep.pos.findClosest(DroppedEnergy)) {
	case Some(entity.option):
		creep.moveTo(entity);
	case None:
	}
}
```

```Haxe
for (creep in Game.creeps) {
	// typesafe variant of creep.pos.findClosest(...)
	// it returns Maybe<Creep> instead of Maybe<Entity>
	// which means we can attack it (we can only attack Structures and Creeps)
	switch (creep.pos.findClosestHostileCreep()) {
	case Some(enemy.option):
		creep.moveTo(enemy);
		creep.attack(enemy);
	case None:
	}
}
```

The below is an alternative version which uses a macro called @extract instead of a switch.
It slightly cleaner (and probably faster, but you never know with JITs) code.
In order to be able to use that you need to add
```Haxe
@:build(maybe.Extract.build())
```
right before your class declaration.

```Haxe
for (creep in Game.creeps) {
	// typesafe variant of creep.pos.findClosest(...)
	// it returns Maybe<Creep> instead of Maybe<Entity>
	// which means we can attack it (we can only attack Structures and Creeps)
	@extract(creep.pos.findClosestHostileCreep() => enemy) {
		creep.moveTo(enemy);
		creep.attack(enemy);
	}
}
```


You need to make sure you add -cp screepslib to your compile command, otherwise
Haxe will not find the source files.
This is what I use:
```Shell
haxe -cp screepslib -main Screeps -js out.js && pbcopy < out.js
```
The pbcopy part (osx only) copies the output to my clipboard so that
I can just run the command and then switch to a browser and paste the result into the Screeps editor.
