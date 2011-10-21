// Global variables required for use in template_editor\app\views\main\update_attribute.js.erb
var componentsCollapsedState = new Array();
var componentIOCharsCollapsedState = new Array();
var componentAECharsCollapsedState = new Array();
// Global variable used in template_editor\app\views\aim_templates\update.js.erb
var selectedTemplateId = null;
// Global variable used in template_editor\app\views\template_containers\update.js.erb
var selectedTemplateContainerId = null ;

function startLoad() {
	$.blockUI({
		  message: $('#loading_div'),
		  css:{
		    border: 'none',
			backgroundColor: 'transparent',
			top:'40%',
		  }
	});
}

function endLoad() {
	$.unblockUI();
}
	
$("#templateContainerList p, #doneCreatingTemplateContainer, #confirmDeleteTemplateContainer, #copyTemplateContainer, #doneEditingTemplateContainer, #templateList p, #doneCreatingTemplate, #confirmDeleteTemplate, #copyTemplate, #doneEditingTemplate, :checkbox.shouldDisplay, :checkbox.annotatorConfidence, .addQuantification, .deleteQuantification, .addNonQuantifiableRow, .deleteNonQuantifiableRow, .deleteQuantile, .addNumericalTableRow, .deleteNumericalTableRow, .addIntervalTableRow, .deleteIntervalTableRow, .deleteScale, .addOrdinalLevelTableRow, .deleteOrdinalLevelTableRow, .addAllowedTerm, #confirmDeleteAllowedTerm, .addImagingObservationCharacteristic, .addAnatomicEntityCharacteristic, #confirmDeleteComponentCharacteristic, #createComponent, #confirmDeleteComponent, #copyComponent, #addSelectedTerm, #lexiconList p, #doneCreatingLexicon, #confirmDeleteLexicon, #createLexiconEntry, #confirmDeleteLexiconEntry, #copyLexiconEntry").live('click', startLoad);
	
$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});

if (window.jLog) with (jLog.Format) {
  width		= '60ex';
  height		= '95%';
  positionTop	= 0;
  fontSize	= 1;
  };

var $Tabs, $InnerTabs;
var $AccordionInTab2, $AccordionInTab3;
var outerLayout, tabsContainerLayout;

var debugEnabled = false;

function debug(msg) {
  if (debugEnabled && typeof console != 'undefined') {
    console.log(msg);
  }
}

function toggleCustomTheme () {
  $('body').toggleClass('custom');
  resizeOuterLayout();
}

function resizeOuterLayout () {
  if (outerLayout) outerLayout.resizeAll();
}

function resizeSidebarLayout (pane, $Pane, state, options, layoutName) {
  if ($Pane.data("layoutContainer")) {
    debug("Resizing Layout: "+layoutName+" Pane:"+pane);
    $Pane.layout().resizeAll();
  }
}

function resizeTabPanelLayout () {
  var
  tabIndex	= $Tabs.tabs("option", "selected")
  ,	$TabPanel	= $( "#tab"+ (tabIndex + 1) ).show() // make sure is 'visible'
  ,	tabLayout
  ;
  // IF tabLayout exists - get Instance and call resizeAll
  if ($TabPanel.data("layoutContainer")) {
    // resize the layout-panes - if required
    tabLayout = $TabPanel.layout();
    tabLayout.resizeAll();
  }
  // else if tabLayout does not exist yet, create it now
  else { // if (ui.index > 0) // panel #0 layout is initialized in document.ready
    if ((tabIndex+1) == 1){
      tabLayout = $TabPanel.layout( tab1LayoutOptions );
    } else if ((tabIndex+1) == 4){
      tabLayout = $TabPanel.layout( tab4LayoutOptions );
    }
    else {
      tabLayout = $TabPanel.layout( tabLayoutOptions );
    }
    // tabLayout = $TabPanel.layout( tabLayoutOptions );
    // also create nested-layouts in the 2 sidebars
    tabLayout.panes.west.layout( sidebarLayoutOptions );
    tabLayout.panes.east.layout( sidebarLayoutOptions );
  }

  // call sub-routines to handle widgets INSIDE the TabPanels
  handle_AccordionInTab2( tabLayout );
  handle_InnerTabsInTab3( tabLayout );
  return;

}

/*
 *	SUBROUTINES...
 */

function handle_AccordionInTab2 (tabLayout) {
  // see if Tab-Layout contains #AccordionInTab2, and handle if so
  if (tabLayout.panes.center.find("#tabTwoCenterAccordion").length) {
    if (!$AccordionInTab2)
      // Accordion not created yet, so do it now
      $AccordionInTab2 = tabLayout.panes.center.find("#tabTwoCenterAccordion").accordion({
        fillSpace:	true
        ,
        active:		2 // 3rd panel
      });
    else
      // Accordion already exists, so resize it
      $AccordionInTab2.accordion("resize");
  }
}

function handle_InnerTabsInTab3 (tabLayout) {
  // if this tab contains #innerTabs, handle that
  if (tabLayout.panes.center.is("#innerTabs")) {
    if (!$InnerTabs) { // $InnerTabs not created yet
      $InnerTabs = tabLayout.panes.center; // set FIRST for handle_AccordionInTab3()
      $InnerTabs.tabs({
        show: function(){
          handle_AccordionInTab3();
        }
      });
      tabLayout.sizeContent("center"); // resize to fit tab-buttons correctly
    }
    else
      handle_AccordionInTab3();
  }
}

function handle_AccordionInTab3 () {
  // IF tab containing the Accordion is visible, then create OR resize it
  if ($InnerTabs.tabs("option", "selected") == 1) {
    if (!$AccordionInTab3)
      // Accordion not created yet, so do it now
      $AccordionInTab3 = $("#simpleTabAccordion").accordion({
        fillSpace:	true
        ,
        active:		0 // 1st panel
      });
    else
      // Accordion already exists, so resize it
      $AccordionInTab3.accordion("resize");
  }
}

var tabLayoutOptions = {
  name:					'tabPanelLayout' // only for debugging
  ,
  resizeWithWindow:		false	// required because layout is 'nested' inside tabpanels container
  //,	resizeWhileDragging:	true	// slow in IE because of the nested layouts
  ,
  resizerDragOpacity:		0.5
  ,
  north__resizable:		false
  ,
  south__resizable:		false
  ,
  north__closable:		false
  ,
  south__closable:		false
  ,
  west__minSize:			200
  ,
  east__minSize:			300
  ,
  center_minWidth:    400
  ,
  spacing_open:			10
  ,
  spacing_closed:			10
  ,
  contentSelector:		".ui-widget-content"
  ,
  togglerContent_open:	'<div class="ui-icon"></div>'
  ,
  togglerContent_closed:	'<div class="ui-icon"></div>'
  ,
  center__onresize:		function (pane, $Pane) {
    $Pane.find("#AccordionInTab2").accordion("resize");
  }
  ,
  west__onresize:			resizeSidebarLayout
  ,
  east__onresize:			resizeSidebarLayout
};

var tab1LayoutOptions = {
  name:					'tabPanelLayout' // only for debugging
  ,
  resizeWithWindow:		false	// required because layout is 'nested' inside tabpanels container
  //,	resizeWhileDragging:	true	// slow in IE because of the nested layouts
  ,
  resizerDragOpacity:		0.5
  ,
  north__resizable:		false
  ,
  south__resizable:		false
  ,
  north__closable:		false
  ,
  south__closable:		false
  ,
  west__minSize:			200
  ,
  east__minSize:			200
  ,
  center_minWidth:                500
  ,
  spacing_open:			10
  ,
  spacing_closed:			10
  ,
  contentSelector:		".ui-widget-content"
  ,
  togglerContent_open:	'<div class="ui-icon"></div>'
  ,
  togglerContent_closed:	'<div class="ui-icon"></div>'
  ,
  center__onresize:		function (pane, $Pane) {
    $Pane.find("#AccordionInTab2").accordion("resize");
  }
  ,
  west__onresize:			resizeSidebarLayout
  ,
  east__onresize:			resizeSidebarLayout
};


var tab4LayoutOptions = {
  name:					'tabPanelLayout' // only for debugging
  ,
  resizeWithWindow:		false	// required because layout is 'nested' inside tabpanels container
  //,	resizeWhileDragging:	true	// slow in IE because of the nested layouts
  ,
  resizerDragOpacity:		0.5
  ,
  north__resizable:		false
  ,
  south__resizable:		false
  ,
  north__closable:		false
  ,
  south__closable:		false
  ,
  west__minSize:			500
  ,
  east__minSize:			300
  ,
  center_minWidth:          500
  ,
  spacing_open:			10
  ,
  spacing_closed:			10
  ,
  contentSelector:		".ui-widget-content"
  ,
  togglerContent_open:	'<div class="ui-icon"></div>'
  ,
  togglerContent_closed:	'<div class="ui-icon"></div>'
  ,
  center__onresize:		function (pane, $Pane) {
    $Pane.find("#AccordionInTab2").accordion("resize");
  }
  ,
  west__onresize:			resizeSidebarLayout
  ,
  east__onresize:			resizeSidebarLayout
};



