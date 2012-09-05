package view 
{
	
	import flash.display.*;
	import flash.events.*;
	import view.util.ContentManipulator;
	
	public class View extends Sprite
	{
		
		var contentManipulator:ContentManipulator = new ContentManipulator();
		
		public function View() 
		{
			
		}
		
		public function initView()
		{
			contentManipulator.init();
			addChild(contentManipulator);
		}
		
		public function resizeElements(syzeX:Number, syzeY:Number)
		{
			
		}
		
	}

}