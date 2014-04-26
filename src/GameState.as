package
{
	import org.flixel.*;
	
	public class GameState extends ScreenState
	{
		private var seats:Entity;
		private var topPanel:Entity;
		private var topCurtain:Entity;
		
		private var frontLeftCurtain:Curtain;
		private var frontRightCurtain:Curtain;
		
		private var midLeftCurtain:Curtain;
		private var midRightCurtain:Curtain;
		
		private var backLeftCurtain:Curtain;
		private var backRightCurtain:Curtain;
		private var stage:Entity;
		
		public function GameState()
		{
			super();
		}
		
		override public function create():void
		{
			super.create();
			
			stage = new Entity(0, 270);
			stage.loadGraphic(stage.imgStage, true, false, 640, 90);
			stage.origin.make(0.5 * stage.frameWidth, 0);
			stage.scale.y = 0.667;
			
			backLeftCurtain = new Curtain(0, 0);
			backLeftCurtain.setDimensions(150, 320, 270);
			backLeftCurtain.setCurtainType(true, true, 2);
			backRightCurtain = new Curtain(320, 0);
			backRightCurtain.setDimensions(150, 320, 270);
			backRightCurtain.setCurtainType(true, false, 2);
			
			midLeftCurtain = new Curtain(0, 0);
			midLeftCurtain.setDimensions(125, 320, 290);
			midLeftCurtain.setCurtainType(true, true, 1);
			midRightCurtain = new Curtain(320, 0);
			midRightCurtain.setDimensions(125, 320, 290);
			midRightCurtain.setCurtainType(true, false, 1);
			
			frontLeftCurtain = new Curtain(0, 0);
			frontLeftCurtain.setDimensions(100, 320, 310);
			frontLeftCurtain.setCurtainType(true, true, 0);
			frontRightCurtain = new Curtain(320, 0);
			frontRightCurtain.setDimensions(100, 320, 310);
			frontRightCurtain.setCurtainType(true, false, 0);
			
			topCurtain = new Entity(0, 0);
			topCurtain.loadGraphic(topCurtain.imgTopCurtain, true, false, 640, 50);
			
			topPanel = new Entity(0, -20);
			topPanel.loadGraphic(topPanel.imgTopPanel);
			
			seats = new Entity(0, 260);
			seats.loadGraphic(seats.imgSeats, true, false, 640, 100);
			
			add(stage);
			
			add(backLeftCurtain);
			add(backRightCurtain);
			
			add(midLeftCurtain);
			add(midRightCurtain);
			
			add(frontLeftCurtain);
			add(frontRightCurtain);
			
			add(topCurtain);
			add(topPanel);
			add(seats);
		}
		
		override public function update():void
		{	
			super.update();
			
			if (FlxG.keys.pressed("LEFT"))
			{
				midLeftCurtain.progress -= 0.005;
				midRightCurtain.progress -= 0.005;
				frontLeftCurtain.progress -= 0.005;
				frontRightCurtain.progress -= 0.005;
			}
			else if (FlxG.keys.pressed("RIGHT"))
			{
				midLeftCurtain.progress += 0.005;
				midRightCurtain.progress += 0.005;
				frontLeftCurtain.progress += 0.005;
				frontRightCurtain.progress += 0.005;
			}
		}
	}
	
}