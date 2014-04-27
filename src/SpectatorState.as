package
{
	import org.flixel.*;
	
	public class SpectatorState extends ScreenState
	{
		private var theater:TheaterGroup;
		
		public function SpectatorState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			playback.rewind();
			theater = new TheaterGroup(true);
			add(theater);
		}
		
		override public function update():void
		{	
			
			playback.playNextFrame();
			super.update();
		}
	}
	
}