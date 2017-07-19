package;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;


class Player extends FlxSprite
{
    private var speed = 320;

    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X,Y);
        makeGraphic(16,16,FlxColor.BLUE);
        drag.x = drag.y = 1600;
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
            }
            else if (left)
            {
                moveAngle = 180;
            }
            else if (right)
            {
                moveAngle = 0;
            }

            velocity.set(speed, 0);
            velocity.rotate(FlxPoint.weak(0,0), moveAngle);
        }
    }
}