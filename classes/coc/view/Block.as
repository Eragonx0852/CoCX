/**
 * Coded by aimozg on 06.06.2017.
 */
package coc.view {
import classes.internals.Utils;

import fl.controls.Button;

import fl.controls.ComboBox;
import fl.controls.LabelButton;

import fl.controls.TextInput;
import fl.data.DataProvider;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.Dictionary;
import flash.utils.setTimeout;

public class Block extends Sprite {
	public static const ON_LAYOUT:String                       = 'coc$layout';
	/**
	 * Null layout. All elements' positions and sizes are NOT adjusted
	 */
						public static const LAYOUT_NONE:String = 'none';
	/**
	 * Common layout parameters:
	 * * padding{s,Horiz,Vert,Top,Right,Bottom,Left} - a distance from borders of this block to its elements
	 * * `ignoreHidden` - ignore all hidden (visible=false) elements. Default layout-dependent
	 * Common element hints:
	 * * `ignore` - ignore element
	 */
	/**
	 * Grid layout. Aligns elements in a grid of fixed cell size, fixed cell count
	 * Config:
	 * * `rows` - number of rows. Default 0 (indefinite number, keep adding more rows)
	 * * `cols` - number of columns. Default 1 (or `columns` size)
	 * * `columns` - column widths. -1: autosize, 0..1: fraction, >1: pixels. Defaults to 1.0 / rows
	 * * `setWidth`, `setHeight - should set width/height of elements. Default false
	 * * `gap` - gap between cells
	 * Hints:
	 * * `row`, `col` - 2D position in grid. Defaults to "next cell"
	 * * `setWidth`, `setHeight - should set width/height of this element. Default to layout config
	 */
	public static const LAYOUT_GRID:String = 'grid';
	private function applyGridLayout():void {
		var config:Object        = _layoutConfig;
		var ignoreHidden:Boolean = 'ignoreHidden' in config ? config['ignoreHidden'] : false;
		var rows:Number          = Utils.intOr(config["rows"], 0);
		var cols:Number          = Utils.intOr(config["cols"], 1);
		var gap:Number           = Utils.numberOr(config["gap"], 0);
		var innerw:Number        = innerWidth;
		var columns:Array        = config['columns'];
		var setcw:Boolean        = config['setWidth'];
		var setch:Boolean        = config['setHeight'];
		var debug:Boolean        = config['debug'];
		
		if (!('cols' in config) && columns) cols = columns.length;
		innerw -= gap*(cols-1);
		if (!columns || columns.length != cols) {
			columns = [];
			for (var i:int = 0; i < cols; i++) {
				columns[i] = -1; // 1fr
			}
		} else {
			columns = columns.slice();
		}
		// calculate column size
		var autocols:int = 0;
		var freespace:Number = innerw;
		// count autocols and convert fraction widths to pixels
		for (i = 0; i < cols; i++) {
			if (columns[i] < 0) {
				autocols++;
				continue;
			} else if (columns[i] <= 1) {
				// fraction
				columns[i] *= innerw;
			} // else size in pixels
			freespace -= columns[i];
		}
		// calculate autocol sizes
		if (autocols > 0) {
			for (i = 0; i < cols; i++) {
				if (columns[i] < 0) columns[i] = freespace/autocols;
			}
		}
		
		var row:int = 0;
		var col:int = 0;
		var grid:Array = [];
		var innerh:Number = innerHeight - (rows > 1 ? gap*(rows-1) : 0);
		var cellh:Number  = rows > 0 ? innerh / rows : 0;
		for (var ci:int = 0, cn:int = _container.numChildren; ci < cn; ci++) {
			var child:DisplayObject = _container.getChildAt(ci);
			var hint:Object         = _layoutHints[child] || {};
			if (hint['ignore'] || !child.visible && ignoreHidden) continue;
			if ('row' in hint && 'col' in hint) {
				row = hint['row'];
				col = hint['col'];
			}
			if (!grid[row]) grid[row] = [];
			grid[row][col] = child;
			col++;
			if (col >= cols) {
				col = 0;
				row++;
			}
		}
		var y:Number = paddingTop+gap/2;
		for (row = 0; row < grid.length; row++) {
			if (!grid[row]) continue;
			var h:Number = 0;
			var x:Number = paddingLeft;
			for (col = 0; col < columns.length; col++) {
				child = grid[row][col];
				if (child) {
					if (debug) trace("[" + row + "][" + col + "] x="+(x|0)+" y="+(y|0)+" w="+(columns[col]|0)+" h="+(cellh|0)+" "+child);
					var setw:Boolean = 'setWidth' in hint ? hint['setWidth'] : setcw;
					var seth:Boolean = 'setHeight' in hint ? hint['setHeight'] : setch;
					child.x          = x + gap / 2;
					child.y          = y;
					if (setw) {
						child.width = columns[col];
					}
					if (seth) {
						child.height = cellh;
					}
					if (debug) trace(""+child.x+" "+child.y+" "+child.width+" "+child.height);
					h = Math.max(h, child.height);
				}
				x += columns[col]+gap;
			}
			y += h+gap;
		}
	}
	/**
	 * Flow layout. Aligns size-providing elements in a row or column
	 * Config:
	 * `direction` - 'row'|'column'. Defaults to 'row'
	 * `gap` - Gap between neighbouring elements. Defaults to 2.
	 * `ignoreHidden` defaults to true
	 * `stretch` - Stretch children horizontally (column mode) or vertically (row mode). Default false
	 * Hints:
	 * `before`, `after` - Additional gap before/after that element. May be negative
	 */
	public static const LAYOUT_FLOW:String = 'flow';
	private function applyFlowLayout():void {
		var config:Object        = _layoutConfig;
		var ignoreHidden:Boolean = 'ignoreHidden' in config ? config['ignoreHidden'] : true;
		var dir:String           = config['direction'] || 'row';
		var stretch:Boolean      = config['stretch'];
		var gap:Number           = 'gap' in config ? config['gap'] : 2;
		var x:Number             = paddingLeft;
		var y:Number             = paddingTop;
		var column:Boolean       = dir === 'column';
		for (var ci:int = 0, cn:int = _container.numChildren; ci < cn; ci++) {
			var child:DisplayObject = _container.getChildAt(ci);
			var hint:Object         = _layoutHints[child] || {};
			if (hint['ignore'] || !child.visible && ignoreHidden) continue;
			var stretchChild:Boolean = Utils.valueOr(hint["stretch"], stretch);
			var before:Number = 'before' in hint ? hint['before'] : 0;
			if (column) {
				y += before;
			} else {
				x += before;
			}
			child.x          = x;
			child.y          = y;
			if (stretchChild) {
				if (column) child.width = innerWidth;
				else child.height = innerHeight;
			}
			var after:Number = 'after' in hint ? hint['after'] : 0;
			if (column) {
				y += child.height + after + gap;
			} else {
				x += child.width + after + gap;
			}
		}
	}

	private var _container:Sprite;
	private var _layoutHints:Dictionary = new Dictionary();
	private var _dirty:Boolean          = false;
	private var _layoutConfig:Object;
	private var explicitWidth:Number    = 0;
	private var explicitHeight:Number   = 0;

	public function Block(options:Object = null) {
		super();
		_layoutConfig = {type: LAYOUT_NONE};
		UIUtils.setProperties(this, options || {});
		_container = new Sprite();
		addChild(_container);
		addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		invalidateLayout();
	}

	private function get xmin():Number {
		var xmin:Number = 0;
		if (_container) {
			for (var i:int = 0, n:int = numElements; i < n; i++) {
				xmin = Math.min(xmin, getElementAt(i).x);
			}
		}
		return xmin;
	}
	private function get ymin():Number {
		var ymin:Number = 0;
		if (_container) {
			for (var i:int = 0, n:int = numElements; i < n; i++) {
				ymin = Math.min(ymin, getElementAt(i).y);
			}
		}
		return ymin;
	}
	override public function get width():Number {
		if (explicitWidth) return explicitWidth;
		return super.width-xmin;
	}
	override public function get height():Number {
		if (explicitHeight) return explicitHeight;
		return super.height-ymin;
	}
	override public function set width(value:Number):void {
		if (width != value) {
			explicitWidth = value;
			resize();
		}
	}
	override public function set height(value:Number):void {
		if (height != value) {
			explicitHeight = value;
			resize();
		}
	}
	private function resize():void {
		invalidateLayout();
		if (width > 0 || height > 0) {
			graphics.clear();
			graphics.beginFill(0, 0);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		if (width && height) {
			super.width  = width+Math.max(0,-xmin);
			super.height = height+Math.max(0,-ymin);
		}
	}
	public function get layoutConfig():Object {
		return _layoutConfig;
	}

	public function set layoutConfig(value:Object):void {
		_layoutConfig = value;
		invalidateLayout();
	}
	public function get innerWidth():Number {
		return Math.max(0, (width || explicitWidth) - paddingLeft - paddingRight);
	}
	public function get innerHeight():Number {
		return Math.max(0, (height || explicitHeight) - paddingTop - paddingBottom);
	}
	protected function addedToStage(e:Event):void {
	}

	public function addElement(e:DisplayObject, hint:Object = null):DisplayObject {
		_container.addChild(e);
		layElement(e, hint);
		return e;
	}

	public function addElementAt(e:DisplayObject, index:int, hint:Object = null):DisplayObject {
		_container.addChildAt(e, index);
		layElement(e, hint);
		return e;
	}

	public function layElement(e:DisplayObject, hint:Object):Block {
		_layoutHints[e] = hint;
		invalidateLayout();
		return this;
	}

	public function getElementIndex(e:DisplayObject):int {
		return _container.getChildIndex(e);
	}

	public function getElementByName(name:String):DisplayObject {
		return _container.getChildByName(name);
	}
	public function getElementAt(index:int):DisplayObject {
		return _container.getChildAt(index);
	}
	public function get numElements():int {
		return _container.numChildren;
	}

	public function removeElement(e:DisplayObject):void {
		_container.removeChild(e);
		delete _layoutHints[e];
		invalidateLayout();
	}

	public function invalidateLayout():void {
		if (!_dirty) {
			_dirty = true;
			setTimeout(maybeDoLayout, 0);
		}
	}

	public function get paddingTop():Number {
		var config:Object = _layoutConfig;
		if ('paddingTop' in config) return config['paddingTop'];
		if ('paddingVert' in config) return config['paddingVert'];
		if ('padding' in config) return config['padding'];
		return 0;
	}
	public function get paddingRight():Number {
		var config:Object = _layoutConfig;
		if ('paddingRight' in config) return config['paddingRight'];
		if ('paddingHoriz' in config) return config['paddingHoriz'];
		if ('padding' in config) return config['padding'];
		return 0;
	}
	public function get paddingBottom():Number {
		var config:Object = _layoutConfig;
		if ('paddingBottom' in config) return config['paddingBottom'];
		if ('paddingVert' in config) return config['paddingVert'];
		if ('padding' in config) return config['padding'];
		return 0;
	}
	public function get paddingLeft():Number {
		var config:Object = _layoutConfig;
		if ('paddingLeft' in config) return config['paddingLeft'];
		if ('paddingHoriz' in config) return config['paddingHoriz'];
		if ('padding' in config) return config['padding'];
		return 0;
	}
	public function doLayout():void {
		_dirty          = false;
		var type:String = _layoutConfig["type"];
		switch (type) {
			case "grid":
				applyGridLayout();
				break;
			case "flow":
				applyFlowLayout();
				break;
			case "none":
				break;
			default:
				trace("Unknown layout config type ", type);
				break;
		}
		dispatchEvent(new Event(ON_LAYOUT, true, true));
	}

	protected function maybeDoLayout():void {
		if (_dirty) doLayout();
	}

	/////////////////
	// Helper methods
	/////////////////

	public function addBitmapDataSprite(options:Object, hint:Object = null):BitmapDataSprite {
		var e:BitmapDataSprite = new BitmapDataSprite(options);
		addElement(e, hint);
		return e;
	}
	public function addTextField(options:Object, hint:Object = null):TextField {
		if (options is String) return addTextField({text:options});
		var e:TextField = new TextField();
		e.antiAliasType = AntiAliasType.ADVANCED;
		if ('defaultTextFormat' in options) {
			e.defaultTextFormat = UIUtils.convertTextFormat(options['defaultTextFormat']);
		}
		UIUtils.setProperties(e, options, {
			defaultTextFormat: UIUtils.convertTextFormat,
			background: UIUtils.convertColor
		});
		if (!('mouseEnabled' in options) && options['type'] != 'input') e.mouseEnabled = false;
		if (!('width' in options || 'height' in options || 'autoSize' in options)) {
			e.autoSize = TextFieldAutoSize.LEFT;
		}
		addElement(e, hint);
		return e;
	}
	
	/**
	 * Create text input
	 * @param options TextInput properties
	 * @param options.bindText [object, keyName]. On change set object[keyName]=value
	 * @param options.bindNumber [object, keyName]. On change set object[keyName]=parseFloat(value) if not NaN
	 * @param hint Layout hint
	 */
	public function addTextInput(options:Object, hint:Object = null):TextInput {
		var e:TextInput = new TextInput();
		UIUtils.setProperties(e, options);
		if ('bindText' in options) {
			var obj:Object = options.bindText[0];
			var key:String = options.bindText[1];
			e.text = obj[key];
			e.addEventListener(Event.CHANGE, function(event:Event):void {
				obj[key] = e.text;
			});
		} else if ('bindNumber' in options) {
			obj = options.bindNumber[0];
			key = options.bindNumber[1];
			e.text = obj[key];
			e.addEventListener(Event.CHANGE, function(event:Event):void {
				var value:Number = parseFloat(e.text);
				if (!isNaN(value)) obj[key] = value;
			});
		}
		addElement(e, hint);
		return e;
	}
	
	/**
	 * Create dropdown list
	 * @param options ComboBox properties
	 * @param options.items Array of objects or primitives to select from
	 * @param options.labelKey Item property name to use as label, default "label"
	 * @param options.valueKey Item property name to use as value, default "data"
	 * @param options.bindValue [object, propname]. On change set object[propname] to selected item
	 * @param hint Layout hint
	 */
	public function addComboBox(options:Object, hint:Object = null):ComboBox {
		var e:ComboBox = new ComboBox();
		UIUtils.setProperties(e, options, {value:null});
		var labelKey:String = Utils.valueOr(options["labelKey"], "label");
		var valueKey:String = Utils.valueOr(options["valueKey"], "data");
		var selectedIndex:int = 0;
		var selectedValue:*;
		var bindObject:Object;
		var bindProp:String;
		if ('bindValue' in options) {
			bindObject = options.bindValue[0];
			bindProp = options.bindValue[1];
			selectedValue = bindObject[bindProp];
		} else if ('value' in options) {
			selectedValue = options.value;
		}
		var i:int=0;
		var items:Array = [];
		for each (var item:* in options.items) {
			var entry:Object;
			if (item is Object && !(item is String) && item != null) {
				entry = {label:item[labelKey], data:item[valueKey]}
			} else {
				entry = {label:""+item, data:item}
			}
			if (entry.data == selectedValue) selectedIndex = i;
			items.push(entry);
			i++;
		}
		e.dataProvider = new DataProvider(items);
		if (bindObject) {
			e.addEventListener(Event.CHANGE, function(event:Event):void {
				event.preventDefault();
				bindObject[bindProp] = e.selectedItem.data;
			})
		}
		addElement(e, hint);
		return e;
	}

}
}
