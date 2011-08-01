package com.alphabeticaldisorder.nbe
{
	import com.alphabeticaldisorder.nbe.model.Model;
	import com.alphabeticaldisorder.nbe.views.SliderPanel;
	import com.alphabeticaldisorder.nbe.views.ViewPort;
	import com.bit101.components.VRangeSlider;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Emil Ng
	 */
	[SWF(width="900", height="700", frameRate="30", backgroundColor="#ffffff")]
	
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
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align =  StageAlign.TOP_LEFT;
			_model = new Model();
			
			this.addChild(new ViewPort(_model));
			this.addChild(new SliderPanel(_model));
			
			stage.addEventListener(Event.RESIZE, resize);
			resize()
		}
		
		/**
		 * TODO: update visual elements after stage resize
		 */
		private function resize(e:Event = null):void
		{
			
		}

	}
	
}