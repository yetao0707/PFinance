/**
 * @author ZhangHuihua@msn.com
 */
(function($){
	var _lookup = {currentGroup:"", suffix:"", $target:null, pk:"id"};
	var _util = {
		_lookupPrefix: function(key){
			var strDot = _lookup.currentGroup ? "." : "";
			return _lookup.currentGroup + strDot + key + _lookup.suffix;
		},
		lookupPk: function(key){
			return this._lookupPrefix(key);
		},
		lookupField: function(key){
			return this.lookupPk(key);
		}
	};
	
	$.extend({
		bringBackSuggest: function(args){
			var $box = _lookup['$target'].parents(".unitBox:first");
			$box.find(":input").each(function(){
				var $input = $(this), inputName = $input.attr("name");
				
				for (var key in args) {
					var name = (_lookup.pk == key) ? _util.lookupPk(key) : _util.lookupField(key);

					if (name == inputName) {
						$input.val(args[key]);
						break;
					}
				}
			});
		},
		bringBack: function(args){
			$.bringBackSuggest(args);
			$.pdialog.closeCurrent();
		},
		// TODO zhangsx start
		bringBackSuggestTextArea: function(args){
			var $box = _lookup['$target'].parents(".unitBox:first");
			$box.find("textarea").each(function(){
				var $input = $(this), inputName = $input.attr("name");
				
				for (var key in args) {
					//alert("key="+key+",_lookup.pk="+_lookup.pk+",_util.lookupPk(key)="+_util.lookupPk(key)+",_util.lookupField(key)="+_util.lookupField(key));
					var name = (_lookup.pk == key) ? _util.lookupPk(key) : _util.lookupField(key);
					//alert("name="+name+",inputName="+inputName);
					if (name == inputName) {
						$input.val(args[key]);
						break;
					}
				}
			});
		},
		bringBackTextArea: function(args){
			$.bringBackSuggestTextArea(args);
			$.pdialog.closeCurrent();
		}
		// zhangsx end
	});
	
	$.fn.extend({
		lookup: function(){
			return this.each(function(){
				var $this = $(this), options = {mask:true, 
					width:$this.attr('width')||820, height:$this.attr('height')||400,
					maxable:eval($this.attr("maxable") || "true"),
					resizable:eval($this.attr("resizable") || "true"),
					left:eval($this.attr('left') || ""),
					top:eval($this.attr('top') || "")
				};
				$this.click(function(event){
					_lookup = $.extend(_lookup, {
						currentGroup: $this.attr("lookupGroup") || "",
						suffix: $this.attr("suffix") || "",
						$target: $this,
						pk: $this.attr("lookupPk") || "id"
					});
					if($this.attr("disabled")){// 如果超链接是disabled的不能打开超链接
						return false;
					}
					var url = unescape($this.attr("href")).replaceTmById($(event.target).parents(".unitBox:first"));
					if (!url.isFinishedTm()) {
						alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
						return false;
					}
					
					$.pdialog.open(url, $this.attr("rel") ||"_blank", $this.attr("title") || $this.text(), options);
					return false;
				});
			});
		},
		multLookup: function(){
			return this.each(function(){
				var $this = $(this), args={};
				$this.click(function(event){
					var $unitBox = $this.parents(".unitBox:first");
					$unitBox.find("[name='"+$this.attr("multLookup")+"']").filter(":checked").each(function(){
						var _args = DWZ.jsonEval($(this).val());
						for (var key in _args) {
							var value = args[key] ? args[key]+"," : "";
							args[key] = value + _args[key];
						}
					});

					if ($.isEmptyObject(args)) {
						alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
						return false;
					}
					$.bringBack(args);
				});
			});
		},
		suggest: function(){
			var op = {suggest$:"#suggest", suggestShadow$: "#suggestShadow"};
			var selectedIndex = -1;
			return this.each(function(){
				var $input = $(this).attr('autocomplete', 'off').keydown(function(event){
					if (event.keyCode == DWZ.keyCode.ENTER && $(op.suggest$).is(':visible')) return false; //屏蔽回车提交
				});
				
				var suggestFields=$input.attr('suggestFields').split(",");
				
				function _show(event){
					var offset = $input.offset();
					var iTop = offset.top+this.offsetHeight;
					var $suggest = $(op.suggest$);
					if ($suggest.size() == 0) $suggest = $('<div id="suggest"></div>').appendTo($('body'));

					$suggest.css({
						left:offset.left+'px',
						top:iTop+'px'
					}).show();
					
					_lookup = $.extend(_lookup, {
						currentGroup: $input.attr("lookupGroup") || "",
						suffix: $input.attr("suffix") || "",
						$target: $input,
						pk: $input.attr("lookupPk") || "id"
					});

					var url = unescape($input.attr("suggestUrl")).replaceTmById($(event.target).parents(".unitBox:first"));
					if (!url.isFinishedTm()) {
						alertMsg.error($input.attr("warn") || DWZ.msg("alertSelectMsg"));
						return false;
					}
					
					var postData = {};
					postData[$input.attr("postField")||"inputValue"] = $input.val();

					$.ajax({
						global:false,
						type:'POST', dataType:"json", url:url, cache: false,
						data: postData,
						success: function(response){
							if (!response) return;
							var html = '';

							$.each(response, function(i){
								var liAttr = '', liLabel = '';
								
								for (var i=0; i<suggestFields.length; i++){
									var str = this[suggestFields[i]];
									if (str) {
										if (liLabel) liLabel += '-';
										liLabel += str;
									}
								}
								for (var key in this) {
									if (liAttr) liAttr += ',';
									liAttr += key+":'"+this[key]+"'";
								}
								html += '<li lookupAttrs="'+liAttr+'">' + liLabel + '</li>';
							});
							
							var $lis = $suggest.html('<ul>'+html+'</ul>').find("li");
							$lis.hoverClass("selected").click(function(){
								_select($(this));
							});
							if ($lis.size() == 1 && event.keyCode != DWZ.keyCode.BACKSPACE) {
								_select($lis.eq(0));
							} else if ($lis.size() == 0){
								var jsonStr = "";
								for (var i=0; i<suggestFields.length; i++){
									if (_util.lookupField(suggestFields[i]) == event.target.name) {
										break;
									}
									if (jsonStr) jsonStr += ',';
									jsonStr += suggestFields[i]+":''";
								}
								jsonStr = "{"+_lookup.pk+":''," + jsonStr +"}";
								$.bringBackSuggest(DWZ.jsonEval(jsonStr));
							}
						},
						error: function(){
							$suggest.html('');
						}
					});

					$(document).bind("click", _close);
					return false;
				}
				function _select($item){
					var jsonStr = "{"+ $item.attr('lookupAttrs') +"}";
					
					$.bringBackSuggest(DWZ.jsonEval(jsonStr));
				}
				function _close(){
					$(op.suggest$).html('').hide();
					selectedIndex = -1;
					$(document).unbind("click", _close);
				}
				
				$input.focus(_show).click(false).keyup(function(event){
					var $items = $(op.suggest$).find("li");
					switch(event.keyCode){
						case DWZ.keyCode.ESC:
						case DWZ.keyCode.TAB:
						case DWZ.keyCode.SHIFT:
						case DWZ.keyCode.HOME:
						case DWZ.keyCode.END:
						case DWZ.keyCode.LEFT:
						case DWZ.keyCode.RIGHT:
							break;
						case DWZ.keyCode.ENTER:
							_close();
							break;
						case DWZ.keyCode.DOWN:
							if (selectedIndex >= $items.size()-1) selectedIndex = -1;
							else selectedIndex++;
							break;
						case DWZ.keyCode.UP:
							if (selectedIndex < 0) selectedIndex = $items.size()-1;
							else selectedIndex--;
							break;
						default:
							_show(event);
					}
					$items.removeClass("selected");
					if (selectedIndex>=0) {
						var $item = $items.eq(selectedIndex).addClass("selected");
						_select($item);
					}
				});
			});
		},
		
		itemDetail: function(){
			return this.each(function(){
				var $table = $(this).css("clear","both"), $tbody = $table.find("tbody");
				var fields=[];

				$table.find("tr:first th[type]").each(function(i){
					var $th = $(this);
					var field = {
						type: $th.attr("type") || "text",
						patternDate: $th.attr("dateFmt") || "yyyy-MM-dd",
						name: $th.attr("name") || "",
						defaultVal: $th.attr("defaultVal") || "",
						size: $th.attr("size") || "12",
						enumUrl: $th.attr("enumUrl") || "",
						lookupGroup: $th.attr("lookupGroup") || "",
						lookupUrl: $th.attr("lookupUrl") || "",
						lookupPk: $th.attr("lookupPk") || "id",
						suggestUrl: $th.attr("suggestUrl"),
						suggestFields: $th.attr("suggestFields"),
						postField: $th.attr("postField") || "",
						fieldClass: $th.attr("fieldClass") || "",
						fieldAttrs: $th.attr("fieldAttrs") || ""
					};
					fields.push(field);
				});
				
				$tbody.find("a.btnDel").click(function(){
					var $btnDel = $(this);
					
					if ($btnDel.is("[href^=javascript:]")){
						$btnDel.parents("tr:first").remove();
						initSuffix($tbody);
						return false;
					}
					
					function delDbData(){
						$.ajax({
							type:'POST', dataType:"json", url:$btnDel.attr('href'), cache: false,
							success: function(){
								$btnDel.parents("tr:first").remove();
								initSuffix($tbody);
							},
							error: DWZ.ajaxError
						});
					}
					
					if ($btnDel.attr("title")){
						alertMsg.confirm($btnDel.attr("title"), {okCall: delDbData});
					} else {
						delDbData();
					}
					
					return false;
				});

				var addButTxt = $table.attr('addButton') || "Add New";
				if (addButTxt) {
					var $addBut = $('<div class="button"><div class="buttonContent"><button type="button">'+addButTxt+'</button></div></div>').insertBefore($table).find("button");
					var $rowNum = $('<input type="text" name="dwz_rowNum" class="textInput" style="margin:2px;" value="1" size="2"/>').insertBefore($table);
					
					var trTm = "";
					$addBut.click(function(){
						if (! trTm) trTm = trHtml(fields);
						var rowNum = 1;
						try{rowNum = parseInt($rowNum.val())} catch(e){}

						for (var i=0; i<rowNum; i++){
							var $tr = $(trTm);
							$tr.appendTo($tbody).initUI().find("a.btnDel").click(function(){
								$(this).parents("tr:first").remove();
								initSuffix($tbody);
								return false;
							});
						}
						initSuffix($tbody);
					});
				}
			});
			
			/**
			 * 删除时重新初始化下标
			 */
			function initSuffix($tbody) {
				$tbody.find('>tr').each(function(i){
					$(':input, a.btnLook, a.btnAttach', this).each(function(){
						var $this = $(this), name = $this.attr('name'), val = $this.val();

						if (name) $this.attr('name', name.replaceSuffix(i));
						
						var lookupGroup = $this.attr('lookupGroup');
						if (lookupGroup) {$this.attr('lookupGroup', lookupGroup.replaceSuffix(i));}
						
						var suffix = $this.attr("suffix");
						if (suffix) {$this.attr('suffix', suffix.replaceSuffix(i));}
						
						if (val && val.indexOf("#index#") >= 0) $this.val(val.replace('#index#',i+1));
					});
				});
			}
			
			function tdHtml(field){
				var html = '', suffix = '';
				
				if (field.name.endsWith("[#index#]")) suffix = "[#index#]";
				else if (field.name.endsWith("[]")) suffix = "[]";
				
				var suffixFrag = suffix ? ' suffix="' + suffix + '" ' : '';
				
				var attrFrag = '';
				if (field.fieldAttrs){
					var attrs = DWZ.jsonEval(field.fieldAttrs);
					for (var key in attrs) {
						attrFrag += key+'="'+attrs[key]+'"';
					}
				}
				switch(field.type){
					case 'del':
						html = '<a href="javascript:void(0)" class="btnDel '+ field.fieldClass + '">删除</a>';
						break;
					case 'lookup':
						var suggestFrag = '';
						if (field.suggestFields) {
							suggestFrag = 'autocomplete="off" lookupGroup="'+field.lookupGroup+'"'+suffixFrag+' suggestUrl="'+field.suggestUrl+'" suggestFields="'+field.suggestFields+'"' + ' postField="'+field.postField+'"';
						}

						html = '<input type="hidden" name="'+field.lookupGroup+'.'+field.lookupPk+suffix+'"/>'
							+ '<input type="text" name="'+field.name+'"'+suggestFrag+' lookupPk="'+field.lookupPk+'" size="'+field.size+'" class="'+field.fieldClass+'"/>'
							+ '<a class="btnLook" href="'+field.lookupUrl+'" lookupGroup="'+field.lookupGroup+'" '+suggestFrag+' lookupPk="'+field.lookupPk+'" title="查找带回">查找带回</a>';
						break;
					case 'attach':
						html = '<input type="hidden" name="'+field.lookupGroup+'.'+field.lookupPk+suffix+'"/>'
							+ '<input type="text" name="'+field.name+'" size="'+field.size+'" readonly="readonly" class="'+field.fieldClass+'"/>'
							+ '<a class="btnAttach" href="'+field.lookupUrl+'" lookupGroup="'+field.lookupGroup+'" '+suggestFrag+' lookupPk="'+field.lookupPk+'" width="560" height="300" title="查找带回">查找带回</a>';
						break;
					case 'enum':
						$.ajax({
							type:"POST", dataType:"html", async: false,
							url:field.enumUrl, 
							data:{inputName:field.name}, 
							success:function(response){
								html = response;
							}
						});
						break;
					case 'date':
						html = '<input type="text" name="'+field.name+'" value="'+field.defaultVal+'" class="date '+field.fieldClass+'" dateFmt="'+field.patternDate+'" size="'+field.size+'"/>'
							+'<a class="inputDateButton" href="javascript:void(0)">选择</a>';
						break;
					default:
						html = '<input type="text" name="'+field.name+'" value="'+field.defaultVal+'" size="'+field.size+'" class="'+field.fieldClass+'" '+attrFrag+'/>';
						break;
				}
				return '<td>'+html+'</td>';
			}
			function trHtml(fields){
				var html = '';
				$(fields).each(function(){
					html += tdHtml(this);
				});
				return '<tr class="unitBox">'+html+'</tr>';
			}
		},
		
//-------------------------------------------------------------------------------------------
		/**
		 * @mark
		 * TODO 已完成
		 * 创建人： zhangsx
		 * 
		 */
		commonDetail: function(){
			return this.each(function(){
				var $table = $(this).css("clear","both"), $tbody = $table.find("tbody");
				var fields=[];

				$table.find("tr:first th[type]").each(function(i){
					var $th = $(this);
					var field = {
						type: $th.attr("type") || "text",
						patternDate: $th.attr("dateFmt") || "yyyy-MM-dd",
						name: $th.attr("name") || "",
						defaultVal: $th.attr("defaultVal") || "",
						size: $th.attr("size") || "12",
						disabled: $th.attr("disabled") || "",
						enumUrl: $th.attr("enumUrl") || "",
						lookupGroup: $th.attr("lookupGroup") || "",
						lookupUrl: $th.attr("lookupUrl") || "",
						lookupPk: $th.attr("lookupPk") || "id",
						suggestUrl: $th.attr("suggestUrl"),
						suggestFields: $th.attr("suggestFields"),
						postField: $th.attr("postField") || "",
						fieldClass: $th.attr("fieldClass") || "",
						fieldAttrs: $th.attr("fieldAttrs") || "",
						title: $th.attr("title") || "",
						href: $th.attr("href") || "",
						dialogWidth: $th.attr("dialogWidth") || "",
						dialogHeight: $th.attr("dialogHeight") || "",
						rows: $th.attr("rows") || "",
						cols: $th.attr("cols") || "",
						value: $th.attr("value") || "",
						nameField: $th.attr("nameField") || "",
						id: $th.attr("id") || "",
						onchange: $th.attr("onchange") || "",
						onclick: $th.attr("onclick") || "",
						callbackDel: $th.attr("callbackDel") || ""
						
					};
					fields.push(field);
				});
				
				$tbody.find("a.btnDel").click(function(){
					var $btnDel = $(this);

					if ($btnDel.is("[href^=javascript:]")){
						$btnDel.parents("tr:first").remove();
						initSuffix($tbody);
						return false;
					}
					
					function delDbData(){
						$.ajax({
							type:'POST', dataType:"json", url:$btnDel.attr('href'), cache: false,
							success: function(){
								$btnDel.parents("tr:first").remove();
								initSuffix($tbody);
							},
							error: DWZ.ajaxError
						});
					}
					
					if ($btnDel.attr("title")){
						alertMsg.confirm($btnDel.attr("title"), {okCall: delDbData});
					} else {
						delDbData();
					}
					var callbackDel = eval($btnDel.attr('callbackDel'));
					if($.isFunction(callbackDel)) callbackDel();
					
					return false;
				});
				
				$("._btnDel").click(function(){
					var $btnDel = $(this);
				    $(this).parents("tr:first").remove();
				    initSuffix($tbody);
				    var callbackDel = eval($btnDel.attr('callbackDel'));
					if($.isFunction(callbackDel)) callbackDel();
					
				});
				
				var addButTxt = $table.attr('addButton') || "Add New";
				if (addButTxt) {
					var $addBut = $('<div class="button" style="background: #00b5e5;-webkit-border-radius: 3px;-moz-border-radius: 3px;-ms-border-radius: 3px;-o-border-radius: 3px;border-radius: 3px;"><div class="buttonContent"style="background: #00b5e5"><button  type="button"style="background: #00b5e5;color: #fff;font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;" >'+addButTxt+'</button></div></div>').insertBefore($table).find("button");
					var $rowNum = $('<input type="hidden" id="dwz_rowNum" name="dwz_rowNum" class="textInput" style="margin:2px;" value="1" size="2"/>').insertBefore($table);
					
					var trTm = "";
					$addBut.click(function(){
						if (! trTm) trTm = trHtml(fields);
						var rowNum = 1;
						try{rowNum = parseInt($rowNum.val())} catch(e){}

						for (var i=0; i<rowNum; i++){
							var $tr = $(trTm);
							$tr.appendTo($tbody).initUI().find("a.btnDel").click(function(){
								var $btnDel = $(this);
								$(this).parents("tr:first").remove();
								var callbackDel = eval($btnDel.attr('callbackDel'));
								if($.isFunction(callbackDel)) callbackDel();
								initSuffix($tbody);
								return false;
							});
						}
						initSuffix($tbody);
					});
				}
			});

			/**
			 * 删除时重新初始化下标
			 */
			function initSuffix($tbody) {
				$tbody.find('>tr').each(function(i){
					$(':input, a.btnLook, a.btnAttach, a.btnEdit', this).each(function(){
						var $this = $(this), name = $this.attr('name'), val = $this.val();

						if (name) $this.attr('name', name.replaceSuffix(i));
						
						var lookupGroup = $this.attr('lookupGroup');
						if (lookupGroup) {$this.attr('lookupGroup', lookupGroup.replaceSuffix(i));}
						
						var suffix = $this.attr("suffix");
						if (suffix) {$this.attr('suffix', suffix.replaceSuffix(i));}
						
						if (val && val.indexOf("#index#") >= 0) $this.val(val.replace('#index#',i+1));
					});
				});
			}
			/**
			 * 删除时扩展一个回调函数
			 */
			function delCallback(callback){
				callback();
			}
			
			function tdHtml(field){
				var html = '', suffix = '';

				if (field.name.endsWith("[#index#]")) suffix = "[#index#]";
				else if (field.name.endsWith("[]")) suffix = "[]";
				
				var suffixFrag = suffix ? ' suffix="' + suffix + '" ' : '';
				
				var attrFrag = '';
				if (field.fieldAttrs){
					var attrs = DWZ.jsonEval(field.fieldAttrs);
					for (var key in attrs) {
						attrFrag += key+'="'+attrs[key]+'"';
					}
				}
				switch(field.type){
					case 'del':
						if(field.disabled){
							field.disabled = 'disabled="' + field.disabled+'"';
						}
						html = '<a href="javascript:void(0)" class="btnDel '+ field.fieldClass + '" '+field.disabled + " callbackDel="+field.callbackDel+'>删除</a>';
						break;
					case 'delAndLookUp':
						if(field.disabled){
							field.disabled = 'disabled="' + field.disabled+'"';
						}
						html = '<a name="'+field.name+'" onclick="choose(this)" class="btnLook" '+field.disabled + '>'; 
						html += '<a href="javascript:void(0)" class="btnDel '+ field.fieldClass + '" '+field.disabled + '>删除</a>';
						break;
					case 'lookup':
						var suggestFrag = '';
						if (field.suggestFields) {
							suggestFrag = 'autocomplete="off" lookupGroup="'+field.lookupGroup+'"'+suffixFrag+' suggestUrl="'+field.suggestUrl+'" suggestFields="'+field.suggestFields+'"' + ' postField="'+field.postField+'"';
						}
						if(field.disabled){
							field.disabled = 'disabled="' + field.disabled+'"';
						}
						
						html = '<input type="hidden" name="'+field.lookupGroup+'.'+field.lookupPk+suffix+'"/>'
							+ '<input type="text" name="'+field.name+'"'+suggestFrag+' lookupPk="'+field.lookupPk+'" size="'+field.size+'" class="'+field.fieldClass+'" '+field.disabled + '/>'
							+ '<a class="btnLook" href="'+field.lookupUrl+'" lookupGroup="'+field.lookupGroup+'" '+suggestFrag+' lookupPk="'+field.lookupPk+'" '+field.disabled + ' title="查找带回">查找带回</a>';
						break;
					case 'attach':
						if(field.disabled){
							field.disabled = 'disabled="' + field.disabled+'"';
						}
						html = '<input type="hidden" name="'+field.lookupGroup+'.'+field.lookupPk+'"/>'
							+ '<input type="text" name="'+field.name+'" size="'+field.size+'" readonly="readonly" class="'+field.fieldClass+'" '+field.disabled + '/>'
							+ '<a class="btnAttach" href="'+field.lookupUrl+'" nameField="'+field.nameField+'" lookupGroup="'+field.lookupGroup+'" '+suggestFrag+' lookupPk="'+field.lookupPk+'" '+field.disabled + ' width="560" height="300" title="上传附件">上传附件</a>';
						break;
					case 'enum':
						$.ajax({
							type:"POST", dataType:"html", async: false,
							url:field.enumUrl, 
							data:{inputName:field.name}, 
							success:function(response){
								html = response;
							}
						});
						break;
					case 'date':
						if(field.disabled){
							field.disabled = 'disabled="' + field.disabled+'"';
						}
						html = '<input type="text"  readonly="readonly" name="'+field.name+'" value="'+field.defaultVal+'" class="date '+field.fieldClass+'" dateFmt="'+field.patternDate+'" size="'+field.size+'" '+field.disabled + '/>';
						break;
					case 'textarea':
						if(field.disabled){
							field.disabled = 'disabled="' + field.disabled+'"';
						}
						html = '<textarea name="'+field.name+'" class="'+field.fieldClass+'" rows="'+field.rows+'" cols="'+field.cols+'" '+field.disabled + '></textarea>'
						+ '<a class="btnEdit" onclick="return common_textarea(this)" nameField="'+field.nameField+'" lookupUrl="'+field.lookupUrl+'financial/fncTravelExpenses/textarea" lookupGroup="'+field.lookupGroup+'" '+field.disabled + ' rel="txDtail" width="300" height="300" resizable="false" drawable="false" mask="true" minable="false" maxable="false" title="编辑文本">编辑</a>';
						break;
					case 'select':
						if(field.disabled){
							field.disabled = 'disabled="' + field.disabled+'"';
						}
												
						html = '<select name="'+field.name+'" class="'+field.fieldClass+'"'+field.disabled + '>';
						$.ajax({
							type:"POST", dataType:"json", async: false,cache: false,
							url:field.lookupUrl, 
							data:{inputName:field.lookupData}, 
							success: function(json){
								if (!json) return;
								var optionHtml = '';
	
								$.each(json, function(i){
									if (json[i] && json[i].length > 1){
										optionHtml += '<option value="'+json[i][0]+'">' + json[i][1] + '</option>';
									}
								});
								html = html+optionHtml;
							},
							//error: DWZ.ajaxError
						});
						html = html+ '</select>';
						break;
					default:
						html = '<input type="text" name="'+field.name+'" id="'+field.id+'" onchange="'+field.onchange+'" value="'+field.defaultVal+'" size="'+field.size+'" class="'+field.fieldClass+'" '+attrFrag+' '+field.disabled + '/>';
						break;
				}
				return '<td>'+html+'</td>';
			}
			function trHtml(fields){
				var html = '';
				$(fields).each(function(){
					html += tdHtml(this);
				});
				return '<tr class="unitBox">'+html+'</tr>';
			}
		},

//-------------------------------------------------------------------------------------------
		
		selectedTodo: function(){
			
			function _getIds(selectedIds, targetType){
				var ids = "";
				var $box = targetType == "dialog" ? $.pdialog.getCurrent() : navTab.getCurrentPanel();
				$box.find("input:checked").filter("[name='"+selectedIds+"']").each(function(i){
					var val = $(this).val();
					ids += i==0 ? val : ","+val;
				});
				return ids;
			}
			return this.each(function(){
				var $this = $(this);
				var selectedIds = $this.attr("rel") || "ids";
				var postType = $this.attr("postType") || "map";

				$this.click(function(){
					var targetType = $this.attr("targetType");
					var ids = _getIds(selectedIds, targetType);
					if (!ids) {
						alertMsg.error($this.attr("warn") || DWZ.msg("alertSelectMsg"));
						return false;
					}
					
					var _callback = $this.attr("callback") || (targetType == "dialog" ? dialogAjaxDone : navTabAjaxDone);
					if (! $.isFunction(_callback)) _callback = eval('(' + _callback + ')');
					
					function _doPost(){
						$.ajax({
							type:'POST', url:$this.attr('href'), dataType:'json', cache: false,
							data: function(){
								if (postType == 'map'){
									return $.map(ids.split(','), function(val, i) {
										return {name: selectedIds, value: val};
									})
								} else {
									var _data = {};
									_data[selectedIds] = ids;
									return _data;
								}
							}(),
							success: _callback,
							error: DWZ.ajaxError
						});
					}
					var title = $this.attr("title");
					if (title) {
						alertMsg.confirm(title, {okCall: _doPost});
					} else {
						_doPost();
					}
					return false;
				});
				
			});
		}
	});
})(jQuery);