package com.alphabeticaldisorder.nbe.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class NumberEvent extends Event
	{
		public static const UPDATE_BASE:String = "updateBase";
		public static const UPDATE_NUMBER:String = "updateNumber";
		
		public function NumberEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}
	
}