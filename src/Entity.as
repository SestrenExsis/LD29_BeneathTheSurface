package
{
	import org.flixel.*;
	
	public class Entity extends FlxSprite
	{
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
		protected var _minStageX:Number = 0;
		protected var _maxStageX:Number = 1;
		protected var _movement:int = 0;
		protected var _moveSpeed:Number = 0;
		
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
			
			performActions();
			
			if (stageDirty)
				refreshPosition();
		}
		
		public function get viewX():Number
		{
			if (isFront)
				return (1 - _stageX);
			else
				return _stageX;
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
		
		
		public function get viewY():Number
		{
			if (isFront)
				return (1 - _stageY);
			else
				return _stageY;
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
			return MIN_SCALE + (1 - MIN_SCALE) * viewY;
		}
		
		public function refreshPosition():void
		{
			y = TOP_LEFT.y + viewY * (BOTTOM_LEFT.y - TOP_LEFT.y) - height;
			
			var _xxT:Number = viewX * TOP_WIDTH + TOP_LEFT.x - BOTTOM_LEFT.x;
			var _xxB:Number = viewX * BOTTOM_WIDTH;
			var _xx:Number = _xxB + (1 - viewY) * (_xxT - _xxB);
			
			/*if (_isFront)
			{
				var _reflectDistance:Number = _xx - 0.5 * FlxG.width;
				_xx -= _reflectDistance * 2;
			}*/
				
			x = _xx - 0.5 * width;
			
			var _newScale:Number = MIN_SCALE + (1 - MIN_SCALE) * viewY;
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
		
		public function decrease():void
		{
			_movement = -1;
		}
		
		public function increase():void
		{
			_movement = 1;
		}
		
		public function pause():void
		{
			_movement = 0;
		}
		
		public function performActions():void
		{
			if (_movement > 0)
			{
				stageX += _movement * _moveSpeed;
				if (stageX >= _maxStageX)
				{
					stageX = _maxStageX;
					_movement = 0;
				}
			}
			else if (_movement < 0)
			{
				stageX += _movement * _moveSpeed;
				if (stageX <= _minStageX)
				{
					stageX = _minStageX;
					_movement = 0;
				}
			}
		}
	}
	
}