// vim: ts=4:sw=4:nu:fdc=4:nospell
/*global Ext */
/**
 * @class Ext.ux.form.LovCombo
 * @extends Ext.form.ComboBox
 *
 * Simple list of values Combo
 *
 * @author    Ing. Jozef Sakálo?
 * @copyright (c) 2008, by Ing. Jozef Sakálo?
 * @version   1.3
 * @date      <ul>
 * <li>16. April 2008</li>
 * <li>2. February 2009</li>
 * </ul>
 * @revision  $Id: Ext.ux.form.LovCombo.js 733 2009-06-26 07:29:07Z jozo $
 *
 * @license Ext.ux.form.LovCombo.js is licensed under the terms of the Open Source
 * LGPL 3.0 license. Commercial use is permitted to the extent that the 
 * code/component(s) do NOT become part of another Open Source or Commercially
 * licensed development library or toolkit without explicit permission.
 * 
 * <p>License details: <a href="http://www.gnu.org/licenses/lgpl.html"
 * target="_blank">http://www.gnu.org/licenses/lgpl.html</a></p>
 *
 * @forum     32692
 * @demo      http://lovcombo.extjs.eu
 * @download  
 * <ul>
 * <li><a href="http://lovcombo.extjs.eu/lovcombo.tar.bz2">lovcombo.tar.bz2</a></li>
 * <li><a href="http://lovcombo.extjs.eu/lovcombo.tar.gz">lovcombo.tar.gz</a></li>
 * <li><a href="http://lovcombo.extjs.eu/lovcombo.zip">lovcombo.zip</a></li>
 * </ul>
 *
 * @donate
 * <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
 * <input type="hidden" name="cmd" value="_s-xclick">
 * <input type="hidden" name="hosted_button_id" value="3430419">
 * <input type="image" src="https://www.paypal.com/en_US/i/btn/x-click-butcc-donate.gif" 
 * border="0" name="submit" alt="PayPal - The safer, easier way to pay online.">
 * <img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
 * </form>
 */
// 增加多选框MultiCombo
if ('function' !== typeof RegExp.escape) {
	RegExp.escape = function(s) {
		if ('string' !== typeof s) {
			return s;
		}
		return s.replace(/([.*+?\^=!:${}()|\[\]\/\\])/g, '\\$1');
	};
} 
// Check RegExp.escape dependency
if('function' !== typeof RegExp.escape) {
    throw('RegExp.escape function is missing. Include Ext.ux.util.js file.');
}
 
// create namespace
Ext.ns('Ext.ux.form');
 
/**
 * Creates new LovCombo
 * @constructor
 * @param {Object} config A config object
 */
