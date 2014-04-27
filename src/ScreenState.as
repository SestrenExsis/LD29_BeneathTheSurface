package
{
	import org.flixel.*;
	import org.flixel.system.FlxReplay;
	
	public class ScreenState extends FlxState
	{
		public var playback:FlxReplay;
		public function ScreenState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			FlxG.flash(0xff000000, 0.5);
			
			playback = new FlxReplay();
		}
		
		override public function update():void
		{	
			super.update();
		}
	}
	
}