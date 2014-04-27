package
{
	import org.flixel.*;
	
	public class InfoText extends FlxText
	{
		protected var _isFront:Boolean = true;
		
		public var order:int = 0;
		public var stageY:Number = 0;
		
		public var type:String;
		
		public function InfoText(Type:String)
		{
			super(0, 0, FlxG.width);
			
			ID = Entity.currentLayer;
			order = 0;
			type = Type;
			
			if (type == "View")
			{
				setFormat(null, 16, 0xffffff, "center");
				text = (_isFront) ? "Audience's View" : "Director's View";
			}
			else
			{
				y += 16;
				setFormat(null, 16, 0xffff88, "center");
				text = "";
			}
		}
		
		override public function update():void
		{	
			super.update();
			if (type != "View")
				text = (TheaterGroup.selected == "") ? "" : "\"" + TheaterGroup.selected + "\"";
		}
		
		public function get isFront():Boolean
		{
			return _isFront;
		}
		
		public function switchView():void
		{
			_isFront = !_isFront;
			
			if (type == "View")
				text = (_isFront) ? "Audience's View" : "Director's View";
		}
	}
	
}