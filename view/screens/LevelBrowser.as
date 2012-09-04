package view.screens 
{
	
	import flash.events.Event;
	import view.CustomInterface;
	import view.util.ContentRequester;
		
	public class LevelBrowser extends ContentRequester
	{
		
		private var levelBrowserInterface:CustomInterface = new CustomInterface();
		
		private var hasBeenInit:Boolean = false;
		
		public function LevelBrowser() 
		{
			
		}
		
		override public function init(dataObject:Object)
		{
			if (hasBeenInit == false)
			{
			addChild(levelBrowserInterface);
			levelBrowserInterface.addBtn(0, "Main", 0, 0, null, null, mainClick);
			}
		}
		
		private function mainClick(e:Event)
		{
			super.requestContent(0, new Object());
		}
		
	}

}