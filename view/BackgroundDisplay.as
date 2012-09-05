package view 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	public class BackgroundDisplay extends Sprite
	{
		public var backgroundsArray:Array = new Array();
		
		public function BackgroundDisplay() 
		{
			
		}
		
		public function addBackground()
		{
			var sprite:Sprite = new Sprite();
			var backgroundBM:Bitmap = new Bitmap(new background());
			sprite.addChild(backgroundBM);
							
			backgroundsArray.push(sprite);
			addChild(sprite);
		}
		
		public function resize(syzeX:int, syzeY:int)
		{
			
		}
		
	}

}