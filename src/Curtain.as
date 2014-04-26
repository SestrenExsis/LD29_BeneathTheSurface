package
{
	import org.flixel.*;
	
	public class Curtain extends Entity
	{
		[Embed(source="../assets/images/FullCurtains.png")] public var imgFullCurtain:Class;
		
		protected var _progress:Number = 0;
		
		public var isFront:Boolean = true;
		public var isLeft:Boolean = true;

		public var minimumWidth:Number = 100;
		public var maximumWidth:Number = 320;
		public var style:int = 0;
		
		public function Curtain(X:Number, Y:Number)
		{
			super(X, Y);
			
			loadGraphic(imgFullCurtain, true, false, 320, 240);
			progress = 1;
		}
		
		public function setCurtainType(IsFront:Boolean, IsLeft:Boolean, Style:int):void
		{
			isFront = IsFront;
			isLeft = IsLeft;
			style = Style;
			var _xOrigin:Number = (isLeft) ? 0 : frameWidth;
			origin.make(_xOrigin, 0);
			
			frame = style + ((isFront) ? 0 : 3);
		}
		
		public function setDimensions(MinWidth:Number, MaxWidth:Number, Height:Number):void
		{
			minimumWidth = MinWidth;
			maximumWidth = MaxWidth;
			
			scale.y = Height / frameHeight;
		}
		
		override public function draw():void
		{
			super.draw();
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		public function get progress():Number
		{
			return _progress;
		}
		
		public function set progress(Value:Number):void
		{
			if (_progress != Value)
			{
				if (Value > 1)
					Value = 1;
				else if (Value < 0)
					Value = 0;
				_progress = Value;
				var _newWidth:Number = minimumWidth + Value * (maximumWidth - minimumWidth);
				scale.x = _newWidth / frameWidth;
			}
		}
	}
	
}