package
{
	import org.flixel.*;
	
	public class Entity extends FlxSprite
	{
		[Embed(source="../assets/images/TopPanel.png")] public var imgTopPanel:Class;
		[Embed(source="../assets/images/TopCurtain.png")] public var imgTopCurtain:Class;
		[Embed(source="../assets/images/Seats.png")] public var imgSeats:Class;
		[Embed(source="../assets/images/Stage.png")] public var imgStage:Class;
		
		protected var _isFront:Boolean = true;

		public function Entity(X:Number, Y:Number)
		{
			super(X, Y);
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
		}
	}
	
}