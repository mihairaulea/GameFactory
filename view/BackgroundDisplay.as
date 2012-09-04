package view 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	public class BackgroundDisplay extends Sprite
	{
		public var backgroundsArray:Array = new Array();
		private var sprite:Sprite = new Sprite();
		
		public function BackgroundDisplay() 
		{
			
		}
		
		public function addBackground(w:int, h:int)
		{
			var backgroundBM:Bitmap = new Bitmap(new background());
			backgroundBM.x = -backgroundBM.width / 2;
			backgroundBM.y = -backgroundBM.height / 2;
			sprite.addChild(backgroundBM);
						
			sprite.x = w/2;
			sprite.y = h/2;
			
			backgroundsArray.push(sprite);
			addChild(sprite);
		}
		
		public function resize(w:int, h:int)
		{
			sprite.width = w;
			sprite.height = h;
			
		}
		
	}

}