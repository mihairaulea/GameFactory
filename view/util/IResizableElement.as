package view.util 
{
	import flash.display.Sprite;
	
	public interface IResizableElement 
	{
		//resizableContent:Sprite;
		
		function resizeElementsLarge();
		
		function placeElementsSmall();
		function placeElementsMedium();
		function placeElementsLarge();
		
		function centerElements(sizeX:int,sizeY:int);
	}

}