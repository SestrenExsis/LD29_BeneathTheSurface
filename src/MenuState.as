package
{
	import org.flixel.*;
	
	public class MenuState extends ScreenState
	{
		[Embed(source="../assets/images/Title.png")] public var imgTitle:Class;

		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			var _title:FlxSprite = new FlxSprite(0, 0);
			_title.loadGraphic(imgTitle);
			add(_title);
			
			var _button:FlxButton;
			add(new FlxButton(0.5 * FlxG.width + 160, 0.5 * FlxG.height + 48, "Rehearsal", onButtonRehearsal));
			add(new FlxButton(0.5 * FlxG.width + 160, 0.5 * FlxG.height + 72, "Opening Night", onButtonGame));
			if (playback.frameCount > 0)
			{
				_button = new FlxButton(0.5 * FlxG.width + 160, 0.5 * FlxG.height + 96, "Spectate", onButtonSpectator);
			}
			else
			{
				_button = new FlxButton(0.5 * FlxG.width + 160, 0.5 * FlxG.height + 96, "Spectate");
				//_button.label.color = 0x999999;
				_button.alpha = 0.35;
			}
			add(_button);
			
			var _results:Instructions = new Instructions();
			add(_results);
			_results.timer.stop();
			_results.frame = 5;
			_results.x = 16;
			_results.y = 200;
			_results.visible = true;
		}
		
		override public function update():void
		{	
			super.update();
		}
	}
	
}