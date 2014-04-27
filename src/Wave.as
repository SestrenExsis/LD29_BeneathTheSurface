package
{
	import org.flixel.*;
	
	public class Wave extends Entity
	{
		[Embed(source="../assets/images/Waves.png")] public var imgWaves:Class;
		
		public var index:int = 0;
		public var visibleFrames:int = 0;
		public var visibleMovingFrames:int = 0;
		protected var _good:Boolean;
		
		public function Wave(Index:int)
		{
			index = Index;
			super(-1000, -1000);
			
			loadGraphic(imgWaves, true, false, 640, 85);
			origin.make(0.5 * frameWidth, frameHeight);
			
			frame = 2 * index + ((isFront) ? 0 : 1);
			stageX = 0.5;
			stageY = 0.665 - 0.331 * ((index) / 2);
			
			_moveSpeed = 0.001;
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
		
		override public function soundEffect():void
		{
			playSound(sfxWaveCrash, 0.5);
		}
		
		public function get good():Boolean
		{
			if (visibleFrames <= 240)
				return true;
			else
			{
				if (stageX < 0.3 || stageX > 0.7)
					return false;
				else if ((visibleMovingFrames / visibleFrames) < 0.5)
					return false;
				else
					return true;
			}
		}
	}
	
}