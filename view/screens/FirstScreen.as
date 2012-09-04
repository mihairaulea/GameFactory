package view.screens 
{

	import flash.display.*;
	import flash.events.Event;
	import view.*;
	import view.util.ContentRequester;
	
	public class FirstScreen extends ContentRequester
	{
		
		
		private var backgroundDisplay:BackgroundDisplay = new BackgroundDisplay();
		private var firstScreenInterface:CustomInterface = new CustomInterface();
		
		private var hasBeenInit:Boolean = false;
		
		public function FirstScreen() 
		{
			
		}
		
		override public function init(initData:Object)
		{
			if (hasBeenInit == false)
			{
			//addBackground(stage.stageWidth.stage.stageHeight);
			addChild(firstScreenInterface);
			firstScreenInterface.addBtn(0, "Level browser", 0, 0, null, null, levelBrowserClick);
			hasBeenInit = true;
			}
		}
		
		private function levelBrowserClick(e:Event)
		{
			trace("level browser click!");
			super.requestContent(1, new Object());
		}
		
		//{ region Backgrounds
		
		public function addBackground(w:Number, h:Number)
		{
			backgroundDisplay.addBackground(w, h);
			addChildAt(backgroundDisplay, 0);
		}
		
		//} endregion
		
		public function resizeElements(w:Number, h:Number)
		{
			backgroundDisplay.resize(w, h);
		}		
		
	}

}