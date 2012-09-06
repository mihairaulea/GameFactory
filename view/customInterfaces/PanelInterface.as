package view.customInterfaces 
{
	
	
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
		
		public function addCreditsPanel()
		{
			if (creditsInit == false)
			{
				
				creditsInit = true;
			}
			else
			{
				
			}
		}
		
		public function removeCreditsPanel()
		{
			
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
		
		public function resize(size X:int, sizeY:int)
		{
			
		}
	}

}