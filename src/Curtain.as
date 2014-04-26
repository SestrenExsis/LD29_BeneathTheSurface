package
{
	import org.flixel.*;
	
	public class Curtain extends Entity
	{
		[Embed(source="../assets/images/FullCurtains.png")] public var imgFullCurtain:Class;
		
		public var type:String = "";
		
		protected var _progress:Number = 0;
		
		public var isLeft:Boolean = true;

		public var minimumWidth:Number = 100;
		public var maximumWidth:Number = 320;
		public var style:int = 0;
		
		public function Curtain(Type:String, IsLeft:Boolean)
		{
			super(0, 0);
			
			loadGraphic(imgFullCurtain, true, false, 320, 360);
			type = Type;
			
			if (type == "backdrop")
			{
				setDimensions(150, 320, 270);
				setCurtainType(IsLeft, 2);
			}
			else if (type == "far")
			{
				setDimensions(120, 320, 300);
				setCurtainType(IsLeft, 1);
			}
			else if (type == "near")
			{
				setDimensions(90, 320, 330);
				setCurtainType(IsLeft, 0);
			}
			
			progress = 1;
		}
		
		public function setCurtainType(IsLeft:Boolean, Style:int):void
		{
			_isFront = true;
			style = Style;
			isLeft = IsLeft;
			
			if (isLeft)
				x = 0;
			else
				x = 320;
			
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
		
		override public function switchView():void
		{
			_isFront = !_isFront;
			
			if (type == "backdrop")
			{
				visible = isFront;
			}
			else if (type == "far")
			{
				style = (isFront) ? 1 : 0;
				order = (isFront) ? 0 : 1000;
			}
			else if (type == "near")
			{
				style = (isFront) ? 0 : 1;
				order = (isFront) ? 1000 : 0;
			}
			frame = style + ((isFront) ? 0 : 3);
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