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
    private var txtTitle:FlxText;
    private var transitionCam:FlxCamera;
    private var btnContinue:FlxButton;
    
    override public function create():Void
    {       
        transitionCam = new FlxCamera(0,0,FlxG.width, FlxG.height, 1);
        FlxG.cameras.reset(transitionCam);
        txtTitle = new FlxText(0,Std.int(FlxG.height/2),0,"Transition Test: Lvl "  + Game.gameLevel);
        txtTitle.alignment = CENTER;
        txtTitle.screenCenter(FlxAxes.X);
        add(txtTitle);

        btnContinue = new FlxButton(0,0,"Continue", continueClick);
        btnContinue.screenCenter(FlxAxes.X);
        btnContinue.y = Std.int(FlxG.height * 7 / 8) ;
        add(btnContinue); 
    }
    private function continueClick():Void
    {
        FlxG.switchState(new PlayState());
    }
}