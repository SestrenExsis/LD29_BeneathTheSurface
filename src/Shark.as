package
{
	import org.flixel.*;
	
	public class Shark extends Entity
	{
		[Embed(source="../assets/images/Shark.png")] public var imgShark:Class;
		
		public var index:int = 0;
		
		public function Shark()
		{
			super(-1000, -1000);
			
			loadGraphic(imgShark, true, false, 60, 90);
			addAnimation("right_idle", [0]);
			addAnimation("left_idle", [3]);
			addAnimation("right_run", [0, 1], 6, true);
			addAnimation("left_run", [2, 3], 6, true);
						
			//frame = 2 * index + ((isFront) ? 0 : 1);
			stageX = 0.1;
			stageY = 0.666;
			
			_moveSpeed = 0.002;
			
			_minStageX = 0.05;
			_maxStageX = 0.95;
			
			_good = false;
			_bad = false;
		}
		
		override public function update():void
		{	
			super.update();
			
			if (_movement > 0)
				(isFront) ? play("left_run") : play("right_run");
			else if (_movement < 0)
				(isFront) ? play("right_run") : play("left_run");
			else
				(isFront) ? play("left_idle") : play("right_idle");
			
			if (visibleFrames > 0 && soundsPlayed > 0 && (stageX > 0.67 || visibleMovingFrames > 360))
			{
				_good = true;
			}
		}
		
		override protected function calcFrame():void
		{
			super.calcFrame();
			
			origin.make(0.5 * frameWidth, frameHeight);
		}
		
		override public function switchView():void
		{
			super.switchView();
		}
		
		override public function soundEffect():void
		{
			playSound(sfxDramatic, 1.0);
			soundsPlayed++;
		}
		
		override public function decrease():void
		{
			super.decrease();
			playSound(sfxToyCar, 0.5);
		}
		
		override public function increase():void
		{
			super.increase();
			playSound(sfxToyCar, 0.5);
		}
		
		override public function get good():Boolean
		{
			if (visibleFrames <= 240)
				return false;
			else if (_good)
				return true;
			else
			{
				return false;
			}
		}
	}
	
}