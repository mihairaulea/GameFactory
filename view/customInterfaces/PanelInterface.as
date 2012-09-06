package view.customInterfaces 
{
	import flash.events.Event;
	import view.panels.CreditsPanel;
	import flash.display.*;
	
	
	public class PanelInterface extends Sprite
	{
		
		var panelsArray:Array = new Array();
		
		private var creditsInit:Boolean = false;
		private var aboutInit:Boolean = false;
		private var settingsInit:Boolean = false;
		private var victoryInit:Boolean = false;
		private var scoreInit:Boolean = false;
		
		public function PanelInterface() 
		{
			
		}
		
		public function init()
		{
			//
		}
		
		public function deinit()
		{
			//
		}
		
		public function addCreditsPanel(nameArray:Array, positionArray:Array, contactArray:Array = null, posX:int = 0, posY:int = 0, background:Sprite = null , separation:int = 40)
		{
			if (creditsInit == false)
			{
				var creditsPanel:CreditsPanel = new CreditsPanel();
				creditsPanel.x = posX;
				creditsPanel.y = posY;
				creditsPanel.addEventListener(CreditsPanel.REMOVE_CREDITS, removeCreditsPanel);
				addChild(creditsPanel);
				
				creditsPanel.init(nameArray, positionArray, contactArray, background, separation);
				panelsArray["Credits"] = creditsPanel;
				creditsInit = true;
			}
			else
			{
				panelsArray["Credits"].visible = true;
			}
		}
		
		public function removeCreditsPanel(e:Event)
		{
			panelsArray["Credits"].visible = false;
		}
		
		public function addAboutPanel()
		{
			
		}
		
		public function removeAboutPanel()
		{
			
		}
		
		public function addSettingsPanel()
		{
			
		}
		
		public function removeSettingsPanel()
		{
			
		}
		
		public function addVictoryPanel()
		{
			
		}
		
		public function removeVictoryPanel()
		{
			
		}
		
		public function addScorePanel()
		{
			
		}
		
		public function removeScorePanel()
		{
			
		}
		
		public function resize(sizeX:int, sizeY:int)
		{
			
		}
	}

}