class Utils {
    public static function log ( message : String ) {
        if (Game.notify != null) {
            Game.notify (message);
        } else {
            trace (message);
        }
    }
}