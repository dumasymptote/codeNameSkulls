package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxAxes;


class MenuState extends FlxState{

    private var txtTitle:FlxText;
    private var btnPlay:FlxButton;
    private var btnLoad:FlxButton;
    private var btnOptions:FlxButton;
    #if desktop
    private var btnExit:FlxButton;
    #end

    override public function create():Void
    {
        txtTitle = new FlxText(20,0,0,"Code Named: Skulls", 22);
        txtTitle.alignment = CENTER;
        txtTitle.screenCenter(X);
        add(txtTitle);

        btnPlay = new FlxButton(0,0,"Play", clickPlay);
        btnPlay.screenCenter(FlxAxes.X);
        btnPlay.y =  Std.int(FlxG.height / 2 ) - btnPlay.height * 2; //minus makes it higher in the x,y coordinate grid
        btnPlay.scale.x = btnPlay.scale.y = 1.5;
        add(btnPlay);

        btnLoad = new FlxButton(0,0,"Load", clickLoad);
        btnLoad.screenCenter(FlxAxes.X);
        btnLoad.y = Std.int(FlxG.height / 2 );
        btnLoad.scale.x = btnLoad.scale.y = 1.5;
        add(btnLoad);

        btnOptions = new FlxButton(0,0,"Options", clickOptions);
        btnOptions.screenCenter(FlxAxes.X);
        btnOptions.y =  Std.int(FlxG.height / 2 )  + btnOptions.height * 2; //plus makes it lower in the x,y coordinate grid
        btnOptions.scale.x = btnOptions.scale.y = 1.5;
        add(btnOptions);

        #if desktop
        btnExit = new FlxButton(0,0,"Exit", clickExit);
        btnExit.screenCenter(FlxAxes.X);
        btnExit.y = Std.int(FlxG.height / 2 )  + btnExit.height * 4;
        btnExit.scale.x = btnExit.scale.y = 1.5;
        add(btnExit);
        #end

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
    private function clickLoad():Void
    {
        FlxG.switchState(new LoadState());
    }
    private function clickExit():Void
    { 
        #if desktop
        Sys.exit(0);
        #end
    }
}