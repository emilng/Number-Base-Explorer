package com.alphabeticaldisorder.nbe.event 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author ...
	 */
	public class ViewPortEvent extends Event
	{
		
		public static const UPDATE_HSIZE:String = "updateHSize";
		public static const UPDATE_HGAP:String = "updateHGap";
		public static const UPDATE_VSIZE:String = "updateVSize";
		public static const UPDATE_VGAP:String = "updateVgap";
		public static const UPDATE_COL_SPACING:String = "updateColSpacing";
		public static const UPDATE_BGSHADE:String = "updateBgShade";
		
		public function ViewPortEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}
	
}