package
{
	import org.flixel.*;
	
	public class Instructions extends Entity
	{
		[Embed(source="../assets/images/Instructions.png")] public var imgInstructions:Class;
		
		public var timer:FlxTimer;
		public var index:int = 0;
		
		public function Instructions()
		{
			super(128, 64);
			
			loadGraphic(imgInstructions, true, false, 384, 128);
			frame = 0;
			visible = false;
			
			timer = new FlxTimer();
			timer.start(2, 1, onTimerNew);
		}
		
		override public function update():void
		{	
			super.update();
		}
		
		override public function draw():void
		{
			super.draw();
		}
		
		public function onTimerNew(Timer:FlxTimer):void
		{
			Timer.stop();
			Timer.start(12, 1, onTimerNext);
			index = 0;
			showScript(index);
		}
		
		public function onTimerNext(Timer:FlxTimer):void
		{
			Timer.stop();
			index++;
			if (index < maxFrames)
			{
				showScript(index);
				Timer.start(12, 1, onTimerNext);
			}
			else
			{
				visible = false;
			}
		}
		
		override public function switchView():void
		{
			
		}
		
		override public function refreshPosition():void
		{
			stageDirty = false;
		}
		
		public function showScript(Index:int):void
		{
			visible = true;
			frame = Index;
		}
	}
	
}