package;

import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxAxes;

class MenuSubState extends FlxSubState
{
    private var btnClose:FlxButton;
    private var btnExit:FlxButton;

    override public function create():Void
    {
        super.create();

        if(_parentState !=null)
        {
            _parentState.persistentUpdate = false;
        }

        btnExit = new FlxButton(0,0,"Main Menu", exitClick);
        btnExit.screenCenter(FlxAxes.X);
        btnExit.y = Std.int(FlxG.height * .5 - 30);
        btnExit.scale.x = btnExit.scale.y = 1.5;
        add(btnExit);

        btnClose = new FlxButton(0,0,"Close Menu", closeClick);
        btnClose.screenCenter(FlxAxes.X);
        btnClose.y = Std.int(FlxG.height * .5 + 30);
        btnClose.scale.x = btnClose.scale.y = 1.5;
        add(btnClose);
    }
    private function exitClick():Void
    {
        FlxG.switchState(new MenuState());
    }
    private function closeClick():Void
    {
        if(_parentState !=null)
        {
            _parentState.persistentUpdate = true;
        }
        close();
    }
}