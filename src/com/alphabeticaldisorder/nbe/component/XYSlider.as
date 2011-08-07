package com.alphabeticaldisorder.nbe.component
{
	import com.bit101.components.Component;
	import com.bit101.components.Style;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class XYSlider extends Component
	{
		protected var _handleWidth:int = 12;
		protected var _handleHeight:int = 12;
		protected var _handle:Sprite;
		protected var _back:Sprite;
		protected var _backClick:Boolean = true;
		protected var _xvalue:Number = 0;
		protected var _yvalue:Number = 0;
		protected var _xmax:Number = 100;
		protected var _xmin:Number = 0;
		protected var _ymax:Number = 100;
		protected var _ymin:Number = 0;
		protected var _tick:Number = 0.01;
		
		/**
		 * Constructor
		 * @param parent The parent DisplayObjectContainer on which to add this Slider.
		 * @param xpos The x position to place this component.
		 * @param ypos The y position to place this component.
		 * @param defaultHandler The event handling function to handle the default event for this component (change in this case).
		 */
		public function XYSlider(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
		{
			super(parent, xpos, ypos);
			if(defaultHandler != null) {
				addEventListener(Event.CHANGE, defaultHandler);
			}
		}
		
		/**
		 * Initializes the component.
		 */
		override protected function init():void
		{
			super.init();
			setSize(100, 100);
		}
		
		/**
		 * Creates and adds the child display objects of this component.
		 */
		override protected function addChildren():void
		{
			_back = new Sprite();
			_back.filters = [getShadow(2, true)];
			addChild(_back);
			
			_handle = new Sprite();
			_handle.filters = [getShadow(1)];
			_handle.addEventListener(MouseEvent.MOUSE_DOWN, onDrag);
			_handle.buttonMode = true;
			_handle.useHandCursor = true;
			addChild(_handle);
		}
		
		/**
		 * Draws the back of the slider.
		 */
		protected function drawBack():void
		{
			_back.graphics.clear();
			_back.graphics.beginFill(Style.BACKGROUND);
			_back.graphics.drawRect(0, 0, _width, _height);
			_back.graphics.endFill();
			
			if(_backClick)
			{
				_back.addEventListener(MouseEvent.MOUSE_DOWN, onBackClick);
			}
			else
			{
				_back.removeEventListener(MouseEvent.MOUSE_DOWN, onBackClick);
			}
		}
		
		/**
		 * Draws the handle of the slider.
		 */
		protected function drawHandle():void
		{	
			_handle.graphics.clear();
			_handle.graphics.beginFill(Style.BUTTON_FACE);
			_handle.graphics.drawRect(1, 1, _handleWidth - 2, _handleHeight - 2);
			_handle.graphics.endFill();
			positionHandle();
		}
		
		/**
		 * Returns a value adjusted to be within minimum and maximum.
		 */
		protected function correctValue(value:Number, min:Number, max:Number):Number
		{
			if (min > max)
			{
				return Math.min(Math.max(value, min), max);
			}
			else
			{
				return Math.min(Math.max(value, max), min);
			}
		}
		
		/**
		 * Adjusts position of handle when value, maximum or minimum have changed.
		 * TODO: Should also be called when slider is resized.
		 */
		protected function positionHandle():void
		{
			var xrange:Number = _width - _handleWidth;
			_handle.x = (_xvalue - _xmin) / (_xmax - _xmin) * xrange;
			
			var yrange:Number = _height - _handleHeight;
			_handle.y = _height - _handleHeight -(_yvalue - _ymin) / (_ymax - _ymin) * yrange;
		}
		
		
		
		
		///////////////////////////////////
		// public methods
		///////////////////////////////////
		
		/**
		 * Draws the visual ui of the component.
		 */
		override public function draw():void
		{
			super.draw();
			drawBack();
			drawHandle();
		}
		
		/**
		 * Convenience method to set the three main x parameters in one shot.
		 * @param min The minimum x value of the slider.
		 * @param max The maximum x value of the slider.
		 * @param value The x value of the slider.
		 */
		public function setXSliderParams(min:Number, max:Number, value:Number):void
		{
			this.xMinimum = min;
			this.xMaximum = max;
			this.xvalue = value;
		}
		
		/**
		 * Convenience method to set the three main x parameters in one shot.
		 * @param min The minimum x value of the slider.
		 * @param max The maximum x value of the slider.
		 * @param value The x value of the slider.
		 */
		public function setYSliderParams(min:Number, max:Number, value:Number):void
		{
			this.yMinimum = min;
			this.yMaximum = max;
			this.yvalue = value;
		}
		
		
		
		
		///////////////////////////////////
		// event handlers
		///////////////////////////////////
		
		/**
		 * Handler called when user clicks the background of the slider, causing the handle to move to that point. Only active if backClick is true.
		 * @param event The MouseEvent passed by the system.
		 */
		protected function onBackClick(event:MouseEvent):void
		{
			_handle.x = mouseX - _handleWidth / 2;
			_handle.x = Math.max(_handle.x, 0);
			_handle.x = Math.min(_handle.x, _width - _handleWidth);
			_xvalue = _handle.x / (_width - _handleWidth) * (_xmax - _xmin) + _xmin;
			
			_handle.y = mouseY - _handleHeight / 2;
			_handle.y = Math.max(_handle.y, 0);
			_handle.y = Math.min(_handle.y, _height - _handleHeight);
			_yvalue = (_height - _handleHeight - _handle.y) / (_height - _handleHeight) * (_ymax - _ymin) + _ymin;
			
			dispatchEvent(new Event(Event.CHANGE));
			
		}
		
		/**
		 * Internal mouseDown handler. Starts dragging the handle.
		 * @param event The MouseEvent passed by the system.
		 */
		protected function onDrag(event:MouseEvent):void
		{
			stage.addEventListener(MouseEvent.MOUSE_UP, onDrop);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onSlide);
			_handle.startDrag(false, new Rectangle(0, 0, _width - _handleWidth, _height - _handleHeight));
		}
		
		/**
		 * Internal mouseUp handler. Stops dragging the handle.
		 * @param event The MouseEvent passed by the system.
		 */
		protected function onDrop(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, onDrop);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onSlide);
			stopDrag();
		}
		
		/**
		 * Internal mouseMove handler for when the handle is being moved.
		 * @param event The MouseEvent passed by the system.
		 */
		protected function onSlide(event:MouseEvent):void
		{
			var oldXValue:Number = _xvalue;
			var oldYValue:Number = _yvalue;
	
			_xvalue = _handle.x / (width - _handleWidth) * (_xmax - _xmin) + _xmin;
			_yvalue = (_height - _handleHeight - _handle.y) / (height - _handleHeight) * (_ymax - _ymin) + _ymin;
			
			if((_xvalue != oldXValue) || (_yvalue != oldYValue))
			{
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
		
		
		
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		/**
		 * Sets / gets whether or not a click on the background of the slider will move the handler to that position.
		 */
		public function set backClick(b:Boolean):void
		{
			_backClick = b;
			invalidate();
		}
		public function get backClick():Boolean
		{
			return _backClick;
		}
		
		/**
		 * Sets / gets the current x value of this slider.
		 */
		public function set xvalue(v:Number):void
		{
			_xvalue = correctValue(v, _xmin, _xmax);
			positionHandle();
			
		}
		public function get xvalue():Number
		{
			return Math.round(_xvalue / _tick) * _tick;
		}

		/**
		 * Sets / gets the current y value of this slider.
		 */
		public function set yvalue(v:Number):void
		{
			_yvalue = correctValue(v, _xmin, _xmax);
			positionHandle();
			
		}
		public function get yvalue():Number
		{
			return Math.round(_yvalue / _tick) * _tick;
		}
		
		/**
		 * Gets the x value of the slider without rounding it per the tick value.
		 */
		public function get rawXValue():Number
		{
			return _xvalue;
		}
		
		/**
		 * Gets the y value of the slider without rounding it per the tick value.
		 */
		public function get rawYValue():Number
		{
			return _yvalue;
		}
		
		/**
		 * Gets / sets the maximum x value of this slider.
		 */
		public function set xMaximum(m:Number):void
		{
			_xmax = m;
			_xvalue = correctValue(_xvalue, _xmin, _xmax);
			positionHandle();
		}
		public function get xMaximum():Number
		{
			return _xmax;
		}
		
		/**
		 * Gets / sets the maximum y value of this slider.
		 */
		public function set yMaximum(m:Number):void
		{
			_ymax = m;
			_yvalue = correctValue(_yvalue, _xmin, _xmax);
			positionHandle();
		}
		public function get yMaximum():Number
		{
			return _ymax;
		}
		
		/**
		 * Gets / sets the minimum x value of this slider.
		 */
		public function set xMinimum(m:Number):void
		{
			_xmin = m;
			_xvalue = correctValue(_xvalue, _xmin, _xmax);
			positionHandle();
		}
		public function get xMinimum():Number
		{
			return _xmin;
		}

		/**
		 * Gets / sets the minimum x value of this slider.
		 */
		public function set yMinimum(m:Number):void
		{
			_ymin = m;
			_yvalue = correctValue(_yvalue, _ymin, _ymax);
			positionHandle();
		}
		public function get yMinimum():Number
		{
			return _ymin;
		}
		
		/**
		 * Gets / sets the tick value of this slider. This round the value to the nearest multiple of this number. 
		 */
		public function set tick(t:Number):void
		{
			_tick = t;
		}
		public function get tick():Number
		{
			return _tick;
		}
	}
}