package
{
	import org.flixel.*;
	
	public class MenuState extends ScreenState
	{
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			var _button:FlxButton;
			add(new FlxButton(0.5 * FlxG.width - 40, 0.5 * FlxG.height - 30, "Rehearsal", onButtonGame));
			add(new FlxButton(0.5 * FlxG.width - 40, 0.5 * FlxG.height + 0, "Opening Night", onButtonGame));
			if (playback.frameCount > 0)
			{
				_button = new FlxButton(0.5 * FlxG.width - 40, 0.5 * FlxG.height + 30, "Spectate", onButtonSpectator);
			}
			else
			{
				_button = new FlxButton(0.5 * FlxG.width - 40, 0.5 * FlxG.height + 30, "Spectate");
				_button.label.color = 0x999999;
			}
			add(_button);
		}
		
		override public function update():void
		{	
			super.update();
		}
	}
	
}