package ;
using StringTools;

class StringResources
{
    private var strings:Map<String, String>;
    private static var commentLine = "#";
    private static var delimiter = ":";

    public function new (fileContents:String):Void
    {
        var lines = fileContents.split('\n');
        this.strings = new Map<String,String>();
        for (line in lines)
        {
            line = line.trim();
            if (line.length == 0 || line.startsWith(commentLine))
                continue;
            var index:Int = line.indexOf(delimiter);
            if (index == -1)
                throw 'Invalid line at : ${line}';
            var key = line.substring(0, index).trim();
            var field = line.substring(index + 1).trim();
            strings.set(key, field);
        }
    }
    public function get_field (key:String)
    {
        var field = this.strings.get(key);
        if(field == null)
            return key;
        else 
            return field;
    }
}