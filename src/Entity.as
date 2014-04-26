package
{
	import org.flixel.*;
	
	public class Entity extends FlxSprite
	{
		[Embed(source="../assets/images/TopPanel.png")] public var imgTopPanel:Class;
		[Embed(source="../assets/images/Seats.png")] public var imgSeats:Class;
		
		public static var currentLayer:int = 0;
		public static var currentOrder:int = 0;
		
		protected var _layer:int = 0;
		protected var _order:int = 0;
		protected var _isFront:Boolean = true;

		public function Entity(X:Number, Y:Number)
		{
			super(X, Y);
			
			_layer = currentLayer;
			_order = currentOrder;
			currentOrder++;
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		public function get isFront():Boolean
		{
			return _isFront;
		}
		
		public function get layer():int
		{
			return _layer;
		}
		
		public function set layer(Value:int):void
		{
			_layer = Value;
		}
		
		public function get order():int
		{
			return _order;
		}
		
		public function set order(Value:int):void
		{
			_order = Value;
		}
		
		public function switchView():void
		{
			_isFront = !_isFront;
		}
	}
	
}