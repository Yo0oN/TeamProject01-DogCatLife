/*
 * @author : soledot
 * @since : 20170322
 * @description : soledot default plugin
 * @editdate : 20170323
 */

(function($){
    $.soledot = {
		ckall : function(name, val){
			$('input[name="'+name+'"]').prop('checked',val);
		}
		,ckval : function(name){
			var valArr = new Array();
			$('input[name="'+name+'"]:checked').each(function(i){
				valArr[i] = $(this).val();
			});
			return valArr;
		}
		,datepicker : function(name){
			$( 'input[name="'+name+'"' ).datepicker({
				changeMonth: true
				,changeYear: true
				,showButtonPanel: true     
				,dateFormat: "yy-mm-dd"
			});
		}
		,datepickerrange : function(sname,ename){
			$( 'input[name="'+sname+'"]' ).datepicker({
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,     
				dateFormat: "yy-mm-dd",
				numberOfMonths : 3,
				onClose : function ( selectedDate ){
					$( 'input[name="'+ename+'"]' ).datepicker( 'option', 'minDate', selectedDate ); 
				}
			});
			$( 'input[name="'+ename+'"]' ).datepicker({
				changeMonth: true,
				changeYear: true,
				showButtonPanel: true,
				dateFormat: "yy-mm-dd",
				numberOfMonths : 3, 
				onClose : function ( selectedDate ){
					$( 'input[name="'+sname+'"]' ).datepicker( 'option', 'maxDate', selectedDate );
				}
			});
		}
        ,move : function(url){
        	$(location).attr('href',url);
        }
        ,submit : function(frm,url){
        	if( '' == frm ) frm = $('#frm');
        	else frm = $('#'+frm);
        	
        	if( '' != url ) $(frm).attr('action',url);
        	$(frm).submit();
        }
        ,getsubmit : function(frm,url){
        	if( '' == frm ) frm = $('#frm');
        	else frm = $('#'+frm);
        	
        	if( '' != url ) $(frm).attr('action',url);
        	$(frm).attr('method','GET');
        	$(frm).submit();
        }
        
	}
})(jQuery);

/*
 * @author : soledot
 * @since : 20170322
 * @description : ajax 기본설정
 * @editdate : 
 */

/*$.ajaxSetup({
	async : true//false
	,beforeSend:function(){
	    $('.ajax-loading').show();
	}
	,complete:function(){
	    $('.ajax-loading').hide();
	}
	,cache : true//false
	,dataType : 'json'
	,error : function(xhr,status,error){
		alert('처리 중 오류가 발생되었습니다.\n지속적인 문제 발생 시 관리자에게 문의부탁드립니다.');
	}
	,success : function(result){
		if( typeof result == 'undefined' ){
			
		}else if( true == result.success ){
			location.reload();
		}else{
			alert( result.msg );
		}
	}
	,timeout : 20000
	,type : 'POST'
});*/

/*
 * @author : soledot
 * @since : 20171014
 * @description : 기본스크립트
 * @editdate : 20171108
 */

function successNotify(msg, url){
	$.notify( 
		{ message: msg, url: url }
		,{ 
			delay: 3000
			,mouse_over : 'pause'
			,placement:{ 
				align : 'center'
			}
			,type : 'success'
		} 
	);
}

function failNotify(msg, url){
	$.notify( 
		{ message: msg, url: url }
		,{ 
			delay: 3000
			,mouse_over : 'pause'
			,placement:{ 
				align : 'center'
			}
			,type: 'danger'
		}
	);
}

function bizinfoPop(wrkr_no){
	var url = "http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no="+wrkr_no;
	window.open( url, "communicationViewPopup", "width=750, height=700;");
}

function pager( r_page ){
	$('#s_pagenum').val( r_page );
	$.soledot.submit( 'frm', '' );
}