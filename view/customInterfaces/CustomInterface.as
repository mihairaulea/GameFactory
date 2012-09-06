package view.customInterfaces 
{
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import view.screens.*;
	import view.displays.*;
	
	public class CustomInterface extends Sprite
	{
		public var buttonArray:Array = new Array();
		public var notifArray:Array = new Array();
		
		
		//Mod: web - 0 /mobile portrait - 1 /mobile landscape - 2 
		var deviceMode:int = 0;
		private var resizeInit:Boolean = false;
		
		//Event variables
		public static var BUTTON_TRIGGER:String = "buttonTrigger";

		public function CustomInterface() 
		{
			
		}
		
		public function init()
		{
			
		}
		
		public function resize(sizeX, sizeY)
		{
			if (resizeInit == false)
			{
				for each(var btn:ButtonDisplay in buttonArray)
				{
					btn.posX = btn.x / sizeX;
					btn.posY = btn.y / sizeY;
				}
				for each(var notif:NotificationDisplay in notifArray)
				{
					notif.posX = notif.x / sizeX;
					notif.posY = notif.y / sizeY;
				}
				
				resizeInit = true;
			}
			
			for each(var btn:ButtonDisplay in buttonArray)
			{	
				btn.x = sizeX * btn.posX;
				btn.y = sizeY * btn.posY;
			}
			for each(var notif:NotificationDisplay in notifArray)
			{
				notif.x = sizeX * notif.posX;
				notif.y = sizeY * notif.posY;
			}
		}
		
		//{ region Buttons
		public function addBtn(tmpl:String = "Text", param:String = "Menu", posX:int = 0, posY:int = 0, glow:GlowFilter = null, shadow:DropShadowFilter = null, functionClosure:Function = null)
		{
			var button:ButtonDisplay = new ButtonDisplay();
			button.init(tmpl, param, glow, shadow);
			buttonArray.push(button);
			
			button.x = posX;
			button.y = posY;
			
			button.addEventListener(ButtonDisplay.BUTTON_CLICK, functionClosure);
			addChild(button);
			setChildIndex(button, numChildren -1);
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
		
		public function addNotif(text:String = "Notification", posX:int = 0, posY:int = 0, sizeX:int = 120, sizeY:int = 35, active:Boolean = false, glow:GlowFilter = null, shadow:DropShadowFilter = null, gradientArray:Array = null)
		{
			var notif:NotificationDisplay = new NotificationDisplay();
			notif.init(text, sizeX, sizeY, active, glow, shadow, gradientArray);
			notifArray.push(notif);
			notif.x = posX;
			notif.y = posY;
			
			notif.addEventListener(NotificationDisplay.NOTIF_CLICK, notifClickHandler);
			addChild(notif);
			setChildIndex(notif, numChildren -1);
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

	}

}