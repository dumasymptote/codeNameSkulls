package;

import flixel.FlxObject;
import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Exit extends FlxSprite
{
    public var nxtLevel(get,null):Int;

    public function new(X:Float=0, Y:Float=0, lvl:Int=1)
    {
        super(X,Y);
        nxtLevel = lvl;
        loadGraphic(AssetPaths.stairway__png, false, 32,16);
    }
    public function get_nxtLevel():Int
    {
        return this.nxtLevel;
    }
}