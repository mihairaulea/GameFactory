package view 
{
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class LevelSelDisplay extends Sprite
	{
		var sprite:Sprite = new Sprite();
		
		
		public function LevelSelDisplay() 
		{
			
		}
		
		public function init(number:int, pic:Sprite)
		{
			addEventListener(MouseEvent.CLICK, clickHandler);
			
			var background:Bitmap = new Bitmap(new levelSelectBack());
			sprite.addChild(background);
			
			sprite.addChild(pic);
			
			var levelNumber:Bitmap = new Bitmap(new levelSelectFront());
			sprite.addChild(levelNumber);
			
			
			addNumber(number);
		}
		
		private function addNumber(number:int)
		{
			
		}
		
		private function clickHandler(e:MouseEvent)
		{
			dispatchEvent(new Event(BUTTON_CLICK));
		}
	}

}