package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;

class PlayState extends FlxState
{
	private var txtTitle:FlxText;
	private var player:Player;

	override public function create():Void
	{
		txtTitle = new FlxText(20,0,0,"Play State Test", 22);
        txtTitle.alignment = CENTER;
        txtTitle.screenCenter(X);
        add(txtTitle);

		player = new Player(FlxG.width / 2, FlxG.height / 2);
		add(player);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
