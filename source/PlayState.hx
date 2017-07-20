package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.FlxCamera;


class PlayState extends FlxState
{
	private var txtTitle:FlxText;
	private var player:Player;
	private var map:FlxOgmoLoader;
	private var mapWalls:FlxTilemap;
	private var hud:HUD;
	private var uiCam:FlxCamera;
	private var playerCam:FlxCamera;

	override public function create():Void
	{

		uiCam = new FlxCamera(0, 0, FlxG.width, Math.floor(FlxG.height/20));
		playerCam = new FlxCamera(0,Math.floor(FlxG.height/20), FlxG.width,  FlxG.height - Math.floor(FlxG.height/20));
		playerCam.zoom = 2;

		map = new FlxOgmoLoader("assets/data/level-001.oel");
		mapWalls = map.loadTilemap(AssetPaths.tileset__png, 16,16, "Tiles");
		mapWalls.follow(playerCam);
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

		// to do add a second camera that focuses on the UI so that it isnt affected by the zoom.
		hud = new HUD(player.hp, player.maxHp, player.mp, player.maxMp, player.exp, player.lvl);
		add(hud);

		
		playerCam.follow(player, TOPDOWN, 1);
		FlxG.cameras.reset(uiCam);
		FlxG.cameras.add(playerCam);

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
