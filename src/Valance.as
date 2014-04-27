package
{
	import org.flixel.*;
	
	public class Valance extends Entity
	{
		[Embed(source="../assets/images/TopCurtain.png")] public var imgTopCurtain:Class;
		
		public function Valance()
		{
			super(0, 0);
			
			loadGraphic(imgTopCurtain, true, false, 640, 50);
			
			if (ID < 2)
				visible = !isFront;
			else
				visible = isFront;
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		override public function switchView():void
		{
			super.switchView();
			
			if (ID < 2)
				visible = !isFront;
			else
				visible = isFront;
			frame = (isFront) ? 0 : 1;
		}
		
		override public function refreshPosition():void
		{
			stageDirty = false;
		}
	}
	
}