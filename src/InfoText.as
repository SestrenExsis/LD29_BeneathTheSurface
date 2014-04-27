package
{
	import org.flixel.*;
	
	public class InfoText extends FlxText
	{
		protected var _isFront:Boolean = true;
		
		public var order:int = 0;
		public var stageY:Number = 0;
		
		public function InfoText()
		{
			super(0, 0, FlxG.width, "Blah");
			
			setFormat(null, 16, 0xffffff, "center");
			ID = Entity.currentLayer;
			order = 0;
			text = (_isFront) ? "Audience's View" : "Director's View";
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		public function get isFront():Boolean
		{
			return _isFront;
		}
		
		public function switchView():void
		{
			_isFront = !_isFront;
			
			text = (_isFront) ? "Audience's View" : "Director's View";
		}
	}
	
}