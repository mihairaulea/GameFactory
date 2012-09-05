package view 
{
	import flash.display.*;
	import flash.events.*;
	
	public class LevelBrowserInterface extends Sprite
	{
		private var colNum:int = 4;
		private var rowNum:int = 2;
		private var pageNum:int = 0;
		private var levelNum:int = 20;
		
		var captionArray:Array = new Array();
		var pagesArray:Array = new Array();
		
		private var currPage:int = 0;
		public var selectedLevel:int = -1;
		
		private var separation:int = 150;
		
		private var levelDisplayInterface:CustomInterface = new CustomInterface();
		
		public static var LEVEL_SELECT:String = "levelSelect";
		
		public function LevelBrowserInterface() 
		{
			
		}
		
		public function init(leftAlign:int = 0, topAlign:int = 0)
		{
			//Pentru orice caption care nu exista la levelNum adauga automat un default
			
			addChild(levelDisplayInterface);
			levelDisplayInterface.addBtn(2, "prev", 26, 233, null, null, prevClick);
			levelDisplayInterface.addBtn(2, "next", 730, 233, null, null, nextClick);
			levelDisplayInterface.buttonArray[0].visible = false;
			
			pageNum = Math.ceil(levelNum / (rowNum * colNum));
			
			for (var pagNr:int = 0; pagNr <= pageNum; pagNr++)
				pagesArray[pagNr] = new Array();
			
			createDefault();
			
			var pos:int = 0;			
			for (var i:int = 0; i < pageNum; i++) 
			{
				var currRow:int = 0;
				for (var j:int = 0; j < (colNum * rowNum); j++)
				{
					pos++;
									
					var lvlSelDispl:LevelSelDisplay = new LevelSelDisplay();
					
					if (i > 0)
						lvlSelDispl.visible = false;
						
					if (captionArray[j] != null)
					{
						lvlSelDispl.init(pos, captionArray[j]);
						lvlSelDispl.x = leftAlign + (j % colNum) * separation;
						lvlSelDispl.y = topAlign + currRow * separation;
						lvlSelDispl.addEventListener(MouseEvent.CLICK, clickHandler); 
						addChild(lvlSelDispl);
					}
					else
					{
						lvlSelDispl.init(pos, createDefault());
						lvlSelDispl.x = leftAlign + (j % colNum) * separation;
						lvlSelDispl.y = topAlign + currRow * separation;
						lvlSelDispl.addEventListener(MouseEvent.CLICK, clickHandler);
						addChild(lvlSelDispl);
					}
					
					if (((j %colNum)+1) == colNum )
						currRow++;
					
					pagesArray[i][(j % 8)] = lvlSelDispl;
					
					if (pos == levelNum)
						return;
				}
			}
			
		}
		
		private function createDefault():Sprite
		{
			var defaultCaption:Sprite = new Sprite();
			var defaultBitmap: Bitmap = new Bitmap(new levelImg());
			defaultCaption.addChild(defaultBitmap);
			return defaultCaption;
		}
		
		public function nextClick(e:Event)
		{
			levelDisplayInterface.buttonArray[0].visible = true;
			if (currPage < pageNum-1) 
			{
				for each(var lvlSel:LevelSelDisplay in pagesArray[currPage])
					lvlSel.visible = false;
				
				for each(var lvlSel:LevelSelDisplay in pagesArray[currPage+1])
					lvlSel.visible = true;
				
				currPage++;
			}
			
			if (currPage == pageNum - 1)
				levelDisplayInterface.buttonArray[1].visible = false;
		}
		
		public function prevClick(e:Event)
		{
			levelDisplayInterface.buttonArray[1].visible = true;
			if (currPage > 0) 
			{
				for each(var lvlSel:LevelSelDisplay in pagesArray[currPage])
					lvlSel.visible = false;
				
				for each(var lvlSel:LevelSelDisplay in pagesArray[currPage-1])
					lvlSel.visible = true;
				
				currPage--;
			}
	
			if (currPage == 0)
				levelDisplayInterface.buttonArray[0].visible = false;
		}
		
		private function clickHandler(e:MouseEvent)
		{
			selectedLevel = LevelSelDisplay(e.currentTarget).levelNr;
			dispatchEvent(new Event(LEVEL_SELECT));
		}
		
		public function reset()
		{
			currPage = 0;
			selectedLevel = -1;
			levelDisplayInterface.buttonArray[0].visible = false;
			for each(var lvlSel:LevelSelDisplay in pagesArray[0])
				lvlSel.visible = true;
			for (var i:int = 1; i < pageNum; i++)
				for each(var lvlSel:LevelSelDisplay in pagesArray[i])
				lvlSel.visible = false;
		}
	}

}