var sidebarLayoutOptions = {
  name:					'sidebarLayout' // only for debugging
  ,
  resizeWhileDragging:	true
  ,
  north__size:			"15%"
  ,
  south__size:			"70%"
  ,
  minSize:100
  ,
  center__minHeight:		100
  ,
  spacing_open:			10
  ,
  spacing_closed:			10
  ,
  contentSelector:		".ui-widget-content"
  ,
  togglerContent_open:	'<div class="ui-icon"></div>'
  ,
  togglerContent_closed:	'<div class="ui-icon"></div>'
  ,
  default__resizable:         false
};


$(document).ready( function() {

  var selectedTemplate = null ;
  selectedTemplateId = null ;
  var selectedTemplateContainer = null ;
  selectedTemplateContainerId = null ;
  var selectedRows = null ;
  var selectedComponentId = null ;
  var selectedRows1 = null ;
  var selectedRows3 = null ;
  var selectedRows4 = null ; // selected Lexicon term in lexicon tab
  var selectedLexicon = null ;
  var selectedLexiconId = null ;
  var selectedTemplates = null ;
  var includedTemplates = null ;
  var selectedNonQuantRow = null ;
  var selectedIncludedTemplate = null ;
  var selectedIncludedTemplateId = null;
  var selectedQuantifiableId = null ;
  var isSelectedAllowedTerm = true ;
  var selectedRowsBg ;
  var selectedRowsBg4 ;
  var lexiconTermId = "";
  
  // Function to change Quantification type based on radio option selected
  $("input.quant_type1, input.quant_type2, input.quant_type3, input.quant_type4").live('change', function() {
    startLoad();
    selectedClass = $(this).attr('class') ;
    $(this).siblings("div." + selectedClass).show().siblings("div").hide() ;
    parentId = $(this).attr('id').match(/\d+/)[0];
    $.get("/characteristic_quantifications/update_type/" + parentId + '?type=' + $(this).attr('value') + '&template_id=' + selectedTemplateId + '&no_refresh=true', null, null, "script") ;
    if(selectedClass=="quant_type1") { // quantile
      $.get('/quantiles/add_row/0?object=quantiles&parent_object=characteristic_quantifications&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, null, null, 'script');
    } else if (selectedClass=="quant_type4") { // scale
      $.get('/scales/set_scale/' + parentId + '?aim_template_id=' + selectedTemplateId, null, null, 'script') ;
    }
  });
  
  // Function to handle when user clicks on "Quantifiables?" checkbox
  $(".has_quantifiables").live('click', function() {
    selectedQuantifiableId = $(this).attr('name') ;
    if ($(this).is(':not(:checked)')) {
      if ($(this).attr('value') == 1) {
        //$("#confirmDeleteQuant").data('o',$(this).siblings(".quantifiable_info"));
        $("#cancelDeleteQuant").data('o',$(this));
        $.blockUI({
          message: $('#deleteQuantMessage'),
          css:{
            top:'20%'
          }
        });
      } else {
        $(this).siblings(".quantifiable_info").slideUp();
      }
    //var checkbox = this;
    //$("#deleteQuantMessage").data('o', checkbox).dialog('open');
    } else {
      $(this).siblings(".quantifiable_info").slideDown();
    }
  });
  
  $("#confirmDeleteQuant").click(function(){
    // DANNY : INSERT CODE TO 1) UNSELECT ALL RADIO BUTTONS FOR QUANTIFIABLES, AND 2) DELETE ALL QUANTIFIABLE DATA
    // $(this).data('o').slideUp();
    $.get('/characteristic_quantifications/delete_quantifiables/' + selectedQuantifiableId + '?template_id=' + selectedTemplateId, null, null, "script")
    $.unblockUI();
  });

  $("#cancelDeleteQuant").click(function() {
    $(this).data('o').attr('checked','checked');
    $.unblockUI();
  });
  
  $(".tablesorter").tablesorter({
    cssAsc:"headerSortUp",
    cssDesc:"headerSortDown",
    cssHeader:"header"
  });
	
  $("#myTable4").treeTable({
    initialState: "expanded",
    treeColumn: "1"
  });

  $("#availableTemplates tr td:first-child").css("width","90%");
  $("#includedTemplates tr td:first-child").css("width","90%");
  
  $("#copyTemplateContainer").live('click', function () {
    if(selectedTemplateContainerId == null) {
      $.blockUI({
        message: 'Select a Template Container to copy first',
        timeout:'1000'
      });
    }
    $.get('/template_containers/copy/' + selectedTemplateContainerId, null, endLoad, "script")
  }
  ) ;

  $("#includeSelectedTemplates").click( function () {
    data1 = $("#availableTemplatesForm").serialize() + '&id=' + selectedTemplateContainerId ;
    //$('#availableTemplatesTableBody').load('/template_containers/included_templates/' + $(this).attr('id')) ;
    $.ajax({
      url: '/template_containers/update_included_templates/', // + '?' + data1,
      data: data1,
      type: 'post',
      dataType: 'script'
    });
    //$.get('/template_containers/included_templates?' + data1, null, null, "script")
    //$.get('/template_containers/included_templates/?' + data1, null, null, "script")
    //alert('includeSeletectedTemplates:' + data1);
    return false ;
  });

  $("#removeIncludedTemplates").click(function() {
    if (selectedIncludedTemplate != null) {
      //selectedIncludedTemplate.remove();
      //alert('/template_containers/remove_included_template/' + selectedIncludedTemplateId) ;
      $.get('/template_containers/remove_included_template/' + selectedIncludedTemplateId + '?container_id=' + selectedTemplateContainerId, null, null, "script")
      selectedIncludedTemplate = null;
      selectedIncludedTemplateId = null;
    } else {
      $.blockUI({
        message: 'cannot remove: no Included Template selected',
        timeout:'1000'
      });
    }
  });

  $("#lexicons_myTable1 td, #templates_myTable1 td").live('click', function(){
    var parent_row = $(this).parent('tr');
	if ( $(this).css('background-color') == 'silver') {  
	  parent_row.children().css('backgroundColor', 'white');
      selectedRows1 = null;
	  parent_row.parents('table:first').siblings('form').find('input:text').val('');
    } else {
      parent_row.siblings().children().css('backgroundColor', 'white');
      selectedRows1 = parent_row.clone();
	  parent_row.children('td').css('backgroundColor', 'silver');
	  var term = parent_row.children('td:first').text();
	  parent_row.parents('table:first').siblings('form').find('input:text').val(term);
    }
  });

  //Function to add a Selected Term from right pane to the Allowed Terms table whose row is selected
  $("#addSelectedTerm").live('click', function() {
    if (selectedRows1 != null) {
      if (selectedRows != null && isSelectedAllowedTerm == true) {
        var objectType = selectedRows.attr('class');
        var parentType = selectedRows.parents("[name='element']").attr('class');
        var parentId = selectedRows.parents("[name='element']").attr('id').match(/\d+/)[0] ; // parent().parent().parent().parent() ;
        data = selectedRows1.attr('class') ;
        $.get('/' + objectType + '/add_row/0' + '?object=' + objectType + '&parent_object=' + parentType + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId + '&' + data, null, null, 'script') ;
        selectedRows = null;
      }
      else {
        $.blockUI({
          message: 'Select an Allowed Term table header or row next to which you want to add the Selected Term',
          timeout: '4000'
        });
      }
    } else {
      $.blockUI({
        message: 'Select a Term to add first',
        timeout:'1000'
      });
    }
  });

  $(".addAllowedTerm").live('click', function() {
	var parent_type = $(this).attr('id').match(/[^-]+/)[0];
	var parent_id = $(this).attr('id').match(/\d+/)[0];
	$.get('/allowed_terms/add_row/0?object=allowed_terms&parent_object=' + parent_type + '&parent_id=' + parent_id + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });
  
  //Function to delete the selected Allowed Term
  $(".deleteAllowedTerm").live('click', function () {
    if (selectedRows != null && isSelectedAllowedTerm == true && selectedRows.find('td').size() > 0) {
      $.blockUI({
        message: $('#deleteAllowedTermMessage'),
        css:{
          top:'20%'
        }
      });
    } else {
      $.blockUI({
        message: 'Select an Allowed Term to delete first',
        timeout: '2000'
      });
    }
  });
  
  $("#confirmDeleteAllowedTerm").click(function() {
    var objectId = selectedRows.attr('id').match(/\d+/)[0];
    var objectType = selectedRows.attr('class') ;
    selectedRows = null;
    isSelectedAllowedTerm = false;
    $.get('/' + objectType + '/delete_row/' + objectId + '?object=' + objectType + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });
  
  $("#cancelDeleteAllowedTerm").click(function(){
    $.unblockUI();
  });
  
  $("#templateList p").live('click', function() {
    if ( $(this).css('backgroundColor') == 'rgba(0, 0, 0, 0)' || $(this).css('backgroundColor') == 'transparent' ) {
      $(this).siblings().css('backgroundColor', '');
      selectedTemplate = ($(this).css('backgroundColor', 'rgba(180, 180, 180, 0.7)')) ;
      selectedTemplateId = $(this).attr('id').match(/\d+/)[0] ;
    //alert(selectedTemplateId);
    //$('#myTable').html($(this).css('backgroundColor')) ;
    //alert('templateList');
    } else {
      $(this).css('backgroundColor', '');
      selectedTemplate = null ;
      selectedTemplateId = null ;
    }
    //alert(selectedTemplateId) ;
    $('#templateTableDiv').load('/main/select_template/' + selectedTemplateId, function() {
      $(".editableText").each(function() {
        $(this).attr('title', $(this).text()) ;
      });
	  initializeComponentsCollapsedState();
	  initializeComponentCharsCollapsedState();
	  endLoad();
    });
  });

  function initializeComponentsCollapsedState() {
	$('tr.components').each(function() {
		var component_id = $(this).attr('id').match(/\d+/)[0];
		componentsCollapsedState[component_id] = true; //initially all collapsed
	});
  }
  
  function initializeComponentCharsCollapsedState() {
	$('.imaging_observation_characteristics').each(function() {
		var component_char_id = $(this).attr('id').match(/\d+/)[0];
		componentIOCharsCollapsedState[component_char_id] = true; //initially all collapsed
		$(".collapseAllComponents").click();
	});
	$('.anatomic_entity_characteristics').each(function() {
		var component_char_id = $(this).attr('id').match(/\d+/)[0];
		componentAECharsCollapsedState[component_char_id] = true; //initially all collapsed
		$(".collapseAllComponentCharacteristics").click();
	});
  }
  
  function waitCursor() {
    $("body").css("cursor","wait");
  }
  
  function normalCursor() {
    $("body").css("cursor","default");
  }
  
  $("#myTable3 td").live('click', function(){
    if ( $(this).css('background-color') == 'silver') {
      $(this).parent().children().css('backgroundColor', 'white');
      selectedRows3 = null;
    } else {
      $(this).parent().siblings().children().css('backgroundColor', 'white');
      selectedRows3 = ($(this).parent().children().css('backgroundColor', 'silver'));
    }
  });

  $("#deleteSelectedTerm").click(function() {
    if (selectedRows3 != null) {
      $(selectedRows3.parent()).remove();
      selectedRows3 = null;
      $.unblockUI();
    } else {
      $.blockUI({
        message: 'Select a "Selected Term" to delete first',
        timeout:'1000'
      });
    }
  });
	
	
  $("#createLexicon").click(function() {
    $.blockUI({
      message: $('#createLexiconMessage'),
      css:{
        top:'10%',
        width: '250px'
      }
    });
  });
  
  $("#doneCreatingLexicon").click(function(){
    data = $("#create_lexicon").serialize();
    $.get('/lexicon_terms/new_lexicon/0/', data, null, 'script') ;
    selectedLexicon = null;
  });

  $("#addTemplate").click(function() {
    $.blockUI({
      message: $('#addTemplateMessage'),
      css:{
        top:'10%',
        width: '250px'
      }
    });
  });

  $("#doneCreatingTemplate").live('click', function(){
    data = $("#create_template").serialize();
    $.post("/aim_templates", data, null, "script");
	selectedTemplate = null;
    $.unblockUI();
  });

  $("#cancelCreatingTemplate, #cancelCreatingLexicon").click(function(){
    $.unblockUI();
  });

  $("#cancelUploadingTemplateContainer").click(function(){
    $.unblockUI();
  });

  $("#deleteTemplate").click(function() {
    if (selectedTemplate != null) {
      $.blockUI({
        message: $('#deleteTemplateMessage'),
        css:{
          top:'20%'
        }
      });
    } else {
      $.blockUI({
        message: 'Select a Template to delete first',
        timeout:'1000'
      });
    }
  });

  $("#confirmDeleteTemplate").live('click', function(){
    $.get('/aim_templates/destroy/' + selectedTemplateId + '?container_id=' + selectedTemplateContainerId, null, null, 'script') ;
    selectedTemplate = null ;
    selectedTemplateId = null ;
    $.unblockUI() ;
  });

  $("#cancelDeleteTemplate").click(function(){
    $.unblockUI();
  });

  $("#editTemplate").click(function() {
    if(selectedTemplateId == null) {
		$.blockUI({
			message: 'Select a Template to edit first',
			timeout:'1000'
		});
    } else {
		$.get('aim_templates/edit/' + selectedTemplateId, null, null, 'script') ; // $('#editTemplateForm').load('/template_containers/edit/' + selectedTemplateContainerId) ;
		$.blockUI({
		  message: $('#editTemplateFormDiv'),
		  css:{
			top:'10%',
			width: '250px'
		  }
		});
	}
  });

  $("#doneEditingTemplate").live('click', function(){
    data1 = $("#editTemplateForm").serialize() ;
    $.ajax({
      url: '/aim_templates/update/' + selectedTemplateId + '?container_id=' + selectedTemplateContainerId,
      data: data1,
      type: 'put',
      dataType:'script',
	  success: function() {
		endLoad();
		initializeComponentsCollapsedState();
		initializeComponentCharsCollapsedState();
	  }
    });
	//selectedTemplate = null;
	//selectedTemplateId = null;
  });

  $("#cancelEditingTemplate").live('click', function() {
    $.unblockUI();
  });

  $("#copyTemplate").live('click', function () {
    //alert('copy 1');
    if(selectedTemplateId == null) {
	  $.blockUI({
        message: 'Select a Template to copy first',
        timeout:'1000'
      });
    } else {
      var previous_sel = selectedTemplateId ;
      //selectedTemplateId = null ;
      //selectedTemplate = null ;
      $.get('/aim_templates/copy/' + previous_sel + '?template_container_id=' + selectedTemplateContainerId, null, null, "script") ;
    }
  }
  ) ;

  $("#templateContainerList p").live('click', function() {
    if ( $(this).css('backgroundColor') == 'rgba(0, 0, 0, 0)' || $(this).css('backgroundColor') == 'transparent' ) {
      $(this).siblings().css('backgroundColor', '');
      selectedTemplateContainer = ($(this).css('backgroundColor', 'rgba(180, 180, 180, 0.7)'));
      selectedTemplateContainerId = ($(this).attr('id')).match(/\d+/)[0] ;
      //$('#myTable').html($(this).css('backgroundColor')) ;
      $('#templateGroupTableDiv').load('/main/select_template_container/' + selectedTemplateContainerId) ;
      $('#availableTemplatesTableBody').load('/template_containers/included_templates/' + selectedTemplateContainerId, endLoad) ;
    //alert('/main/select_template_container/' + $(this).attr('id'));
    }
    else {
      $(this).css('backgroundColor', '');
      selectedTemplateContainer = null;
      selectedTemplateContainerId = null ;
      $('#templateGroupTableDiv').load('/main/select_template_container/') ;
      $('#availableTemplatesTableBody').load('/template_containers/included_templates/foobar', endLoad) ;
    }
  });

  $("#downloadTemplateContainer").click(function(event){
    if ( selectedTemplateContainerId ) {
      $.get('/main/download_request/' + selectedTemplateContainerId, null, null, 'script') ;
    }
    else {
	  $.blockUI({
        message: 'Select a Template Container to download first',
        timeout:'1000'
      });
    }
  });

  $("#uploadTemplateContainer").click(function() {
    $.blockUI({
      message: $('#templateContainerUploadForm'),
      css:{
        top:'20%',
        width: '300px'
      }
    });
  });

  $("#addTemplateContainer").click(function() {
    $.blockUI({
      message: $('#addTemplateContainerMessage'),
      css:{
        top:'20%',
        width: '270px'
      }
    });
  });

  $("#doneCreatingTemplateContainer").live('click', function(){
    data1 = $("#create_template_container").serialize();
    $.post("/template_containers", data1, endLoad, "script");
	selectedTemplateContainer = null;
  });

  $("#cancelCreatingTemplateContainer").click(function(){
    $.unblockUI();
  });


  $("#deleteTemplateContainer").click(function() {
    if (selectedTemplateContainer != null) {
      $.blockUI({
        message: $('#deleteTemplateContainerMessage'),
        css:{
          top:'20%'
        }
      });
    } else {
      $.blockUI({
        message: 'Select a Template Container to delete first',
        timeout:'1000'
      });
    }
  });

  $("#confirmDeleteTemplateContainer").click(function(){
    $.get('/template_containers/destroy/' + selectedTemplateContainerId, null, endLoad, 'script');
    selectedTemplateContainer = null;
    selectedTemplateContainerId = null;
    //$.unblockUI();
  });

  $("#cancelDeleteTemplateContainer").click(function(){
    $.unblockUI();
  });

  $("#editTemplateContainer").click(function() {
	if(selectedTemplateContainerId == null) {
	  $.blockUI({
        message: 'Select a Template Container to edit first',
        timeout:'1000'
      });
    } else {
		$('#editTemplateContainerForm').load('/template_containers/edit/' + selectedTemplateContainerId) ;
		$.blockUI({
		  message: $('#editTemplateContainerForm'),
		  css:{
			top:'20%',
			width: '250px'
		  }
		});
	}
  });

  $("#doneEditingTemplateContainer").live('click', function() {
    data1 = $("#edit_template_container").serialize() ;
    $.ajax({
      url: '/template_containers/update/' + selectedTemplateContainerId,
      data: data1,
      type: 'put',
      dataType:'script',
	  success: endLoad
    });
	//selectedTemplateContainer = null;
    //selectedTemplateContainerId = null;
  });

  $("#cancelEditingTemplateContainer").live('click', function(){
    $.unblockUI();
  });

  // Function to select or unselect a row in the Included Templates table by clicking
  $("#includedTemplates>tbody>tr>td").live('click', function() {
    if ( $(this).css('backgroundColor') == 'silver') {
      $(this).parent().find("td").css('backgroundColor', 'white');
      selectedIncludedTemplate = null;
    } else {
      $(this).parent().siblings().find("td").css('backgroundColor', 'white');
      selectedIncludedTemplate = $(this).parent();
      selectedIncludedTemplateId = $(this).parent().attr('id');
      $(selectedIncludedTemplate).find("td").css('backgroundColor', 'silver');
    }
  });
  
  visited = 0;
  // Function to select or unselect a row in the Template table by clicking
  $(".componentTable tbody>tr>td.editableText").live('click', function() {
    //var this = $(e.this);
    if ( $(this).css('background-color') == 'rgb(255, 255, 255)' ) {
      if (selectedRows != null) {
        selectedRows.children().css('background-color', selectedRowsBg);
      }
      selectedRows = $(this).parent();
      selectedComponentId = $(this).parents('.componentTable').attr('id').match(/\d+/)[0] ;
      selectedRowsBg = $(this).css('background-color') ;
      if (selectedRows.hasClass('allowed_terms') || selectedRows.hasClass('non_quantifiables')) isSelectedAllowedTerm = true;
      else isSelectedAllowedTerm = false;
      selectedRows.children().css('background-color', 'silver');
      return false;
    } else {
      isSelectedAllowedTerm = false;
      selectedRows.children().css('background-color', selectedRowsBg);
      selectedRows = null;
      selectedComponentId = null ;
      return false;
    }
  });
  
  // Function to select or unselect a row in the AllowedTerms table by clicking; the same variable stores the selected row bec.
  // you can only have either an Allowed Terms row or a Component row selected at once.
  $(".allowedTermsTable>thead>tr>th, .nonQuantifiableTable>thead>tr>th").live('click', function() {
    if ( $(this).css('background-color') == 'rgb(255, 255, 255)' || $(this).css('background-color') == 'rgb(230, 238, 238)' ) {
      if (selectedRows != null) {
        selectedRows.children().css('background-color', selectedRowsBg);
      }
      selectedRows = $(this).parent();
      selectedRowsBg = $(this).css('background-color');
      isSelectedAllowedTerm = true;
      selectedRows.children().css('background-color', 'silver'); //silver
    }
    else {
      selectedRows.children().css('background-color', selectedRowsBg);
      selectedRows = null;
      isSelectedAllowedTerm = false;
    }
  });

  var node_id = 0;

  function collapseAllComponents(o) {
    o.children('.collapseComponent').click();
	o.parents('tr.components').each(function() {
		var component_id = $(this).attr('id').match(/\d+/)[0];
		componentsCollapsedState[component_id] = true; //collapsed
	});
  }
  
  function expandAllComponents(o) {
    o.children('.expandComponent').click();
	o.parents('tr.components').each(function() {
		var component_id = $(this).attr('id').match(/\d+/)[0];
		componentsCollapsedState[component_id] = false; //expanded
	});
  }
  
  //Collapse All Components using the "Collapse All" link in the template pane
  $(".collapseAllComponents").live('click', function() {
    collapseAllComponents($(".componentTable .components>td"));
    $(this).removeClass('collapseAllComponents').addClass('expandAllComponents').find('img.expandCollapseImg').attr('src','/images/Expandable8x8.png').next().
    text('Expand All');
  });
  
  //Collapse All Components using the icon in the bottom bar
  $("#collapseAllComponents").click( function() {
    $(".collapseAllComponents").click();
  });
  
  //Expand All Components using the "Expand All" link in the template pane
  $(".expandAllComponents").live('click', function() {
    expandAllComponents($(".componentTable .components>td"));
    $(this).removeClass('expandAllComponents').addClass('collapseAllComponents').find('img.expandCollapseImg').attr('src','/images/Expanded8x8.png').next().text('Collapse All');
  });
  
  //Expand All Components using the icon in the bottom bar
  $("#expandAllComponents").click( function() {
    $(".expandAllComponents").click();
  });
  
  $('.expandSection').live('click',function () {
    $(this).removeClass('expandSection').addClass('collapseSection').find('img.expandCollapseImg').attr('src','/images/Expanded8x8.png');
    $(this).parent('div').next().show('fast');
  });
  
  $('.collapseSection').live('click',function () {
    $(this).removeClass('collapseSection').addClass('expandSection').find('img.expandCollapseImg').attr('src','/images/Expandable8x8.png');
    $(this).parent('div').next().hide('fast');
  });
  
  var initialClass;
  var selection;
  var url2delete ;
  // Function to ensure that only Imaging Observation or Anatomic Entity can have child entries added
  function aim_class2() {
    var url2add = $(selection).attr('value');
    var data ;
    url2add == 'calculations' ? data = '&data%5Bdescription%5D=' : data = '&data%5BannotatorConfidence%5D=false' ;
    var componentId = $(selection).parents('.components').attr('id').match(/\d+/)[0] ;
    //alert(componentId) ;
    $.get('/' + url2add + '/add_row/0/?object=' + url2add + '&parent_object=component&parent_id=' + componentId + data + '&aim_template_id=' + selectedTemplateId + '&no_refresh=true', null, null, 'script') ; // create new component type object
  //$.get('/' + url2add + '/add_row/0/?object=' + url2add + '&parent_object=component&parent_id=' + componentId + data + '&aim_template_id=' + selectedTemplateId +'&no_refresh=true', null, aim_class2(), 'script') ; // create new component type object
  }

  function aim_class1() {
    var attribute = 'component_type' ; //$(this).attr('class') ;
    var value = $(selection).find("option:selected").attr('class') ; // $(this).val();
    var objectType = 'components' ; //$(this).parents("[name='element']").attr('class') ;
    var objectId = $(selection).parents("[name='element']").attr('id').match(/\d+/)[0] ;
    //alert('/' + objectType + '/update_attribute/' + objectId + '?object=' + objectType + '&attribute=' + attribute + '&value=' + value + '&aim_template_id=' + selectedTemplateId);
    $.get('/' + objectType + '/update_attribute/' + objectId + '?object=' + objectType + '&attribute=' + attribute + '&value=' + value + '&aim_template_id=' + selectedTemplateId + '&no_refresh=true', null, aim_class2(), 'script') ;
  //$.get('/' + objectType + '/update_attribute/' + objectId + '?object=' + objectType + '&attribute=' + attribute + '&value=' + value + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  }
  $(".aim_class").live('mousedown', function() {
    selection = this;
    initialClass = $(this).find("option:selected").text() ; // .attr('value') ;
    url2delete = $(this).attr('value') ;
  //alert(initialClass);
  }).live('change', function() {
    var parent_row = $(this).parents('tr[name=element]:first') ;
    //var rowId = parent_row.attr('id') ;
    //alert(rowId);
    if ( parent_row.find('.characteristicsTable>tbody>tr').length > 0) {
      alert("This Template Component already has Characteristics defined. Delete the Characteristics first before changing AIM Class. Reverting AIM Class to " + initialClass);
      $(selection).attr('value', url2delete) ;
    } else {
      // first, delete the existing component type object (transparent to the user):
      //var componentTypeObjectId = $(selection).attr('id').match(/\d+/)[0] ; // parent_row.find('.aim_class').attr('id').match(/\d+/)[0] ;
      //alert('/' + url2delete + '/delete_row/' + componentTypeObjectId + '?object=' + url2delete + '&aim_template_id=' + selectedTemplateId + '&no_refresh=true');
      //$.get('/' + url2delete + '/delete_row/' + componentTypeObjectId + '?object=' + url2delete + '&aim_template_id=' + selectedTemplateId, null, aim_class1(), 'script') ; // delete old component type object
      var obj = $(selection).attr('value');
      var data ;
      obj == 'calculations' ? data = '&data%5Bdescription%5D=' : data = '&data%5BannotatorConfidence%5D=false' ;
      //alert('/components/aim_class/' + $(this).parents('.components').attr('id').match(/\d+/)[0] + '?object=' + obj + data + '&aim_template_id=' + selectedTemplateId) ;
      $.get('/components/aim_class/' + $(this).parents('.components').attr('id').match(/\d+/)[0] + '?object=' + obj + data + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
    }
  });
  
  $(".component_order").live('mousedown', function() {
    selection = this;
    initialClass = $(this).find("option:selected").text() ; // .attr('value') ;
  //alert(initialClass);
  }).live('change', function() {
    var sortValue = $(this).find("option:selected").attr('value') ;
    $.get('/components/sort/' + selectedTemplateId + '?value=' + sortValue, null, null, 'script') ;
  });

  //Function to handle checkboxes for Display in Component attrs
  $(":checkbox.shouldDisplay").live('click',function () {
    var value;
    if ($(this).is(':checked')) {
      value = 'true';
    } else {
      value = 'false';
    }
    var attribute = 'shouldDisplay' ; //$(this).attr('class') ;
    var objectType = $(this).parents("[name='element']").attr('class') ;
    var id = $(this).parents("[name='element']").attr('id').match(/\d+/)[0];
    $.get('/' + objectType + '/update_attribute/' + id + '?object=' + objectType + '&attribute=' + attribute + '&value=' + value + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });
  
  //Function to handle checkboxes for Confidence in Component attrs
  $(":checkbox.annotatorConfidence").live('click',function () {
    var value;
    if ($(this).is(':checked')) {
      value = 'true';
    } else {
      value = 'false';
    }
    var attribute = 'annotatorConfidence'; //$(this).attr('class') ;
    var objectType = $(this).parents("[name='element']").attr('class') ;
    var id = $(this).parents("[name='element']").attr('id').match(/\d+/)[0];
    if (objectType == "components") {
      objectType = $(this).parents("tr:first").find('.aim_class').val() ;
      id = $(this).parents("tr:first").find('.aim_class').attr('id').match(/\d+/)[0];
    }
    //alert(objectType + " " + id);
    $.get('/' + objectType + '/update_attribute/' + id + '?object=' + objectType + '&attribute=' + attribute + '&value=' + value + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });
  
  //Function to handle checkboxes for Allowed Terms in Component
  $(":checkbox.askIfPresent").live('click',function () {
    var attribute = 'askIfPresent'; //$(this).attr('class') ;
    var parentType = 'allowed_terms'; //$(this).parents("[name='element']").attr('class') ;
    var parentId = $(this).parents("[name='element']").attr('id').match(/\d+/)[0];
    var attrValues = '&data%5BcodeMeaning%5D=Present&data%5BcodeValue%5D=G-A203&data%5BcodingSchemeDesignator%5D=SRT';
    if ($(this).is(':checked')) {
      $.get('/' + parentType + '/add_row/' + parentId + '?object=' + 'non_quantifiables' + '&parent_object=' + parentType + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId + attrValues, null, null, 'script') ;
    } else {
      var objectId = $(this).attr('id').match(/\d+/)[0];
      $.get('non_quantifiables/delete_row/' + objectId + '?object=' + 'non_quantifiables' + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
    }
  });
  
  $('.editCalculation').live('click', function() {
    var parent_row = $(this).parents('tr');
    var rowId = parent_row.attr('id');
    var edit_calc_id = rowId + "-editCalc";
    $.blockUI({
      message: $("#" + edit_calc_id),
      css : {
        top:'20%',
        left:'35%',
        width: '250px',
        cursor: 'auto',
        "min-width": '250px'
      }
    });
  });
  
  $('.doneEditingCalculation').live('click', function() {
    $.unblockUI();
  });

  $('.cancelEditingCalculation').live('click', function() {
    $.unblockUI();
  });
  
  var quant_icon;
  var quant_icon_id;
  // Function to add a quantification to an Imaging Observation or an Anatomic Entity
  $(".addQuantification").live('dblclick', function() {
    var parentId = $(this).parents("[name='element']").attr('id').match(/\d+/)[0];
    //var parentType = 'allowed_terms'; // $(this).attr('name')
    $.get('/allowed_terms/add_row/0/?object=characteristic_quantifications&data%5Bname%5D=&data%5BannotatorConfidence%5D=false&parent_object=allowed_terms' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });
  
  $(".addQuantification").live('click', addQuant);
  
  function addQuant() {
    //this = $(".addQuantification");
	$(this).unbind('click');
	var parentId = $(this).parents("[name='element']").attr('id').match(/\d+/)[0];
    //var parentType = 'allowed_terms'; // $(this).attr('name')
	$.get('/allowed_terms/add_row/0/?object=characteristic_quantifications&data%5Bname%5D=&data%5BannotatorConfidence%5D=false&parent_object=allowed_terms' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, $(".addQuantification").bind('click', addQuant), null, 'script') ;
  };

  // Function to add a quantification to an Imaging Observation or an Anatomic Entity
  $(".deleteQuantification").live('click', function() {
    var quantId = $(this).attr('id').match(/\d+/)[0];
    $.get('characteristic_quantifications/delete_row/' + quantId + '?object=characteristic_quantifications&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });
  
  // Function to add a row in Non-Quantifiable table
  $(".addNonQuantifiableRow").live('click',function() {
    var parentId = $(this).attr('id').match(/\d+/)[0] ;
    //var parentType = 'characteristic_quantifications' ;// $(this).attr('name')
    $.get('/characteristic_quantifications/add_row/0/?object=non_quantifiables&data%5BcodeValue%5D=&data%5BcodeMeaning%5D=&data%5BcodingSchemeDesignator%5D=&parent_object=characteristic_quantifications' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });

  // Function to delete a selected row in Non-Quantifiable table
  $(".deleteNonQuantifiableRow").live('click',function() {
    var nonQuantifiableTableRows = $(this).parent().siblings(".nonQuantifiableTable").find("input:checked");
    if (nonQuantifiableTableRows.size() == 1) {
      var nonQuantifiableTableRow = nonQuantifiableTableRows.parents('tr:first');
	  // if ( $(this).parent().siblings(".intervalTable").find("tr").size() - intervalTableRows.size() < 3 ) {
      // alert('Interval table needs to have atleast two entries');
      // } else {
      var objectId = $(nonQuantifiableTableRow).attr('id').match(/\d+/)[0];
      var objectType = 'non_quantifiables'; //$(nonQuantifiableTableRow).attr('class');
      $.get('/' + objectType + '/delete_row/' + objectId + '?object=' + objectType + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
    } else {
      alert('Check only one non-quantifiable row checkbox to delete');
	  endLoad();
    }
  });
  
  // Function to select / deselect the rows in Non-Quantifiable table
  $(".nonQuantifiableTable td").live('click', function() {
    if ( $(this).css('background-color') == 'white') {
      selectedNonQuantRow = $(this).parent();
      selectedNonQuantRow.siblings().children().css('backgroundColor', 'white');
      selectedNonQuantRow.children().css('backgroundColor', 'silver');
    } else {
      $(this).parent().children().css('backgroundColor', 'white');
      selectedNonQuantRow = null;
    }
  }) ;

  $(".deleteQuantile").live('click',function() {
    var objectId = $(this).attr('id').match(/\d+/)[0];
    var objectType = 'quantiles'; //$(this).attr('class');
    $.get('/' + objectType + '/delete_row/' + objectId + '?object=' + objectType + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });
  
  $(".deleteScale").live('click',function() {
    var objectId = $(this).attr('id').match(/\d+/)[0];
    var objectType = 'scales'; //$(this).attr('class');
    $.get('/' + objectType + '/delete_row/' + objectId + '?object=' + objectType + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });
  
  $(".addIntervalTableRow").live('click', function() {
    var parentId = $(this).attr('id').match(/\d+/)[0] ;
    var parentType = 'characteristic_quantifications' // $(this).attr('name') ;
    $.get('/characteristic_quantifications/add_row/0/?object=intervals&data%5BminValue%5D=0&data%5BmaxValue%5D=1&data%5BminOperator%5D=LessThan&data%5BmaxOperator%5D=LessThan&data%5BucumString%5D=meter&parent_object=characteristic_quantifications' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  }) ;

  $(".deleteIntervalTableRow").live('click',function() {
    var intervalTableRows = $(this).parent().siblings(".intervalTable").find("input:checked");
    if (intervalTableRows.size() == 1) {
      var intervalTableRow = intervalTableRows.parents('tr:first');
      // if ( $(this).parent().siblings(".intervalTable").find("tr").size() - intervalTableRows.size() < 3 ) {
      // alert('Interval table needs to have atleast two entries');
      // } else {
      var objectId = $(intervalTableRow).attr('id').match(/\d+/)[0];
      var objectType = 'intervals' ; // $(intervalTableRow).attr('class');
      $.get('/' + objectType + '/delete_row/' + objectId + '?object=' + objectType + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
    } else {
      alert('Check only one interval table row to delete');
	  endLoad();
    }
  });

  $(".addNumericalTableRow").live('click',function() {
    var parentId = $(this).attr('id').match(/\d+/)[0] ;
    //var parentType = 'characteristic_quantifications' // $(this).attr('name') ;
    $.get('/characteristic_quantifications/add_row/0/?object=numericals&data%5Bvalue%5D=1&data%5Boperator%5D=LessThan&data%5BucumString%5D=meter&parent_object=characteristic_quantifications' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
  });

  $(".deleteNumericalTableRow").live('click',function() {
    var numericalTableRows = $(this).parent().siblings(".numericalTable").find("input:checked");
    if (numericalTableRows.size() == 1) {
      var numericalTableRow = numericalTableRows.parents('tr:first');
      //if ( $(this).parent().siblings(".numericalTable").find("tr").size() - numericalTableRows.size() < 2 ) {
      //  alert('Numerical table needs to have atleast one entry');
      //} else {
      var objectId = $(numericalTableRow).attr('id').match(/\d+/)[0];
      var objectType = 'numericals'; //$(numericalTableRow).attr('class');
      $.get('/' + objectType + '/delete_row/' + objectId + '?object=' + objectType + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
    } else {
      alert('Check only one numerical table row to delete');
	  endLoad();
    }
  });

  $(".addOrdinalLevelTableRow").live('click',function() {
    var parentId = $(this).attr('id').match(/\d+/)[0] ;
    //var parentType = 'characteristic_quantifications' // $(this).attr('name') ;
    $.get('/scales/add_row/0/?object=ordinal_levels&data%5BintegerValue%5D=0&parent_object=scales' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;

  });

  $(".deleteOrdinalLevelTableRow").live('click',function() {
    var scaleTableRows = $(this).parent().siblings(".ordinalLevelTable").find("input:checked");
    if (scaleTableRows.size() == 1) {
      var scaleTableRow = scaleTableRows.parents('tr:first');
      // if ( $(this).parent().siblings(".ordinalLevelTable").find("tr").size() - scaleTableRow.size() < 3 ) {
      // alert('Scale table needs to have atleast two entries');
      // } else {
      var objectId = $(scaleTableRow).attr('id').match(/\d+/)[0];
      var objectType = 'ordinal_levels'; //$(scaleTableRow).attr('class');
      $.get('/' + objectType + '/delete_row/' + objectId + '?object=' + objectType + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
    } else {
      alert('Check only one scale table row to delete');
	  endLoad();
    }
  });

  function collapseAllComponentCharacteristics(o) {
    //Seems to be slower for large number of characteristics
    //o.children('.collapseComponentCharacteristic').click();
    var coll = o.children('.collapseComponentCharacteristic');
    $(coll).attr('src','/images/Expandable16x16.png');
    $(coll).addClass('expandComponentCharacteristic').removeClass('collapseComponentCharacteristic');
    $(coll).parents('tr.anatomic_entity_characteristics, tr.imaging_observation_characteristics').find('.componentCharacteristicInfo').slideUp('fast');
	o.parents('tr.anatomic_entity_characteristics, tr.imaging_observation_characteristics').each( function () { 
		var objectId = $(this).attr('id').match(/\d+/)[0];
		var objectType = $(this).attr('class');
		if (objectType == 'anatomic_entity_characteristics') {
			componentAECharsCollapsedState[objectId] = true; // collapsed
		} else {
			componentIOCharsCollapsedState[objectId] = true; // collapsed
		}
	});
  }
  
  function expandAllComponentCharacteristics(o) {
    //Seems to be slower for large number of characteristics
    //o.children('.expandComponentCharacteristic').click();
    var coll = o.children('.expandComponentCharacteristic');
    $(coll).attr('src','/images/Expanded16x16.png');
    $(coll).addClass('collapseComponentCharacteristic').removeClass('expandComponentCharacteristic');
    $(coll).parents('tr.anatomic_entity_characteristics, tr.imaging_observation_characteristics').find('.componentCharacteristicInfo').slideDown('fast');
	o.parents('tr.anatomic_entity_characteristics, tr.imaging_observation_characteristics').each( function () { 
		var objectId = $(this).attr('id').match(/\d+/)[0];
		var objectType = $(this).attr('class');
		if (objectType == 'anatomic_entity_characteristics') {
			componentAECharsCollapsedState[objectId] = false; // expanded
		} else {
			componentIOCharsCollapsedState[objectId] = false; // expanded
		}
	});
  }
  
  $(".collapseAllComponentCharacteristics").live('click', function() {
    var characteristicsTable = $(this).parents('.characteristicsSection').find('.characteristicsTable');
    collapseAllComponentCharacteristics(characteristicsTable.find('tbody>tr>td'));
    $(this).removeClass('collapseAllComponentCharacteristics').addClass('expandAllComponentCharacteristics').find('img.expandCollapseImg').attr('src','/images/Expandable8x8.png').next().text('Expand All');
  });
  
  $(".expandAllComponentCharacteristics").live('click', function() {
    var characteristicsTable = $(this).parents('.characteristicsSection').find('.characteristicsTable');
    expandAllComponentCharacteristics(characteristicsTable.find('tbody>tr>td'));
    $(this).removeClass('expandAllComponentCharacteristics').addClass('collapseAllComponentCharacteristics').find('img.expandCollapseImg').attr('src','/images/Expanded8x8.png').next().text('Collapse All');
  });
  
  // Function to add an Anatomic Entity Characteristic to the template table
  $(".addAnatomicEntityCharacteristic").live('click', function() {
    var parentId = $(this).attr('id').match(/\d+/) ;
    parentId == null ? parentId = '' : parentId = parentId[0] ;
	var component_id = $(this).parents('tr.components').attr('id');
    //alert(parentId) ;
    //var parentType = 'imaging_observations' ;// $(this).attr('name')
    //alert('imaging_observations/add_row/0/?object=imaging_observation_characteristic&parent_object=imaging_observations' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId);
    var next = $(this).siblings('.componentInfo').children('.componentCharacteristicAttrs').length + 1 ;
    if(parentId != '') {
      //alert('imaging_observations/add_row/0/?object=imaging_observation_characteristic&parent_object=imaging_observations' + '&parent_id=' + parentId + '&grandparent=components&grandparent_id=' + grandparentId + '&aim_template_id=' + selectedTemplateId);
      $.get('/anatomic_entity_characteristics/add_row/0/?object=anatomic_entity_characteristic&data%5Blabel%5D=&data%5BminCardinality%5D=1&data%5BmaxCardinality%5D=1&data%5BshouldDisplay%5D=false&data%5BannotatorConfidence%5D=false&data%5BitemNumber%5D=' + next + '&parent_object=anatomic_entities' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
    }
    else {
      $.get('/anatomic_entity_characteristics/add_row/0/?object=anatomic_entity_characteristic&parent_object=anatomic_entities&data%5Blabel%5D=&data%5BminCardinality%5D=1&data%5BmaxCardinality%5D=1&data%5BshouldDisplay%5D=false&data%5BannotatorConfidence%5D=false&data%5BitemNumber%5D=' + next + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, null, function() {
		var component_char_id = $('tr.components#'+component_id+' tr.anatomic_entity_characteristics').attr('id').match(/\d+/)[0];
		componentAECharsCollapsedState[component_char_id] = false; //expanded
	  }, 'script') ;
    }
  //var parentType = 'anatomic_entities' ;// $(this).attr('name')
  });
  
  // Function to add an Imaging Observation Characteristic to the template table
  $(".addImagingObservationCharacteristic").live('click', function() {
    var parentId = $(this).attr('id').match(/\d+/) ;
    var next = $(this).siblings('.componentInfo').children('.componentCharacteristicAttrs').length + 1 ;
    parentId == null ? parentId = '' : parentId = parentId[0] ;
	var component_id = $(this).parents('tr.components').attr('id');
    //var parentType = 'imaging_observations' ;// $(this).attr('name')
    //alert('imaging_observations/add_row/0/?object=imaging_observation_characteristic&parent_object=imaging_observations' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId);
    if(parentId != '') {
      //alert('imaging_observations/add_row/0/?object=imaging_observation_characteristic&parent_object=imaging_observations' + '&parent_id=' + parentId + '&grandparent=components&grandparent_id=' + grandparentId + '&aim_template_id=' + selectedTemplateId);
      $.get('/imaging_observations/add_row/0/?object=imaging_observation_characteristic&data%5Blabel%5D=&data%5BminCardinality%5D=1&data%5BmaxCardinality%5D=1&data%5BshouldDisplay%5D=false&data%5BannotatorConfidence%5D=false&data%5BitemNumber%5D=' + next + '&parent_object=imaging_observations' + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId, null, function() {
		var component_char_id = $('tr.components#'+component_id+' tr.imaging_observation_characteristics').attr('id').match(/\d+/)[0];
		componentIOCharsCollapsedState[component_char_id] = false; //expanded
	  }, 'script') ;
    }
    else {
      grandparentId = $(this).parents('.components').attr('id').match(/\d+/)[0] ;
      //alert('imaging_observations/add_row/0/?object=imaging_observation_characteristic&parent_object=imaging_observations' + '&parent_id=' + parentId + '&grandparent=components&grandparent_id=' + grandparentId + '&aim_template_id=' + selectedTemplateId);
      $.get('/imaging_observations/add_row/0/?object=imaging_observation_characteristic&data%5Blabel%5D=&data%5BminCardinality%5D=1&data%5BmaxCardinality%5D=1&data%5BshouldDisplay%5D=false&data%5BannotatorConfidence%5D=false&data%5BitemNumber%5D=' + next + '&parent_object=imaging_observations' + '&parent_id=' + parentId + '&grandparent=components&grandparent_id=' + grandparentId + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
    }
  });

  //Function to delete the selected Component Characteristic
  $(".deleteComponentCharacteristic").live('click', function () {
    if (selectedRows != null && selectedRows.hasClass("componentCharacteristicAttrs") ) {
      $.blockUI({
        message: $('#deleteComponentCharacteristicMessage'),
        css:{
          top:'20%'
        }
      });
    } else {
      $.blockUI({
        message: 'Select a Component Characteristic to delete first',
        timeout: '2000'
      });
    }
  });
  
  // Function to delete an Anatomic Entity Characteristic or Imaging Observation Characteristic
  $("#confirmDeleteComponentCharacteristic").live('click', function () {
    var objectId = selectedRows.parents('[name=element]').attr('id').match(/\d+/)[0];
    var objectType = selectedRows.parents('[name=element]').attr('class') ;
    selectedRows = null;
    $.get('/' + objectType + '/delete_row/' + objectId + '?object=' + objectType + '&aim_template_id=' + selectedTemplateId, null, null, 'script') ;
	if (objectType == 'anatomic_entity_characteristics') {
		delete componentAECharsCollapsedState[objectId];
	} else {
		delete componentIOCharsCollapsedState[objectId];
	}
  });
  
  $("#cancelDeleteComponentCharacteristic").click(function(){
    $.unblockUI();
  });
  
  // Function to expand an entry in the Template Component table
  $(".expandComponent").live('click', function() {
    $(this).attr('src','/images/Expanded16x16.png');
    $(this).addClass('collapseComponent').removeClass('expandComponent');
    $(this).parents('tr.components').find('.componentInfo').slideDown('slow');
	var component_id = $(this).parents('tr.components').attr('id').match(/\d+/)[0];
	componentsCollapsedState[component_id] = false; //expanded
  });
	
  // Function to collapse an entry in the Template Component table
  $(".collapseComponent").live('click', function() {
    $(this).attr('src','/images/Expandable16x16.png');
    $(this).addClass('expandComponent').removeClass('collapseComponent');
    $(this).parents('tr.components').find('.componentInfo').slideUp('slow');
	var component_id = $(this).parents('tr.components').attr('id').match(/\d+/)[0];
	componentsCollapsedState[component_id] = true; //collapsed
  });

  // Function to expand an entry in the Component Characteristic table
  $(".expandComponentCharacteristic").live('click', function() {
    $(this).attr('src','/images/Expanded16x16.png');
    $(this).addClass('collapseComponentCharacteristic').removeClass('expandComponentCharacteristic');
    $(this).parents('tr.anatomic_entity_characteristics, tr.imaging_observation_characteristics').find('.componentCharacteristicInfo').slideDown('fast');
	var component_char_id = $(this).parents('tr:first').attr('id').match(/\d+/)[0];
	if ($(this).parents('tr:first').hasClass('anatomic_entity_characteristics')) {
		componentAECharsCollapsedState[component_char_id] = false; //expanded
	} else {
		componentIOCharsCollapsedState[component_char_id] = false; //expanded
	}
  });
	
  // Function to collapse an entry in the Component Characteristic table
  $(".collapseComponentCharacteristic").live('click', function() {
    $(this).attr('src','/images/Expandable16x16.png');
    $(this).addClass('expandComponentCharacteristic').removeClass('collapseComponentCharacteristic');
    $(this).parents('tr.anatomic_entity_characteristics, tr.imaging_observation_characteristics').find('.componentCharacteristicInfo').slideUp('fast');
	var component_char_id = $(this).parents('tr:first').attr('id').match(/\d+/)[0];
	if ($(this).parents('tr:first').hasClass('anatomic_entity_characteristics')) {
		componentAECharsCollapsedState[component_char_id] = true; //collapsed
	} else {
		componentIOCharsCollapsedState[component_char_id] = true; //collapsed
	}
  });

  // Function to expand an entry in the Lexicon Terms table
  $(".expandLexiconTerm").live('click', function() {
    $(this).attr('src','/images/Expanded16x16.png');
    $(this).addClass('collapseLexiconTerm').removeClass('expandLexiconTerm');
    $(this).parents('tr.lexicon_terms').next().find('.child_lexicon_terms').slideDown();
  });
	
  // Function to collapse an entry in the Lexicon Terms table
  $(".collapseLexiconTerm").live('click', function() {
    $(this).attr('src','/images/Expandable16x16.png');
    $(this).addClass('expandLexiconTerm').removeClass('collapseLexiconTerm');
    $(this).parents('tr.lexicon_terms').next().find('.child_lexicon_terms').slideUp();
  });
  
  // Function to add a new parent row to the template table
  $("#createComponent").live('click', function() {
    if (selectedTemplateId != null) {
		$.get('/components/add_row/0/?object=components&parent_object=aim_templates' + '&parent_id=' + selectedTemplateId + '&aim_template_id=' + selectedTemplateId + '&data%5Bcomponent_type%5D=anatomic_entity&data%5BitemNumber%5D=' + Number($('.componentTable').length) + Number(1) + '&data%5BshouldDisplay%5D=false&data%5BminCardinality%5D=1&data%5BmaxCardinality%5D=1&data%5Blabel%5D=&data%5Bcomponent_type%5D=anatomic_entity&no_refresh=true', null, function() {
			$.get('/anatomic_entities/add_row/0/?object=anatomic_entity&parent_object=component&parent_id=last&data%5BannotatorConfidence%5D=false&aim_template_id=' + selectedTemplateId, null, function() {
			collapseAllComponents($(".componentTable:not(':last')").find('.components>td'));
			var component_id = $('tr.components:last').attr('id').match(/\d+/)[0];
			componentsCollapsedState[component_id] = false; //expanded
			}, 'script');
		}, 'script') ;
	} else {
		$.blockUI({
        message: 'Select a Template before creating a Template Component',
        timeout:'1000'
      });
	}
  });
  
  $("#deleteComponent").click(function() {
    if (selectedRows != null && selectedRows.hasClass("componentAttrs")) {
      $.blockUI({
        message: $('#deleteComponentMessage'),
        css:{
          top:'20%'
        }
      });
    } else {
      $.blockUI({
        message: 'Select a Template Component to delete first',
        timeout:'1000'
      });
    }
  });

  // Function to delete a template component from the Template table
  $("#confirmDeleteComponent").click(function(){
    $.get('/components/destroy/' + selectedComponentId, null, function() {
	  delete componentsCollapsedState[selectedComponentId];
    }, 'script');
    $(".collapseAllComponents").click();
    selectedRows = null;
  });

  $("#cancelDeleteComponent").click(function(){
    $.unblockUI();
  });

  // Function to copy a Template Component from Template table
  $("#copyComponent").live('click', function() {
    if (selectedRows != null) {
      $.get('/components/copy/' + selectedComponentId + '?aim_template_id=' + selectedTemplateId, null, function() {
		$(".collapseAllComponents").click();
	  }, 'script') ;
      selectedRows = null ;
    } else {
      $.blockUI({
        message: 'Select a Template Component to copy first',
        timeout:'1000'
      });
    }
  });

  // Function to select or unselect a row in the Lexicon table by clicking
  $("#myTable4 td, #myTable4 tr.lexiconTermChildrenTableHeader th").live('click', function(){
    if ( $(this).css('background-color') == 'silver') {
      $(this).parent().children().css('backgroundColor', selectedRowsBg4) ;
      selectedRows4 = null ;
      lexiconTermId = "";
    } else {
      if (selectedRows4 != null) selectedRows4.children().css('backgroundColor', selectedRowsBg4) ;
      selectedRows4 = $(this).parent() ;
      selectedRowsBg4 = $(this).css('background-color') ;
      lexiconTermId = selectedRows4.attr('id').match(/\d+/)[0] ;
      selectedRows4.children().css('backgroundColor', 'silver') ;
    }
    return false;
  });

  $("#createLexiconEntry").live('click', function() {
    if(selectedLexiconId != null) {
	  var parentId = lexiconTermId;
      $.get('/lexicon_terms/add_row/0/?object=lexicon_terms&parent_object=lexicon_terms&parent_id=' + parentId + '&file=%2Flexicon_terms%2Frefresh_terms.js.erb&data%5BlexiconName%5D=' + selectedLexiconId, null, null, 'script') ;
      lexiconTermId = "";
    }
    else {
      $.blockUI({
        message: 'Select a Lexicon before creating a Lexicon Term',
        timeout:'1000'
      });
    }
  }) ;

  $("#deleteLexiconEntry").click(function() {
    if (selectedRows4 != null) {
      $.blockUI({
        message: $('#deleteLexiconEntryMessage'),
        css:{
          top:'20%'
        }
      });
    } else {
      $.blockUI({
        message: 'Select a Lexicon Term to delete first',
        timeout:'1000'
      });
    }
  });
  
  $("#confirmDeleteLexiconEntry").live('click', function() {
    var lexiconRow = selectedRows4 ;
    var lexiconRowClass = lexiconRow.attr("class") ;
    lexiconRowClass = lexiconRowClass.match(/child-of[-\w]+/) ;
    $.get('/lexicon_terms/destroy/' + lexiconTermId + '?lexiconName=' + selectedLexiconId, null, null, 'script') ;
    selectedRows4 = null ;
    lexiconTermId = "" ;
  });

  $("#cancelDeleteLexiconEntry").click(function(){
    $.unblockUI();
  });

  $("#copyLexiconEntry").live('click', function() {
    if (selectedRows4 != null) {
      $("#myTable4").find("td").css('backgroundColor', 'white');
      selectedRows4 = null;
      $.get('/lexicon_terms/copy/' + lexiconTermId, null, null, 'script') ;
    } else {
      $.blockUI({
        message: 'Select a Lexicon Term to copy first',
        timeout:'1000'
      });
    }
  });

  $("#searchTerminology").click(function () {
    $.blockUI({
      message: $('#lexicon_search_terminology_tabs'),
      css:{
        top:'20%',
        width: '250px',
        cursor: 'null'
      }
    });
  });

  $("#cancelSearchTerminology").click( function() {
    $.unblockUI();
  });

  $("#lexiconList p").live('click', function() {
    if ( $(this).css('backgroundColor') == 'rgba(0, 0, 0, 0)' || $(this).css('backgroundColor') == 'transparent' ) {
      $(this).siblings().css('backgroundColor', '');
      selectedLexicon = ($(this).css('backgroundColor', 'rgba(180, 180, 180, 0.7)'));
      selectedLexiconId = $(this).attr('id') ;
    //$('#templateGroupDiv').load('/main/select_template_container/' + $(this).attr('id')) ;
    }
    else {
      $(this).css('backgroundColor', '') ;
      selectedLexicon = null ;
      selectedLexiconId = null ;
    }
    $.get('/lexicon_terms/select_lexicon/' + selectedLexiconId, null, endLoad, 'script') ;
  });

  $("#deleteLexicon").click(function() {
    if (selectedLexicon != null) {
      $.blockUI({
        message: $('#deleteLexiconMessage'),
        css:{
          top:'20%'
        }
      });
    } else {
      $.blockUI({
        message: 'Select a lexicon to delete first',
        timeout:'1000'
      });
    }
  });

  $("#confirmDeleteLexicon").click(function(){
    //$(selectedLexicon).remove();
    $.get('/lexicon_terms/wipe/' + selectedLexiconId, null, null, 'script') ;
    selectedLexicon = null ;
    selectedLexiconId = null ;
  });

  $("#cancelDeleteLexicon").click(function(){
    $.unblockUI();
  });

  $(".searchTermsLocal").click(function() {
    data = $(this).siblings('form').serialize() ;
    //alert('searchTermsLocal: ' + data) ;
    var element_id = $(this).siblings('table').children('tbody').attr('id') ;
    var element = $(this).siblings('table').attr('id').match(/[^_]+/)[0];
    if ($("select[id$='" + element + "_lexicon_list'] option:selected").size() == 0) {
      alert("Please select atleast one lexicon to search for lexicon terms");
    } else {
      //alert(element_id);
      //alert($(this).siblings('table').children('tbody').attr('id'));
      //($(this).siblings('table').children('tbody').attr('id') == 'aimTemplateSearchTableBody') ? panel = 'template' : panel = 'lexicon' ;
      //alert(panel);
      // alert('/lexicon_terms/search/0?element_id=' + element_id);
      //alert('/lexicon_terms/search/0?element_id=' + element_id + '&' + data);
      $.get('/lexicon_terms/search/0?element_id=' + element_id + '&' + data, null, 'script') ;
    }
  });


  $(function() {
    $("#templates_tabs_inner_frame").tabs();
    $("#lexicons_tabs_inner_frame").tabs();
  //$("#lexicon_search_terminology_tabs").tabs();
  });

  //Function to create a tooltip that shows the full text for any entry which might not display text fully eg. table cells.
  //Takes argument as list of jquery objects
  function createTooltip(o) {
    $(o).each(function() {
      $(this).attr('title', $(this).text());
    });
  };
  
  $(".editableText").live('dblclick', function(){
    $(this).addClass("textBeingEdited") ;
    var textToEdit = $(this).text() ;
    var elemWidth = $(this).width() - 10 ;
    $(this).html("<input type='text' style='width:" + elemWidth + "px' value ='" + textToEdit + "'/>") ;
    $(".textBeingEdited input").focus() ;
    $(this).removeClass("editableText") ;
  });

  function submitEditedText(obj) {
    obj.removeClass("textBeingEdited") ;
    var attribute = obj.attr('class') ;
    var object = obj.parents("[name='element']:first");
    var objectType = object.attr('class') ;
    var objectId = object.attr('id').match(/\d+/);
    if (objectId != null) {
      objectId = objectId[0];
    }
    var parent = object.parents("[name='element']:first");
    var parentType = "", parentId = "";
    if (parent.size() != 0) {
      parentType = parent.attr('class');
      parentId = parent.attr('id').match(/\d+/)[0] ;
    }
    //alert(objectType + ";" + objectId + ";" + parentType + ";" + parentId);
    var textToEdit = obj.children(":text").attr("value") ;
	startLoad();
    if (objectType=="lexicon_terms") {
      $.get('/' + objectType + '/update_attribute/' + objectId + '?object=' + objectType + '&attribute=' + attribute + '&value=' + textToEdit + '&file=/lexicon_terms/refresh_terms.js.erb', null, null, 'script');
    } else if (objectId != null) { // Object exists
      $.get('/' + objectType + '/update_attribute/' + objectId + '?object=' + objectType + '&attribute=' + attribute + '&value=' + textToEdit + '&aim_template_id=' + selectedTemplateId, null, null, 'script');
    } else { // Create new object
      //alert('parent call');
      $.get('/' + parentType + '/add_row/0/?object=' + objectType + '&parent_object=' + parentType + '&parent_id=' + parentId + '&aim_template_id=' + selectedTemplateId + '&data%5B' + attribute + '%5D=' + textToEdit, null, null, 'script') ;
    }
  }
  
  $(".textBeingEdited").live('focusout', function(){
    submitEditedText($(this));
  });

  //Function to complete editing attribute on pressing Enter key
  $('.textBeingEdited').live('keyup', function(e) {
    if(e.keyCode == 13) {
      submitEditedText($(this));
    }
  });

  // Function to handle changing of a select dropdown menu for any attribute of a Template element
  $(".select").live('change', function() {
    var attribute = $(this).attr('class').match(/\w+/)[0];
    var objectType = $(this).parents("[name='element']").attr('class');
    var objectId = $(this).parents("[name='element']").attr('id').match(/\d+/)[0];
    var value = $(this).val();
    //alert(attribute + " " + objectType + " " + objectId + " " + value);
    $.get('/' + objectType + '/update_attribute/' + objectId + '?object=' + objectType + '&attribute=' + attribute + '&value=' + value + '&aim_template_id=' + selectedTemplateId, null, null, 'script');
  });
  
  outerLayout = $("body").layout( {
    name:					'outerLayout' // only for debugging
    ,
    resizeWithWindowDelay:	250		// delay calling resizeAll when window is *still* resizing
    //,	resizeWithWindowMaxDelay: 2000	// force resize every XX ms while window is being resized
    ,
    resizable:				false
    ,
    slidable:				false
    ,
    closable:				false
    ,
    north__paneSelector:	"#outer-north"
    ,
    center__paneSelector:	"#outer-center"
    ,
    south__paneSelector:	"#outer-south"
    ,
    south__spacing_open:	0
    ,
    north__spacing_open:	0
    ,
    center__onresize:		"tabsContainerLayout.resizeAll"
  });

  tabsContainerLayout = $("#outer-center").layout( {
    name:					'tabsContainerLayout' // only for debugging
    ,
    resizable:				false
    ,
    slidable:				false
    ,
    closable:				false
    ,
    north__paneSelector:	"#tabbuttons"
    ,
    center__paneSelector:	"#tabpanels"
    ,
    spacing_open:			0
    ,
    center__onresize:		resizeTabPanelLayout // resize VISIBLE tabPanelLayout
  });

  window.tabsLoading = true;
  // set object BEFORE initializing tabs because is used during init
  $Tabs = $("#outer-center");
  $Tabs
  .tabs({
    show: function (evt, ui) {
      //need to resize layout after tabs init,
      //but before creating inner tabPanelLayout
      if (tabsLoading) {
        tabsLoading = false;
        tabsContainerLayout.resizeAll();
      // resizeAll will trigger center.onresize = resizeTabPanelLayout()
      }
      else // resize the INNER-layout each time it becomes 'visible'
      resizeTabPanelLayout(ui);
      }
      })
    .find(".ui-tabs-nav")
    .sortable({
      axis: 'x',
      zIndex: 2
      })
    ;

    $("#lexicon_search_terminology_tabs")
    .tabs()
    .find(".ui-tabs-nav")
    .sortable({
      axis: 'x',
      zIndex: 2
      })
    ;

    //addThemeSwitcher('#outer-north',{ top: '13px', right: '20px' });
    // if a theme is applied by ThemeSwitch *onLoad*, it may change the height of some content,
    // so we need to call resizeLayout to 'correct' any header/footer heights affected
    // call multiple times so fast browsers update quickly, and slower ones eventually!
    // NOTE: this is only necessary because we are changing CSS *AFTER LOADING* (eg: themeSwitcher)
    //setTimeout( resizeOuterLayout, 1000 ); /* allow time for browser to re-render for theme */
    //setTimeout( resizeOuterLayout, 5000 ); /* for really slow browsers */
    });

