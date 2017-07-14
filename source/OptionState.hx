package;
import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.util.FlxAxes;

class OptionState extends FlxState
{
    private var optionsSave:FlxSave;
    private var txtOptionsTitle:FlxText;
    private var btnFullScreen:FlxButton;
    private var btnBack:FlxButton;

    override public function create():Void
    {
        optionsSave = new FlxSave();
        optionsSave.bind("options");

        txtOptionsTitle = new FlxText(0,FlxG.height / 5, 0 ,"Options", 24);
        txtOptionsTitle.alignment = CENTER;
        txtOptionsTitle.screenCenter(FlxAxes.X);
        add(txtOptionsTitle);

        btnFullScreen = new FlxButton(0,0,"Full Screen", fullScreenClick);
        btnFullScreen.screenCenter(FlxAxes.XY);
        add(btnFullScreen);

        btnBack = new FlxButton(0,FlxG.height - 30,"Back", backClick);
        btnBack.screenCenter(FlxAxes.X);
        add(btnBack);

        super.create();

    }

    private function fullScreenClick():Void
    {
        FlxG.fullscreen = !FlxG.fullscreen;
        btnFullScreen.text = FlxG.fullscreen ? "Windowed" : "Fullscreen";
        optionsSave.data.fullscreen = FlxG.fullscreen;
    }
    private function backClick():Void
    {
        FlxG.switchState(new MenuState());
    }
}