package
{
	import org.flixel.*;
	
	public class Seats extends Entity
	{
		[Embed(source="../assets/images/Seats.png")] public var imgSeat:Class;

		public function Seats()
		{
			super(0, 290);
			
			loadGraphic(imgSeat, true, false, 640, 100);
			stageY = 1;
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		override public function switchView():void
		{
			super.switchView();
			
			if (ID < 2)
			{
				visible = !isFront;
				y = 190;
				scale.x = scale.y = 0.65;
			}
			else
			{
				visible = isFront;
				y = 290;
				scale.x = scale.y = 1;
			}
			
			frame = (isFront) ? 0 : 1;
		}
		
		override public function refreshPosition():void
		{
			stageDirty = false;
		}
	}
	
}