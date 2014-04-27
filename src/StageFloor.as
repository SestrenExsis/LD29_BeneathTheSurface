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
			stageY = 1;
			visible = false;
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		override public function switchView():void
		{
			super.switchView();
			
			frame = (isFront) ? 0 : 1;
		}
		
		override public function refreshPosition():void
		{
			stageDirty = false;
		}
	}
	
}