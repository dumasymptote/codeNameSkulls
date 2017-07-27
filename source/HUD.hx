package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class HUD extends FlxTypedGroup<FlxSprite>
{
    private var background:FlxSprite;
    private var charHead:FlxSprite;
    private var txtHp:FlxText;
    private var txtMp:FlxText;
    private var txtExp:FlxText;
    private var txtLvl:FlxText;
    private var imgHp:FlxSprite;
    private var imgMp:FlxSprite;

    public function new(hp:Int, maxHp:Int, mp:Int, maxMp:Int, exp:Int, lvl:Int)
    {
        super();
        background = new FlxSprite().makeGraphic(FlxG.width, Math.floor(FlxG.height/25), FlxColor.BLACK); //creates a bar for the hud to go on.
        background.drawRect(0,(FlxG.height/10) - 1, FlxG.width, 1, FlxColor.WHITE); //a white bar as a separator
        charHead = new FlxSprite().loadGraphic(AssetPaths.heroFace__png, false, 16,16);
        charHead.x =charHead.y = 6;
        charHead.scale.x = charHead.scale.y = 1.5;
        txtHp = new FlxText(32, 2, 0, hp + " / " + maxHp, 8 );
        txtHp.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
        imgHp = new FlxSprite(20, txtHp.y + (txtHp.height/2) - 6, AssetPaths.health__png);
        imgHp.scale.x = imgHp.scale.y =  .75;

        add(background);
        add(charHead);
        add(imgHp);
        add(txtHp);

        //set so hud doesnt move
        forEach( function(spr:FlxSprite)
        {
            spr.scrollFactor.set(0,0);
        });
    }
}