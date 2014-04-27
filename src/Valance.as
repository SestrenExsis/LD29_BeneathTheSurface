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
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		override public function switchView():void
		{
			super.switchView();
			
			ID = (isFront) ? 2 : 0;
			frame = (isFront) ? 0 : 1;
		}
	}
	
}