Ext.ux.form.LovCombo = Ext.extend(Ext.form.ComboBox, {
 
	valueField:'key', //jinwei add 2013.3.7
    // {{{
    // configuration options
    /**
     * @cfg {String} checkField Name of field used to store checked state.
     * It is automatically added to existing fields.
     * (defaults to "checked" - change it only if it collides with your normal field)
     */
     checkField:'checked'
 
    /**
     * @cfg {String} separator Separator to use between values and texts (defaults to "," (comma))
     */
    ,separator:','
 
    /**
     * @cfg {String/Array} tpl Template for items. 
     * Change it only if you know what you are doing.
     */
    // }}}
    // {{{
    ,constructor:function(config) {
        config = config || {};
        config.listeners = config.listeners || {};
        Ext.applyIf(config.listeners, {
             scope:this
            ,beforequery:this.onBeforeQuery
            ,blur:this.onRealBlur
        });
        Ext.ux.form.LovCombo.superclass.constructor.call(this, config);
    } // eo function constructor
    // }}}
    // {{{
    ,initComponent:function() {
        
        // template with checkbox
        if(!this.tpl) {
            this.tpl = 
                 '<tpl for=".">'
                +'<div class="x-combo-list-item">'
                +'<img src="' + Ext.BLANK_IMAGE_URL + '" '
                +'class="ux-lovcombo-icon ux-lovcombo-icon-'
                +'{[values.' + this.checkField + '?"checked":"unchecked"' + ']}">'
                +'<div class="ux-lovcombo-item-text">{' + (this.displayField || 'text' )+ ':htmlEncode}</div>'/*{key} - 去掉*/
                +'</div>'
                +'</tpl>'
            ;
        }
 
        // call parent
        Ext.ux.form.LovCombo.superclass.initComponent.apply(this, arguments);
 
        // remove selection from input field
        this.onLoad = this.onLoad.createSequence(function() {
            if(this.el) {
            	//alert('333');
                var v = this.el.dom.value;
               // this.el.dom.value = '';
                //this.el.dom.value = v;
            }
        });
 
    } // eo function initComponent
    // }}}
    // {{{
    /**
     * Disables default tab key bahavior
     * @private
     */
    ,initEvents:function() {
        Ext.ux.form.LovCombo.superclass.initEvents.apply(this, arguments);
 
        // disable default tab handling - does no good
        this.keyNav.tab = false;
 
    } // eo function initEvents
    // }}}
    // {{{
    /**
     * Clears value
     */
    ,clearValue:function() {
        this.value = '';
        this.setRawValue(this.value);
        this.store.clearFilter();
        this.store.each(function(r) {
            r.set(this.checkField, false);
        }, this);
        if(this.hiddenField) {
            this.hiddenField.value = '';
        }
        this.applyEmptyText();
    } // eo function clearValue
    // }}}
    // {{{
    /**
     * @return {String} separator (plus space) separated list of selected displayFields
     * @private
     */
    ,getCheckedDisplay:function() {
        var re = new RegExp(this.separator, "g");
        return this.getCheckedValue(this.displayField).replace(re, this.separator + ' ');
    } // eo function getCheckedDisplay
    // }}}
    // {{{
    /**
     * @return {String} separator separated list of selected valueFields
     * @private
     */
    ,getCheckedValue:function(field) {
        field = field || this.valueField;
        var c = [];
 
        // store may be filtered so get all records
        var snapshot = this.store.snapshot || this.store.data;
 
        snapshot.each(function(r) {
            if(r.get(this.checkField)) {
                c.push(r.get(field));
            }
        }, this);
 
        return c.join(this.separator);
    } // eo function getCheckedValue
    // }}}
    // {{{
    /**
     * beforequery event handler - handles multiple selections
     * @param {Object} qe query event
     * @private
     */
    ,onBeforeQuery:function(qe) {
        qe.query = qe.query.replace(new RegExp(RegExp.escape(this.getCheckedDisplay()) + '[ ' + this.separator + ']*'), '');
    } // eo function onBeforeQuery
    // }}}
    // {{{
    /**
     * blur event handler - runs only when real blur event is fired
     * @private
     */
    ,onRealBlur:function() {
        this.list.hide();
        var rv = this.getRawValue();
        var rva = rv.split(new RegExp(RegExp.escape(this.separator) + ' *'));
        var va = [];
        var snapshot = this.store.snapshot || this.store.data;
 
        // iterate through raw values and records and check/uncheck items
        Ext.each(rva, function(v) {
            snapshot.each(function(r) {
                if(v === r.get(this.displayField)) {
                    va.push(r.get(this.valueField));
                }
            }, this);
        }, this);
        this.setValue(va.join(this.separator));
        this.store.clearFilter();
    } // eo function onRealBlur
    // }}}
    // {{{
    /**
     * Combo's onSelect override
     * @private
     * @param {Ext.data.Record} record record that has been selected in the list
     * @param {Number} index index of selected (clicked) record
     */
    ,onSelect:function(record, index) {
        if(this.fireEvent('beforeselect', this, record, index) !== false){
 
            // toggle checked field
            record.set(this.checkField, !record.get(this.checkField));
 
            // display full list
            if(this.store.isFiltered()) {
                this.doQuery(this.allQuery);
            }
 
            // set (update) value and fire event
            this.setValue(this.getCheckedValue());
            this.fireEvent('select', this, record, index);
            try{
            	 radow.doOnSelectChange(record, index, this);
            }catch(exception){
            	
            }
            
           
        }
    } // eo function onSelect
    // }}}
    // {{{
    ,beforeBlur : function(){ 
		var val = this. getRawValue(); 
		if(this.forceSelection){ 
			if(val.length > 0 && val != this.emptyText){ 
			   this.el.dom.value = Ext.isDefined(this.lastSelectionText) ? this.lastSelectionText : ''; 
				this.applyEmptyText(); 
			}else{ 
				this.clearValue(); 
			} 
		}else{ 
				var texts = val.split(','); 
				var values=''; 
				for(var i=0;i<texts.length;i++){ 
						var rec = this.findRecord(this.displayField, texts[i].trim()); 
					 if(rec){
							values+=(values.length>0?',':'')+rec.data[this.valueField]; 
						} 
					} 
			this.setValue(values); 
		}
    }
    /**
     * Sets the value of the LovCombo. The passed value can by a falsie (null, false, empty string), in
     * which case the combo value is cleared or separator separated string of values, e.g. '3,5,6'.
     * @param {Mixed} v value
     */
    ,setValue:function(v,field) {
        if(v) {
            v = '' + v;
            if(this.valueField) {
                this.store.clearFilter();
                this.store.each(function(r) {
                	if(!field){
                		field = this.valueField;
                	}
                    var checked = !(!v.match(
                         '(^|' + this.separator + ')' + RegExp.escape(r.get(field))
                        +'(' + this.separator + '|$)'))
                    ;
 
                    r.set(this.checkField, checked);
                }, this);
                this.value = this.getCheckedValue();
                this.setRawValue(this.getCheckedDisplay());
                if(this.hiddenField) {
                    this.hiddenField.value = this.value;
                }
            }
            else {
                this.value = v;
                this.setRawValue(v);
                if(this.hiddenField) {
                    this.hiddenField.value = v;
                }
            }
            if(this.el) {
                this.el.removeClass(this.emptyClass);
            }
        }
        else {
            this.clearValue();
        }
    } // eo function setValue
    // }}}
    // {{{
    /**
     * Selects all items
     */
    ,selectAll:function() {
        this.store.each(function(record){
            // toggle checked field
            record.set(this.checkField, true);
        }, this);
 
        //display full list
        this.doQuery(this.allQuery);
        this.setValue(this.getCheckedValue());
    } // eo full selectAll
    // }}}
    // {{{
    /**
     * Deselects all items. Synonym for clearValue
     */
    ,deselectAll:function() {
        this.clearValue();
    } // eo full deselectAll 
    // }}}
 
}); // eo extend
 
// register xtype
Ext.reg('lovcombo', Ext.ux.form.LovCombo); 
 
// eof