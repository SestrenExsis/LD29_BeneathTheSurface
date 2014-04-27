package
{
	import org.flixel.*;
	
	public class Curtain extends Entity
	{
		[Embed(source="../assets/images/FullCurtains.png")] public var imgFullCurtain:Class;
		
		public static const OUTSIDE_CURTAIN:int = 0;
		public static const INSIDE_CURTAIN:int = 1;
		public static const BACKDROP:int = 2;
		
		public var type:int;
		public var isLeft:Boolean = true;
		public var minWidth:Number = 0;
		public var maxWidth:Number = 320;
		
		protected var _progress:Number = 0;
		
		public function Curtain(Type:int, IsLeft:Boolean)
		{
			super(-1000, -1000);
			
			loadGraphic(imgFullCurtain, true, false, 320, 330);
			setCurtainType(Type, IsLeft);
			progress = 1;
		}
		
		public function setCurtainType(Type:int, IsLeft:Boolean):void
		{
			type = Type;
			isLeft = IsLeft;
			
			frame = type + ((isFront) ? 0 : 3);
			stageX = (isLeft) ? 0 : 1;
			
			if (type == BACKDROP)
				stageY = 0;
			else if (type == INSIDE_CURTAIN)
				stageY = 0.333;
			else
				stageY = 0.667;
			stageDirty = true;
			
			if (type == OUTSIDE_CURTAIN)
				setDimensions(90, 320)
			else if (type == INSIDE_CURTAIN)
				setDimensions(120, 120)
			else if (type == BACKDROP)
				setDimensions(320, 320);
		}
		
		public function setDimensions(MinWidth:Number, MaxWidth:Number):void
		{
			minWidth = MinWidth;
			maxWidth = MaxWidth;
		}
		
		override protected function calcFrame():void
		{
			super.calcFrame();
			
			if ((isLeft && !isFront) || (!isLeft && isFront))
				origin.x = 0;
			else
				origin.x = frameWidth;
			
			origin.y = 0;
		}
		
		override public function draw():void
		{
			super.draw();
		}
		
		override public function update():void
		{	
			super.update();
			
			if ((isLeft && !isFront) || (!isLeft && isFront))
				x = 0;
			else
				x = 320;
		}
		
		override public function switchView():void
		{
			super.switchView();
			
			if (type == BACKDROP)
				visible = isFront;
			else if (type == OUTSIDE_CURTAIN)
			{
				if (isFront)
					setDimensions(90, 320);
				else
					setDimensions(120, 320);
				//_order = (isFront) ? 0 : 10000;
			}
			else if (type == INSIDE_CURTAIN)
			{
				if (isFront)
					setDimensions(120, 120);
				else
					setDimensions(90, 90);
				//_order = (isFront) ? 10000 : 0;
			}
			
			frame = type + ((isFront) ? 0 : 3);
		}
		
		public function get progress():Number
		{
			return _progress;
		}
		
		public function set progress(Value:Number):void
		{
			if (Value > 1)
				Value = 1;
			else if (Value < 0)
				Value = 0;
			_progress = Value;
			var _newWidth:Number = minWidth + Value * (maxWidth - minWidth);
			scale.x = _newWidth / frameWidth;
		}
		
		override public function refreshPosition():void
		{
			var _yy:Number = (_isFront) ? _stageY : 1 - _stageY;
			var _newHeight:Number = 360 * (MIN_SCALE + _yy * (1 - MIN_SCALE));
			var _newWidth:Number = minWidth + progress * (maxWidth - minWidth);
			scale.x = _newWidth / frameWidth;
			scale.y = _newHeight / frameHeight;
			y = 0;
			stageDirty = false;
		}
		
		/*override public function get order():int
		{
			if (type == INSIDE_CURTAIN)
				return 0;
			else if (type == OUTSIDE_CURTAIN)
				return 1000;
			else
				return _order;
		}*/
	}
	
}