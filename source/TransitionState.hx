package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.FlxCamera;

class TransitionState extends FlxState
{
    public var lvlTrans(get, null):Int;
    private var txtTitle:FlxText;
    private var transitionCam:FlxCamera;
    
    public function new(lvl:Int)
    {
        lvlTrans = lvl;
        super();
    }
    override public function create():Void
    {       
        transitionCam = new FlxCamera(0,0,FlxG.width, FlxG.height, 1);
        FlxG.cameras.reset(transitionCam);
        txtTitle = new FlxText(0,Std.int(FlxG.height/2),0,"Transition Test: Lvl "  + lvlTrans);
        txtTitle.alignment = CENTER;
        txtTitle.screenCenter(FlxAxes.X);
        add(txtTitle);
    }
    public function get_lvlTrans():Int
    {
        return this.lvlTrans;
    }
}