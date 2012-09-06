package view.panels 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import view.customInterfaces.CustomInterface;
	
	public class CreditsPanel extends Sprite
	{
		
		private var customInterface:CustomInterface = new CustomInterface();
		
		public static var REMOVE_CREDITS:String = "removeCredits";
		
		public function CreditsPanel() 
		{
			
		}
		
		public function init(nameArray:Array, positionArray:Array, contactArray:Array = null, background:Sprite = null, separation:int = 40)
		{
			if (nameArray.length != positionArray.length)
				//throw error
				return;
			
			if ( background != null)
				addChild(background);
			addChild(customInterface);
			
			for (var i:int = 0; i < nameArray.length; i++)
			{
				var posY:int = 100 + 2 * i * separation;
				customInterface.addNotif(nameArray[i] + ": " + positionArray[i], 0, posY, 0, 0, false, null, null, null, 10);
				if(contactArray[i] != null && contactArray[i] != "")
					customInterface.addNotif(contactArray[i], 0, (posY + separation), 0, 0, false, null, null, null, 10);
			}
			
			customInterface.addBtn("SquareGreen", "Menu", width, 0, null, null, removeCredits);
		}
	
		private function removeCredits(e:Event)
		{
			dispatchEvent(new Event(REMOVE_CREDITS));
		}
	}

}