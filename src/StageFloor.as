package
{
	import org.flixel.*;
	
	public class StageFloor extends Entity
	{
		[Embed(source="../assets/images/Stage.png")] public var imgStage:Class;

		public function StageFloor()
		{
			super(0, 270);
			
			loadGraphic(imgStage, true, false, 640, 90);
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		override public function switchView():void
		{
			_isFront = !_isFront;
			
			frame = (isFront) ? 0 : 1;
		}
	}
	
}