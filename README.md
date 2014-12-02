Screeps Library for Haxe
========================

This library wraps the Screeps (http://screeps.com) API to be usable from Haxe.
This is done in order to provide a typesafe environment to code Screeps AIs as
type errors and exceptions in Screeps are critical since they can crash your whole AI while you are
not even there watching it, thus allowing enemies to crush your 'empire'.

It also creates a good inheritance structure for Screeps entities (game objects) to allow
you to more easily work with them in a typesafe way.

Some extern calls are deliberately made private and only exposed through wrapper functions.
These are especially those which return an object or null (like RoomPosition.findNearest). The wrappers
usually change that to return an Option which forces you to check if it is null or not as not
properly handling null objects can throw exceptions (see note above).
But of course, if you really want to use those unsafe calls, you can use the Haxe @:access(SomeClass) meta to
gain access to all unsafe methods.

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
	case Some(entity):
		creep.moveTo(entity);
	case None:
	}
}
```

```Haxe
for (creep in Game.creeps) {
	// typesafe variant of creep.pos.findClosest(...)
	// it returns Option<Creep> instead of Option<Entity>
	// which means we can attack it (we can only attack Structures and Creeps)
	switch (creep.pos.findClosestHostileCreep()) {
	case Some(enemy):
		creep.moveTo(enemy);
		creep.attack(enemy);
	case None:
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
