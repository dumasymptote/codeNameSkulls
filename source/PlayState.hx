package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;


class PlayState extends FlxState
{
	private var txtTitle:FlxText;
	private var player:Player;
	private var map:FlxOgmoLoader;
	private var mapWalls:FlxTilemap;

	override public function create():Void
	{
		map = new FlxOgmoLoader("assets/data/level-001.oel");
		mapWalls = map.loadTilemap(AssetPaths.tileset__png, 16,16, "Tiles");
		mapWalls.follow();
		mapWalls.setTileProperties(1, FlxObject.ANY,54);
		mapWalls.setTileProperties(56, FlxObject.NONE,5);
		add(mapWalls);
		

		txtTitle = new FlxText(20,0,0,"Play State Test", 22);
        txtTitle.alignment = CENTER;
        txtTitle.screenCenter(X);
        add(txtTitle);

		player = new Player();
		
		map.loadEntities(placeEntities, "Hero");

		add(player);
		FlxG.camera.follow(player, TOPDOWN, 1);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player, mapWalls);
	}

	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));

		switch (entityName)
		{
			case "Hero" : 
				player.x = x;
				player.y = y;
		}
	}
}
