package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxPoint;


class Player extends FlxSprite
{
    private var speed = 200;
    private var hp(get, null):Int;
    private var maxHp(get, null):Int;
    private var mp(get, null):Int;
    private var maxMp(get, null):Int;
    private var exp(get, null):Int;
    private var lvl(get, null):Int;

    public function new(?X:Float=0, ?Y:Float=0, ?HP:Int=100, ?MAXHP:Int=100, ?MP:Int=50, ?MAXMP:Int=50,?EXP:Int=0, ?LVL:Int=1)
    {
        super(X,Y);
        //set defaults for player attributes
        hp = HP;
        maxHp = MAXHP;
        mp = MP;
        maxMp = MAXMP;
        exp = EXP;
        lvl = LVL;
        //load player shit
        loadGraphic(AssetPaths.hero_sprite__png, true, 16,16);
        setFacingFlip(FlxObject.LEFT, false, false);
        setFacingFlip(FlxObject.RIGHT, true, false);
        animation.add("d", [0,1,0,2], 6, false);
        animation.add("lr", [3,4,3,5], 6, false);
        animation.add("u", [6,7,6,8], 6, false);
        drag.x = drag.y = 1600;
        scale.x = scale.y =  1.5;
        
    }
    override public function update(elapsed:Float):Void
    {
        movement();
        super.update(elapsed);
    }
    private function movement():Void
    {
        var up, down, left, right = false;
        var moveAngle = 0;
        #if mobile
        //add checks for virtual pad or touches here
        #else
            up = FlxG.keys.anyPressed([W,UP]);
            down = FlxG.keys.anyPressed([S,DOWN]);
            left = FlxG.keys.anyPressed([A,LEFT]);
            right = FlxG.keys.anyPressed([D,RIGHT]);
        #end

        if (up && down)
            up = down = false;
        if (left && right)
            left = right = false;
        if (up || down || left || right)
        {
            if(up)
            {
                moveAngle = -90;
                if (left)
                {
                    moveAngle -= 45;
                }
                else if (right)
                {
                    moveAngle += 45;
                }
                facing = FlxObject.UP;
            }
            else if (down)
            {
                moveAngle = 90;
                if (left)
                {
                    moveAngle +=45;
                }
                else if (right)
                {
                    moveAngle -=45;
                }
                facing = FlxObject.DOWN;
            }
            else if (left)
            {
                moveAngle = 180;
                facing = FlxObject.LEFT;
            }
            else if (right)
            {
                moveAngle = 0;
                facing = FlxObject.RIGHT;
            }

            velocity.set(speed, 0);
            velocity.rotate(FlxPoint.weak(0,0), moveAngle);

            if ((velocity.x !=0 || velocity.y !=0 ) && touching == FlxObject.NONE)
            {
                switch (facing)
                {
                    case FlxObject.LEFT, FlxObject.RIGHT:
                        animation.play("lr");
                    case FlxObject.UP : 
                        animation.play("u");
                    case FlxObject.DOWN:
                        animation.play("d");
                }
            }
        }
        else if (animation.curAnim != null)
        {
            animation.curAnim.curFrame = 0;
            animation.curAnim.pause();
        }
    }
    public function get_hp():Int
        return this.hp;
    public function get_mp():Int
        return this.mp;
    public function get_maxHp():Int
        return this.maxHp;
    public function get_maxMp():Int
        return this.maxMp;
    public function get_exp():Int
        return this.exp;
    public function get_lvl():Int
        return this.lvl;
}