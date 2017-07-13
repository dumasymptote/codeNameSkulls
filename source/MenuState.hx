package;

import flixel.FlxState;
import flixel.text.FlxText;
class MenuState extends FlxState{

    private var txtTitle:FlxText;

    override public function create():Void
    {
        txtTitle = new FlxText(20,0,0,"Code Named: Skulls", 22);
        txtTitle.alignment = CENTER;
        txtTitle.screenCenter(X);
        add(txtTitle);

        super.create();
    }
}