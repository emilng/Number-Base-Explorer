package com.alphabeticaldisorder.nbe
{
	import com.alphabeticaldisorder.nbe.model.Model;
	import com.alphabeticaldisorder.nbe.views.ControlPanel;
	import com.alphabeticaldisorder.nbe.views.ViewPort;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import com.bit101.components.VRangeSlider;
	
	/**
	 * ...
	 * @author Emil Ng
	 */
	[SWF(width="800", height="600", frameRate="30", backgroundColor="#ffffff")]
	
	public class Main extends Sprite 
	{
		private var _model:Model;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// entry point
			_model = new Model();
			
			this.addChild(new ControlPanel(_model));
			this.addChild(new ViewPort(_model));
		}

	}
	
}