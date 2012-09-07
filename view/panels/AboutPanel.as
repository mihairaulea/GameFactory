package view.panels 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import view.customInterfaces.CustomInterface;
	
	public class AboutPanel extends Sprite
	{
		private var customInterface:CustomInterface = new CustomInterface();		
		public static var REMOVE_ABOUT:String = "removeCredits";
		
		public function AboutPanel() 
		{
			
		}
		
		public function init(paragraphsArray:Array, background:Sprite = null, separation:int = 20)
		{
			if (paragraphsArray == null || paragraphsArray == "")
				// throw error
				return;
				
			if (background != null)
				addChild(background);
			addChild(customInterface);
			
			for (var i:int = 0; i < paragraphsArray.length; i++)
			{
				
			}
		}
		
		private function removeAbout()
		{
			
		}
	}

}