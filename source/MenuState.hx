package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;

class MenuState extends FlxState{

    private var txtTitle:FlxText;
    private var btnPlay:FlxButton;
    private var btnOptions:FlxButton;

    override public function create():Void
    {
        txtTitle = new FlxText(20,0,0,"Code Named: Skulls", 22);
        txtTitle.alignment = CENTER;
        txtTitle.screenCenter(X);
        add(txtTitle);

        btnPlay = new FlxButton(0,0,"Play", clickPlay);
        btnPlay.x = (FlxG.width / 2) - btnPlay.width - 10;
        btnPlay.y = FlxG.height - 20;
        add(btnPlay);

        btnOptions = new FlxButton(0,0,"Options", clickOptions);
        btnOptions.x = (FlxG.width / 2) + btnOptions.width + 10;
        btnOptions.y = FlxG.height - 20;
        add(btnOptions);


        super.create();
    }

    private function clickPlay():Void
    {
        FlxG.switchState(new PlayState());
    }
    private function clickOptions():Void
    {
        FlxG.switchState(new OptionState());
    }
}