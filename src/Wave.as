package
{
	import org.flixel.*;
	
	public class Wave extends Entity
	{
		[Embed(source="../assets/images/Waves.png")] public var imgWaves:Class;
		
		public var index:int = 0;
		
		public function Wave(Index:int)
		{
			index = Index;
			super(-1000, -1000);
			
			loadGraphic(imgWaves, true, false, 564, 85);
			origin.make(0.5 * frameWidth, frameHeight);
			
			stageX = 0.5;
			stageY = 0.34 + 0.31 * ((index + 1) / 4);
			
			if (index == 0)
			{
				FlxG.watch(this, "stageX");
				FlxG.watch(this, "stageY");
				FlxG.watch(this, "x");
				FlxG.watch(this, "y");
			}
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		override protected function calcFrame():void
		{
			super.calcFrame();
			
			origin.make(0.5 * frameWidth, frameHeight);
		}
		
		override public function switchView():void
		{
			super.switchView();
			frame = 2 * index + ((isFront) ? 0 : 1);
		}
	}
	
}