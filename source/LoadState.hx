package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxAxes;
import flixel.util.FlxSave;
import flixel.group.FlxGroup.FlxTypedGroup;


class LoadState extends FlxState
{
    private var saveGroup:Array<FlxSave>;
    private var saveBtnGroup:FlxTypedGroup<FlxButton>;
    private var emptyText:FlxText;
    private var btnReturn:FlxButton;
    
    override public function create():Void
    {
        saveGroup = new Array<FlxSave>();
        saveBtnGroup = new FlxTypedGroup<FlxButton>();
        for(ii in 0...4)
        {
            saveGroup.push(new FlxSave());
            saveGroup[ii].bind("save" + ii);
            if (saveGroup[ii].data != null && saveGroup[ii].data.player != null)
            {
                saveBtnGroup.add(new FlxButton(Std.int(FlxG.height / 2), Std.int(FlxG.height / 2) - 80 + ii * 20 ,"Save" + ii, saveClick.bind(ii)));
            }  
        }
        if(saveBtnGroup.length == 0 )
        {
            emptyText = new FlxText(0,0,0,"No Valid Saves", 24);
            emptyText.screenCenter(FlxAxes.XY);
            add(emptyText);
        }
        else
        {
            add(saveBtnGroup);
        }    
        btnReturn = new FlxButton(0,0,"Return", returnClick);
        btnReturn.x = FlxG.width - btnReturn.width * 2;
        btnReturn.y = FlxG.height - btnReturn.height * 2;
        btnReturn.scale.x = btnReturn.scale.y = 1.5;
        add(btnReturn);
    }
    private function saveClick(saveIndex:Int):Void
    {

    }
    private function returnClick():Void
    {
        FlxG.switchState(new MenuState());
    }
}