package
{
	import org.flixel.*;
	
	public class TheaterGroup extends FlxGroup
	{
		public static var selected:String = "";
		
		private var stageObjects:FlxGroup;
		
		private var seats:Entity;
		private var valanceBack:Entity;
		private var valanceFront:Entity;
		private var leftBackdrop:Curtain;
		private var rightBackdrop:Curtain;
		private var stageFloor:StageFloor;
		private var frontLeftCurtain:Curtain;
		private var frontRightCurtain:Curtain;
		private var midLeftCurtain:Curtain;
		private var midRightCurtain:Curtain;
		private var wave0:Wave;
		private var wave1:Wave;
		private var wave2:Wave;
		
		public var information:InfoText;
		public var lastAction:InfoText;
		public var isAudienceView:Boolean = true;
		
		public function TheaterGroup()
		{
			super();
			
			Entity.currentLayer = 0;
			//background
			leftBackdrop = new Curtain(Curtain.BACKDROP, true);
			rightBackdrop = new Curtain(Curtain.BACKDROP, false);
			add(leftBackdrop);
			add(rightBackdrop);
			
			Entity.currentLayer = 1;
			stageFloor = new StageFloor();
			valanceBack = new Valance();
			add(valanceBack);
			add(stageFloor);
			
			Entity.currentLayer = 2;
			//curtains
			midLeftCurtain = new Curtain(Curtain.INSIDE_CURTAIN, true);
			midRightCurtain = new Curtain(Curtain.INSIDE_CURTAIN, false);
			wave0 = new Wave(0);
			wave1 = new Wave(1);
			wave2 = new Wave(2);
			frontLeftCurtain = new Curtain(Curtain.OUTSIDE_CURTAIN, true);
			frontRightCurtain = new Curtain(Curtain.OUTSIDE_CURTAIN, false);

			stageObjects = new FlxGroup();
			stageObjects.add(midLeftCurtain);
			stageObjects.add(midRightCurtain);
			stageObjects.add(wave0);
			stageObjects.add(wave1);
			stageObjects.add(wave2);
			stageObjects.add(frontLeftCurtain);
			stageObjects.add(frontRightCurtain);
			add(stageObjects);
			
			Entity.currentLayer = 3;
			//foreground
			valanceFront = new Valance();
			seats = new Entity(0, 285);
			//seats.loadGraphic(seats.imgSeats, true, false, 640, 100);
			add(valanceFront);
			//add(seats);
			
			//other
			information = new InfoText("View");
			add(information);
			lastAction = new InfoText("Action");
			add(lastAction);
			
			stageObjects.sort("order");
		}
		
		public function switchView():void
		{
			isAudienceView = !isAudienceView;
			
			callAll("switchView", true);
		}
		
		override public function preUpdate():void
		{
			super.preUpdate();
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				switchView();
				
				if (isAudienceView)
					stageObjects.members.sortOn("order", Array.NUMERIC);
				else
					stageObjects.members.sortOn("order", Array.NUMERIC | Array.DESCENDING);
			}
		}
		
		override public function update():void
		{	
			super.update();
			
			if (FlxG.keys.justPressed("C"))
			{
				if (selected == "Open Curtain")
					selected = "Close Curtain";
				else
					selected = "Open Curtain";
			}
			else if (FlxG.keys.justPressed("W"))
			{
				if (selected == "Front Waves")
					selected = "Middle Waves";
				else if (selected == "Middle Waves")
					selected = "Back Waves";
				else
					selected = "Front Waves";
			}
			else if (FlxG.keys.justPressed("S"))
				selected = "shark";
			
			if (FlxG.keys.justPressed("LEFT"))
				leftAction();
			if (FlxG.keys.justPressed("RIGHT"))
				rightAction();
			if (FlxG.keys.justPressed("DOWN"))
				downAction();
		}
		
		private function leftAction():void
		{
			if (selected == "Open Curtain")
				(isAudienceView) ? frontRightCurtain.decrease() : frontLeftCurtain.decrease();
			else if (selected == "Close Curtain")
				(isAudienceView) ? frontRightCurtain.increase() : frontLeftCurtain.increase();
			else if (selected == "Front Waves")
				(isAudienceView) ? wave2.increase() : wave2.decrease();
			else if (selected == "Middle Waves")
				(isAudienceView) ? wave1.increase() : wave1.decrease();
			else if (selected == "Back Waves")
				(isAudienceView) ? wave0.increase() : wave0.decrease();
		}
		
		private function rightAction():void
		{
			if (selected == "Open Curtain")
				(isAudienceView) ? frontLeftCurtain.decrease() : frontRightCurtain.decrease();
			else if (selected == "Close Curtain")
				(isAudienceView) ? frontLeftCurtain.increase() : frontRightCurtain.increase();
			else if (selected == "Front Waves")
				(isAudienceView) ? wave2.decrease() : wave2.increase();
			else if (selected == "Middle Waves")
				(isAudienceView) ? wave1.decrease() : wave1.increase();
			else if (selected == "Back Waves")
				(isAudienceView) ? wave0.decrease() : wave0.increase();
		}
		
		private function downAction():void
		{
			if (selected == "Open Curtain" || selected == "Close Curtain")
			{
				frontLeftCurtain.pause();
				frontRightCurtain.pause();
			}
			else if (selected == "Front Waves")
				wave2.pause();
			else if (selected == "Middle Waves")
				wave1.pause();
			else if (selected == "Back Waves")
				wave0.pause();
		}
	}
	
}