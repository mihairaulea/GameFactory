package view 
{
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import view.screens.*;
	
	public class CustomInterface extends Sprite
	{
		public var buttonArray:Array = new Array();
		public var notifArray:Array = new Array();
		
		private var firstScreen:FirstScreen = new FirstScreen();
		private var backgroundDisplay:BackgroundDisplay = new BackgroundDisplay();
		
		//Mod: web - 0 /mobile portrait - 1 /mobile landscape - 2 
		var deviceMode:int = 0;
		
		//Event variables
		public static var BUTTON_TRIGGER:String = "buttonTrigger";

		public function CustomInterface() 
		{
			
		}
		
		public function init()
		{
			firstScreen.init();
		}
		
		//{ region Buttons
		public function addBtn(tmpl:int = 0, param:String = "menu", posX:int = 0, posY:int = 0, glow:GlowFilter = null, shadow:DropShadowFilter = null)
		{
			var button:ButtonDisplay = new ButtonDisplay();
			button.init(tmpl, param, glow, shadow);
			buttonArray.push(button);
			
			button.x = posX;
			button.y = posY;
			
			button.addEventListener(ButtonDisplay.BUTTON_CLICK, clickBtnHandler);
			addChild(button);
		}
		
		public function removeBtn(button:ButtonDisplay)
		{
			button.deinit();
			button.removeEventListener(ButtonDisplay.BUTTON_CLICK, clickBtnHandler);
			removeChild(button);
			//buttonArray.splice(button, 1);
		}
		
		public function disableBtn(button:ButtonDisplay)
		{
			button.removeEventListener(ButtonDisplay.BUTTON_CLICK, clickBtnHandler);
		}
		
		public function enableBtn(button:ButtonDisplay)
		{
			button.addEventListener(ButtonDisplay.BUTTON_CLICK, clickBtnHandler);
		}
		
		private function clickBtnHandler(e:Event)
		{
			dispatchEvent(new Event(BUTTON_TRIGGER));
		}
		
		//} endregion
		
		//{ region Notifications
		
		public function addNotif(text:String = "Notification", posX:int = 0, posY:int = 0, sizeX:int = 120, sizeY:int = 35, active:Boolean = false, glow:GlowFilter = null, shadow:DropShadowFilter = null)
		{
			var notif:NotificationDisplay = new NotificationDisplay();
			notif.init(text, sizeX, sizeY, active, glow, shadow);
			notifArray.push(notif);
			notif.x = posX;
			notif.y = posY;
			
			notif.addEventListener(NotificationDisplay.NOTIF_CLICK, notifClickHandler);
			addChild(notif);
		}
		
		public function removeNotif(notif:NotificationDisplay)
		{
			notif.deinit();
			notif.removeEventListener(NotificationDisplay.NOTIF_CLICK, notifClickHandler);
			removeChild(notif);
			//notifArray.splice(notif, 1);
		}
		
		private function notifClickHandler(e:Event)
		{
			trace("Notification active and clicked");
		}
		
		//} endregion

		//{ region Backgrounds
		
		public function addBackground(w:int, h:int)
		{
			backgroundDisplay.addBackground(w, h);
			addChild(backgroundDisplay);
		}
		
		//} endregion
		
		public function resizeElements(w:int, h:int)
		{
			backgroundDisplay.resize(w, h);
		}
	}

}