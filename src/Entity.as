package
{
	import org.flixel.*;
	
	public class Entity extends FlxSprite
	{
		//[Embed(source="../assets/images/TopPanel.png")] public var imgTopPanel:Class;
		//[Embed(source="../assets/images/Seats.png")] public var imgSeats:Class;
		
		public static const BOTTOM_LEFT:FlxPoint = new FlxPoint(0, 360);
		public static const TOP_LEFT:FlxPoint = new FlxPoint(90, 270);
		public static const BOTTOM_WIDTH:Number = 640;
		public static const TOP_WIDTH:Number = 460;
		public static const MIN_SCALE:Number = 0.75;
		
		public static var currentLayer:int = 0;
		public static var currentOrder:int = 0;
		
		public var order:int = 0;
		
		protected var _isFront:Boolean = true;
		protected var _stageX:Number = 0;
		protected var _stageY:Number = 0;
		
		public var stageDirty:Boolean = false;

		public function Entity(X:Number, Y:Number)
		{
			super(X, Y);
			
			ID = currentLayer;
			currentOrder++;
			order = currentOrder;
		}
		
		override public function update():void
		{	
			super.update();
			
			if (stageDirty)
				refreshPosition();
		}
		
		public function get stageX():Number
		{
			return _stageX;
		}
		
		//A value between 0.0 and 1.0. 0 means "stage left", 1 means "stage right"
		public function set stageX(Value:Number):void
		{
			_stageX = Value;
			stageDirty = true;
		}
		
		public function get stageY():Number
		{
			return _stageY;
		}
		
		//A value between 0.0 and 1.0. 1 means closest to the audience. 0 means furthest away.
		public function set stageY(Value:Number):void
		{
			_stageY = Value;
			stageDirty = true;
		}
		
		public function get stageScale():Number
		{
			var _yy:Number = (_isFront) ? 1 - _stageY : _stageY;
			return MIN_SCALE + (1 - MIN_SCALE) * _yy;
		}
		
		public function refreshPosition():void
		{
			var _yy:Number = (_isFront) ? 1 - _stageY : _stageY;
			y = TOP_LEFT.y + _yy * (BOTTOM_LEFT.y - TOP_LEFT.y) - height;
			
			var _xxT:Number = _stageX * TOP_WIDTH + TOP_LEFT.x - BOTTOM_LEFT.x;
			var _xxB:Number = _stageX * BOTTOM_WIDTH;
			var _xx:Number = _xxB + (1 - _yy) * (_xxT - _xxB);
			
			if (_isFront)
			{
				var _reflectDistance:Number = _xx - 0.5 * FlxG.width;
				_xx -= _reflectDistance * 2;
			}
				
			x = (_isFront) ? _xx + origin.x : _xx - origin.x;
			
			var _newScale:Number = MIN_SCALE + (1 - MIN_SCALE) * _yy;
			scale.x = (width * _newScale) / frameWidth;
			scale.y = (height * _newScale) / frameHeight;
			
			stageDirty = false;
		}
		
		public function get isFront():Boolean
		{
			return _isFront;
		}
		
		public function switchView():void
		{
			_isFront = !_isFront;
			stageDirty = true;
		}
	}
	
}