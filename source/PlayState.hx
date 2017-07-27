package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.FlxCamera;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var txtTitle:FlxText;
	private var map:FlxOgmoLoader;
	private var mapWalls:FlxTilemap;
	private var hud:HUD;
	private var uiCam:FlxCamera;
	private var playerCam:FlxCamera;
	private var exits:FlxTypedGroup<Exit>;

	override public function create():Void
	{
		uiCam = new FlxCamera(0, 0, FlxG.width, Math.floor(FlxG.height/25));
		playerCam = new FlxCamera(0,Math.floor(FlxG.height/25), FlxG.width,  FlxG.height - Math.floor(FlxG.height/25));
		playerCam.zoom = 2;

		map = new FlxOgmoLoader("assets/data/level-" + StringTools.lpad(Std.string(Game.gameLevel), "0", 3) + ".oel");
		mapWalls = map.loadTilemap(AssetPaths.tileset__png, 16,16, "Tiles");
		mapWalls.follow(playerCam);
		mapWalls.setTileProperties(1, FlxObject.ANY,54);
		mapWalls.setTileProperties(56, FlxObject.NONE,5);
		add(mapWalls);
		

		txtTitle = new FlxText(20,0,0,"Play State Test", 22);
        txtTitle.alignment = CENTER;
        txtTitle.screenCenter(X);
        add(txtTitle);

		exits = new FlxTypedGroup<Exit>();
		add(exits);
		
		if( Game.player == null)
		{
			Game.player = new Player();
		}

		map.loadEntities(placeEntities, "Hero");
		add(Game.player);

		// to do add a second camera that focuses on the UI so that it isnt affected by the zoom.
		hud = new HUD(Game.player.get_hp(), Game.player.get_maxHp(), Game.player.get_mp(), Game.player.get_maxMp(), Game.player.get_exp(), Game.player.get_lvl());
		add(hud);

		Game.player.camera = playerCam;
		playerCam.follow(Game.player, TOPDOWN, 1);
		FlxG.cameras.reset(uiCam);
		FlxG.cameras.add(playerCam);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(Game.player, mapWalls);
		FlxG.overlap(Game.player, exits, playerExit);
		if(FlxG.keys.pressed.ESCAPE)
		{
			FlxG.switchState(new MenuState());
		}
	}

	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));

		switch (entityName)
		{
			case "Hero" : 
				Game.player.updatePos(x, y);
			case "exit" :
				exits.add(new Exit(x, y, Std.parseInt(entityData.get("nxtLevel"))));
		}
	}
	private function playerExit(p:Player, e:Exit):Void
	{
		Game.gameLevel = e.get_nxtLevel();
		FlxG.switchState(new TransitionState());
	}
}
