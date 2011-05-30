package com.alphabeticaldisorder.nbe.views 
{
	import com.alphabeticaldisorder.nbe.model.Model;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import com.bit101.components.HUISlider;
	/**
	 * ...
	 * @author Emil Ng
	 */
	public class ControlPanel extends Sprite
	{
		
		private var _baseSlider:HUISlider;
		private var _numSlider:HUISlider;
		private var _hsizeSlider:HUISlider;
		private var _hgapSlider:HUISlider;
		private var _vsizeSlider:HUISlider;
		private var _vgapSlider:HUISlider;
		private var _columnSpacingSlider:HUISlider;
		private var _bgShadeSlider:HUISlider;
		private var _model:Model;
		
		public function ControlPanel(model:Model) 
		{
			_model = model;
			init();
		}
		
		private function init():void {
			_baseSlider = new HUISlider(this, 10, 0, "Base", updateBase);
			_baseSlider.width = 500;
			_baseSlider.setSliderParams(2, 254, _model.base);
			
			_numSlider = new HUISlider(this, 10, 20, "Number", updateNumber);
			_numSlider.width = 500;
			_numSlider.setSliderParams(0, 10000, _model.number);
			
			_hsizeSlider = new HUISlider(this, 500, 0, "HSize", updateHSize);
			_hsizeSlider.width = 160;
			_hsizeSlider.setSliderParams(1, 40, _model.hsize);
			
			_hgapSlider = new HUISlider(this, 660, 0, "HGap", updateHGap);
			_hgapSlider.width = 150;
			_hgapSlider.setSliderParams(0, 20, _model.hgap);
			
			_vsizeSlider = new HUISlider(this, 500, 20, "VSize", updateVSize);
			_vsizeSlider.width = 160;
			_vsizeSlider.setSliderParams(1, 40, _model.vsize);
			
			_vgapSlider = new HUISlider(this, 660, 20, "VGap", updateVGap);
			_vgapSlider.width = 150;
			_vgapSlider.setSliderParams(0, 20, _model.vgap);
			
			_columnSpacingSlider = new HUISlider(this, 640, 40, "Col Spacing", updateColumnSpacing);
			_columnSpacingSlider.width = 170;
			_columnSpacingSlider.setSliderParams(0, 30, _model.colSpacing);
			
			_bgShadeSlider = new HUISlider(this, 500, 40, "BG Shade", updateBgShade);
			_bgShadeSlider.width = 150;
			_bgShadeSlider.setSliderParams(0, 254, _model.bgShade);
		}
		
		private function updateBase(evt:Event):void {
			_model.base = (evt.target as HUISlider).value;
		}
		
		private function updateNumber(evt:Event):void {
			_model.number = (evt.target as HUISlider).value;
		}
		
		private function updateHSize(evt:Event):void {
			_model.hsize = (evt.target as HUISlider).value;
		}
		
		private function updateHGap(evt:Event):void {
			_model.hgap = (evt.target as HUISlider).value;
		}
		
		private function updateVSize(evt:Event):void {
			_model.vsize = (evt.target as HUISlider).value;
		}
		
		private function updateVGap(evt:Event):void {
			_model.vgap = (evt.target as HUISlider).value;
		}
		
		private function updateColumnSpacing(evt:Event):void {
			_model.colSpacing = (evt.target as HUISlider).value;
		}
		
		private function updateBgShade(evt:Event):void {
			_model.bgShade = (evt.target as HUISlider).value;
		}
	}

}