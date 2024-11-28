;*******************************************************************************
;*******************************************************************************
;  leSchBindKeys.il
;
;	This file contains an example of bindKeys that can be used with both
;	the layout editor and / or schematic editor. The bindkeys are
;	mapped to functions that are similar in functionality in both 
;	editors.
; 
;	All lower case letter keys have been defined. There are some
;	bindkey combinations such as control b, that are yet undefined.
;
;	These bindkeys are based on the default layout bindkeys. Users that
;	are more familar with the schematic default bindkeys will find
;	different functions associated with the following bindkeys:
;	b, e, shift e, control e, shift f, control f, g, shift g, control g,
;	m, shift m, n, shift n, o, shift o, p, r, shift s, control s, v, w, 
;	shift w, x, shift x, shift z, control z.
;	 
;
;*******************************************************************************
;	$Author: cvsadm $
;	$Revision: 1.3 $
;	$Date: 2003/11/07 01:48:00 $
;	$State: Exp $
;*******************************************************************************
;*******************************************************************************
;*******************************************************************************
; The following alias is used to make the bindKey definitions more readable.
;*******************************************************************************

alias bk hiSetBindKey
    ;***************************************************************************
    ; Standard Keys
    ;***************************************************************************

    bk("Layout" "<Key>a"		"geSingleSelectPoint()")
    bk("Schematics" "<Key>a"            "geSingleSelectPoint()")
    bk("Symbol" "<Key>a"                "geSingleSelectPoint()")

;   bk("Layout" "Shift<Key>a"		"geSingleSelectBox()")
    bk("Schematics" "Shift<Key>a"       "geSingleSelectBox()")
    bk("Symbol" "Shift<Key>a"           "geSingleSelectBox()")

    bk("Layout" "Ctrl<Key>a"		"geSelectAllFig()")
    bk("Schematics" "Ctrl<Key>a"        "geSelectAllFig()")
    bk("Symbol" "Ctrl<Key>a"            "geSelectAllFig()")

    bk("Layout" "<Key>b"		"geReturnToLevel()")

    bk("Layout" "Shift<Key>b"		"geReturn()")
    bk("Schematics" "Shift<Key>b"       "schHiReturn()")
    bk("Symbol" "Shift<Key>b"           "schHiReturn()")

    bk("Layout" "<Key>c"		"leHiCopy()")
    bk("Schematics" "<Key>c"            "schHiCopy()")
    bk("Symbol" "<Key>c"                "schHiCopy()")

    bk("Layout" "Shift<Key>c"		"leHiChop()")

    bk("Layout" "<Key>d"		"geSubSelectPoint()")
    bk("Schematics" "<Key>d"            "geSubSelectPoint()")
    bk("Symbol" "<Key>d"                "geSubSelectPoint()")

;   bk("Layout" "Shift<Key>d"		"geSubSelectBox()")
    bk("Schematics" "Shift<Key>d"       "geSubSelectBox()")
    bk("Symbol" "Shift<Key>d"           "geSubSelectBox()")

    ;bk("Layout" "Ctrl<Key>d"		"geDeselectAllFig()")
    bk("Schematics" "Ctrl<Key>d"        "geDeselectAllFig()") 
    bk("Symbol" "Ctrl<Key>d"            "geDeselectAllFig()")

    bk("Layout" "<Key>e"		"leHiEditDisplayOptions()")
    bk("Schematics" "<Key>e"            "schHiDisplayOptions()")
    bk("Symbol" "<Key>e"                "schHiDisplayOptions()")

    bk("Layout" "Shift<Key>e"		"leHiEditEditorOptions()")
    bk("Schematics" "Shift<Key>e"       "schHiEditorOptions()")
    bk("Symbol" "Shift<Key>e"           "schHiEditorOptions()")

    bk("Schematics" "Ctrl<Key>e"        "schHiGridOptions()")
    bk("Symbol" "Ctrl<Key>e"            "schHiDisplayOptions()")

    bk("Layout" "<Key>f"	
	    "hiZoomAbsoluteScale(hiGetCurrentWindow() 0.9)")
    bk("Schematics" "<Key>f" 	
	    "hiZoomAbsoluteScale(getCurrentWindow() 0.9)")
    bk("Symbol" "<Key>f" 	
	    "hiZoomAbsoluteScale(getCurrentWindow() 0.9)")

    bk("Layout"     "Shift<Key>f"		"hiGetCurrentWindow()->stopLevel = dbGetMaxHierDepth()")
    bk("Layout"     "Ctrl<Key>f"		"hiGetCurrentWindow()->stopLevel = 0")

    bk("Layout"     "<Key>g"		"leToggleGravity()")

    bk("Schematics" "<Key>g"            "geHiCommonFindMarker()")
    bk("Symbol"     "<Key>g"                "geHiCommonFindMarker()")
 
    bk("Schematics" "Shift<Key>g"       "geHiExplainMarker()")
    bk("Symbol"     "Shift<Key>g"           "geHiExplainMarker()")

    bk("Layout"     "Ctrl<Key>g"    	"geZoomToGrid(hiGetCurrentWindow())")
    bk("Schematics" "Ctrl<Key>g"        "geHiDeleteMarker()")
    bk("Symbol"     "Ctrl<Key>g"            "geHiDeleteMarker()")

    bk("Schematics" "<Key>h"            "schHiHiliteLabel(\"wire\" \"on\")")
    bk("Schematics" "Shift<Key>h"       "schHiHiliteLabel(\"wire\" \"off\")")
    bk("Symbol"     "<Key>h"           	"schHiCreateSymbolShape(\"line\" \"outline\")")

    bk("Layout"     "<Key>i"		"leHiCreateInst()")
    bk("Schematics" "<Key>i"            "schHiCreateInst()")
    bk("Schematics" "Shift<Key>i"       "schHiCreateBlockInst()")

    bk("Symbol"     "<Key>j"    	"schHiSetSymbolOrigin()")

    bk("Schematics" "<Key>r"            "schHiRotate()")
    bk("Schematics" "<Key>r EF"         "schSetEnv(\"rotate\" t)")
    bk("Symbol"     "<Key>r"                "schHiRotate(t)")
    bk("Symbol"     "<Key>r EF"             "schSetEnv(\"rotate\" t)")

    bk("Schematics" "Shift<Key>r EF"    "schSetEnv(\"sideways\" t)")
    bk("Symbol" "Shift<Key>r EF"        "schSetEnv(\"sideways\" t)")

    bk("Schematics" "Ctrl<Key>r EF"     "schSetEnv(\"upsideDown\" t)")
    bk("Symbol" "Ctrl<Key>r EF"         "schSetEnv(\"upsideDown\" t)")

    bk("Layout" "<Key>k"		"leHiCreateRuler()")
    bk("Layout" "Shift<Key>k"		"leHiClearRuler()")

    bk("Layout" "<Key>l"		"leHiCreateLabel()")
    bk("Schematics" "<Key>l"            "schHiCreateWireLabel()")
    bk("Symbol" "<Key>l"                "schHiCreateSymbolLabel()")

    bk("Schematics" "Shift<Key>l"       "schHiCreateNoteLabel()")
    bk("Symbol" "Shift<Key>l"           "schHiCreateNoteLabel()")

    bk("Layout" "<Key>m"		"leHiMove()")
    bk("Schematics" "<Key>m"       	"schHiMove()")
    bk("Symbol" "<Key>m"           	"schHiMove()")

    bk("Layout" "Shift<Key>m"		"leHiMerge()")

    bk("Layout" "<Key>n"		"leSetFormSnapMode(\"diagonal\")")
    bk("Layout" "Shift<Key>n"		"leSetFormSnapMode(\"orthogonal\")")
    bk("Layout" "Ctrl<Key>n"    	"leSetFormSnapMode(\"L90XFirst\")")

    bk("Layout" "<Key>o"		"leHiCreateContact()")

    bk("Layout" "<Key>p"		"leHiCreatePath()")
    bk("Schematics" "<Key>w"            "schHiCreateWire(0.0)")

    bk("Layout" "Shift<Key>p"		"leHiCreatePolygon()")

    bk("Layout" "Ctrl<Key>p"		"leHiCreatePin()")
    bk("Schematics" "<Key>p"       	"schHiCreatePin()")
    bk("Symbol" "Ctrl<Key>p"   		"schHiCreateSymbolPin()")

    bk("Layout" "<Key>q"		"leHiEditProp()")
    bk("Schematics" "<Key>q"            "schHiObjectProperty()")
    bk("Schematics" "<Key>q EF"         "schHiObjectProperty()")
    bk("Symbol" "<Key>q"                "schHiObjectProperty()")
    bk("Symbol" "<Key>q EF"             "schHiObjectProperty()")

;    bk("Layout" "Shift<Key>q"		"leEditDesignProperties()")
    bk("Schematics" "Shift<Key>q"      	"schHiCellViewProperty()")
    bk("Schematics" "Shift<Key>q EF"    "schHiCellViewProperty()")
    bk("Symbol" "Shift<Key>q"           "schHiCellViewProperty()")
    bk("Symbol" "Shift<Key>q EF"        "schHiCellViewProperty()")

    bk("Layout" "<Key>r"		"leHiCreateRect()")
    bk("Layout" "Ctrl Shift<Key>r"	"leHiCreateRoute()")
    bk("Layout" "Shift<Key>r"		"leHiReShape()")
    bk("Layout" "Ctrl<Key>r"            "hiRedraw()")

    bk("Layout" "<Key>s"		"leHiStretch()")
    bk("Schematics" "<Key>s"            "schHiStretch()")
    bk("Symbol" "<Key>s"                "schHiSymStretch()")

;   bk("Layout" "Shift<Key>s"		"leHiSearch()")
    bk("Schematics" "Shift<Key>s"	"schHiFind()")
	
    bk("Layout" "Ctrl<Key>s"		"leHiSplit()")

    bk("Layout" "<Key>t"		"leHiLayerTap()")
;    bk("Layout" "Shift<Key>t"		"leHiTree()")

    bk("Layout" "<Key>u"		"hiUndo()")
    bk("Schematics" "<Key>u"            "hiUndo()")
    bk("Symbol" "<Key>u"                "hiUndo()")

    bk("Layout" "Shift<Key>u"		"hiRedo()")
    bk("Schematics" "Shift<Key>u"       "hiRedo()")
    bk("Symbol" "Shift<Key>u"           "hiRedo()")

    bk("Layout" "<Key>v"		"leHiAttach()")

;    bk("Layout" "Shift<Key>v"		"hiOpenWorldView(hiGetCurrentWindow())")
    bk("Schematics" "Shift<Key>v"       "hiOpenWorldView(hiGetCurrentWindow())")
    bk("Symbol" "Shift<Key>v"           "hiOpenWorldView(hiGetCurrentWindow())")

    bk("Layout" "Ctrl<Key>v"		"hiFocusToCIW(hiGetCurrentWindow())")
    bk("Schematics" "Ctrl<Key>v"        "hiFocusToCIW(hiGetCurrentWindow())")
    bk("Symbol" "Ctrl<Key>v"            "hiFocusToCIW(hiGetCurrentWindow())")

;    bk("Layout" "<Key>w"		"hiPrevWinView(hiGetCurrentWindow())")
;    bk("Schematics" "<Key>w"       	"hiPrevWinView(hiGetCurrentWindow())")
;    bk("Symbol" "<Key>w"           	"hiPrevWinView(hiGetCurrentWindow())")

;    bk("Layout" "Shift<Key>w"		"hiNextWinView(hiGetCurrentWindow())")
;    bk("Schematics" "Shift<Key>w"	"hiNextWinView(hiGetCurrentWindow())")
;    bk("Symbol" "Shift<Key>w"		"hiNextWinView(hiGetCurrentWindow())")

;    bk("Layout" "Ctrl<Key>w"		"hiCloseWindow(hiGetCurrentWindow())")
;    bk("Schematics" "Ctrl<Key>w"	"hiCloseWindow(hiGetCurrentWindow())")
;    bk("Symbol" "Ctrl<Key>w"		"hiCloseWindow(hiGetCurrentWindow())")

    bk("Layout" "<Key>x"		"leHiEditInPlace()")
    bk("Schematics" "<Key>x"		"schHiEditInPlace()")
    bk("Symbol" "<Key>x"		"schHiEditInPlace()")

    bk("Layout" "Shift<Key>x"		"leHiDescend()")
    bk("Schematics" "Shift<Key>x"       "schHiDescendEdit()")

    bk("Layout" "Ctrl<Key>x" 
	    "leEIPZoomAbsoluteScale(hiGetCurrentWindow() 0.9)") 
    bk("Schematics" "Ctrl<Key>x"        "schHiDescendRead()")

    bk("Layout" "<Key>y"		"leHiYank()")
    bk("Layout" "Shift<Key>y"		"leHiPaste()")

    bk("Layout" "<Key>z"		"hiZoomIn()")
    bk("Schematics" "<Key>z"		"hiZoomIn()")
    bk("Symbol" "<Key>z"		"hiZoomIn()")

    bk("Layout" "Shift<Key>z"	
	    "hiZoomRelativeScale(hiGetCurrentWindow() 0.5)")
    bk("Schematics" "Shift<Key>z" 
	    "hiZoomRelativeScale(getCurrentWindow() 0.8)")
    bk("Symbol" "Shift<Key>z"	  
	    "hiZoomRelativeScale(getCurrentWindow() 0.8)")

    bk("Layout" "Ctrl<Key>z"	
	    "hiZoomRelativeScale(hiGetCurrentWindow() 2.0)")
    bk("Schematics" "Ctrl<Key>z" 
	    "hiZoomRelativeScale(getCurrentWindow() 1.25)")
    bk("Symbol" "Ctrl<Key>z"	 
	    "hiZoomRelativeScale(getCurrentWindow() 1.25)")

    ; NOTE: if you change the key binding for schSnapToConn() you can 
    ;       also change the Add>>Wire command prompts by setting the global 
    ; 	    skill variable schgWirePromptToAppend = 
    ;       " or snap to diamond using {your bind key}." in your .cdsinit file.

    bk("Schematics" "<Key>4 EF"         "schSnapToConn()")    
    bk("Schematics" "<Key>5"            "schHiRouteFlightLine()")

    bk("Schematics" "<Key>8"           
	    "schHiHiliteLabel(\"instance\" \"on\")")
    bk("Schematics" "Shift<Key>8"      
	    "schHiHiliteLabel(\"instance\" \"off\")")

    bk("Schematics" "<Key>9"            "geAddNetProbe()")
    bk("Symbol" "<Key>9"                "geAddNetProbe()")


    ;***************************************************************************
    ; Special Keys
    ;***************************************************************************

    bk("Layout" "<Key>Escape EF"		"cancelEnterFun()")

    bk("Layout" "<Key>Delete EF"		"leHiDelete()"	)
    bk("Layout" "<Key>Delete"			"leHiDelete()")
    bk("Schematics" "<Key>Delete"       	"schHiDelete()")
    bk("Symbol" "<Key>Delete"           	"schHiDelete()")

    bk("Layout" "<Key>Tab"			"hiPan()")
    bk("Schematics" "<Key>Tab"			"hiPan()")
    bk("Symbol" "<Key>Tab"			"hiPan()")

    bk("Layout" "<Key>F2"			"geSave()")
    bk("Schematics" "<Key>F2"           	"schHiCheckAndSave()")
    bk("Symbol" "<Key>F2"               	"geSave()")

    bk("Layout" "<Key>F3" 	       		"geSaveAs()")
    bk("Schematics" "<Key>F3" 	       		"geSaveAs()")
    bk("Symbol" "<Key>F3"      	  		"geSaveAs()")

    bk("Schematics" "<Key>F4"        		"schSetSelectOptions()")

    bk("Layout" "<Key>F5"			"deOpen()")

    bk("Layout" "<Key>F6"           		"hiRedraw()")
    bk("Schematics" "<Key>F6"           	"hiRedraw()")
    bk("Symbol" "<Key>F6"           		"hiRedraw()")

    bk("Schematics" "<Key>F7"                   "schHiCheck(\"run\")")

;    bk("Schematics" "<Key>F8"       		"schHiCheckAndSave()")

    bk("Schematics" "<Key>F9"		        "schHiCreateNoteShape()")
    bk("Symbol" "<Key>F9"                	"schHiCreateNoteShape()")

    bk("Schematics" "<Key>F9"       		"schHiCreateNoteLabel()")
    bk("Symbol" "<Key>F9"           		"schHiCreateNoteLabel()")

    bk("Schematics" "<Key>F10"        		"schSetSelectOptions()")
    bk("Symbol" "<Key>F10"        		"schSetSelectOptions()")

    bk("Schematics" "None<Btn1Down>"    	"schSingleSelectPt()")
    bk("Schematics" "Shift<Btn1Down>"   	"schAddSelectPt()")

    bk("Schematics" "<DrawThru1>"       	"schDirectEdit(1)")
    bk("Symbol" "<DrawThru1>"           	"schDirectEdit(1)")

    bk("Schematics" "Shift<DrawThru1>"  	"schDirectEdit(2)")
    bk("Symbol" "Shift<DrawThru1>"      	"schDirectEdit(2)")

    bk("Schematics" "Ctrl<DrawThru1>"   	"schDirectEdit(3)")
    bk("Symbol" "Ctrl<DrawThru1>"       	"schDirectEdit(3)")

    bk("Schematics" "None<Btn1Down>(2)" 	"schExtendSelectPt()")
    bk("Schematics" "None<Btn1Down>(2) EF" 	"schMouseApplyOrFinish()")
    bk("Symbol" "None<Btn1Down>(2) EF"  	"schMouseApplyOrFinish()")

    bk("Schematics" "None<Btn2Down>"    	"schHiMousePopUp()")
    bk("Symbol" "None<Btn2Down>"        	"schHiMousePopUp()")

    bk("Schematics" "None<Btn2Down> EF" 	"schHiMousePopUp()")
    bk("Symbol" "None<Btn2Down> EF"     	"schHiMousePopUp()")

    bk("Schematics" "None<Btn3Down> EF" 	"schCmdOption()")
    bk("Symbol" "None<Btn3Down>EF"      	"schCmdOption()")

    bk("Schematics" "Shift<Btn3Down> EF" 	"schShiftCmdOption()")
    bk("Symbol" "Shift<Btn3Down> EF"    	"schShiftCmdOption()")

    bk("Layout" "Ctrl<Key>1"	"mgc_custom_menus_run_menu_cmd(\"DRC\" \"::CalibreInterface::execCalibre DRC\" 'nil ?code \"\")")
    bk("Layout" "Ctrl<Key>2"	"mgc_custom_menus_run_menu_cmd(\"LVS\" \"::CalibreInterface::execCalibre LVS\" 'nil ?code \"\")")
    bk("Layout" "Ctrl<Key>3"	"mgc_custom_menus_run_menu_cmd(\"PEX\" \"::CalibreInterface::execCalibre PEX\" 'nil ?code \"\")")
    bk("Layout" "Ctrl<Key>4"	"tsmcPdkGuardRing()")

    bk("Layout" "Ctrl<Btn4Down>"	"hiZoomInAtMouse()")
    bk("Layout" "Ctrl<Btn5Down>"	"hiZoomOutAtMouse()")
    bk("Layout" "None<Btn4Down>"	"geScroll(nil \"n\" nil)")
    bk("Layout" "None<Btn5Down>"	"geScroll(nil \"s\" nil)")

    bk("Layout" "Ctrl<Btn4Down>"	"hiZoomInAtMouse()")
    bk("Layout" "Ctrl<Btn5Down>"	"hiZoomOutAtMouse()")
    
    bk("Schematics" "Ctrl<Btn4Down>"	"hiZoomInAtMouse()")
    bk("Schematics" "Ctrl<Btn5Down>"	"hiZoomOutAtMouse()")
    bk("Schematics" "None<Btn4Down>"	"geScroll(nil \"n\" nil)")
    bk("Schematics" "None<Btn5Down>"	"geScroll(nil \"s\" nil)")

    
;   bk("Layout" "Shift<Key>1"	"_leCreateQuickFigGroup(getCurrentWindow())")
;   bk("Layout" "Shift<Key>2"	"leHiUngroup()")
;   bk("Layout" "Shift<Key>3"	"_pteHiLayerSetNoneVisible(dwindow('pteLayerPalette1))")
;   bk("Layout" "Shift<Key>4"	"_pteHiLayerSetAllVisible(dwindow('pteLayerPalette1))")
;   bk("Layout" "Shift<Key>5"	"leHiMarkNet()")
;   bk("Layout" "Shift<Key>6"	"_leUnmarkNetAllCB()")
;   bk("Layout" "Shift<Key>d"	"Shift<Key>D")
;   bk("Layout" "Ctrl<Key>d"	"Ctrl<Key>D")
;   
;   
;   bk("Layout" "Shift<Key>a"	"leAlign("left\")
;   bk("Layout" "Shift<Key>g"	"leAlign("horizontal\") 
;   bk("Layout" "Shift<Key>q"	"leAlign("vertical\") 
;   bk("Layout" "Shift<Key>s"	"leAlign("right\")
;   bk("Layout" "Shift<Key>t"	"leAlign("top\")
;   bk("Layout" "Shift<Key>v"	"leAlign("bottom\")
    
    ;***************************************************************************
    ; Numeric Key Pad (Window Panning Functions)
    ;***************************************************************************

    legRpDelta = 0.5

    bk("Layout" "<Key>R7"		"geScroll(nil \"nw\"	nil)")

    bk("Layout" "<Key>Up"		"geScroll(nil \"n\"	nil)")
    bk("Schematics" "<Key>Up"           "geScroll(nil \"n\" 	nil)")
    bk("Symbol" "<Key>Up"               "geScroll(nil \"n\" 	nil)")

    bk("Layout" "<Key>R9"		"geScroll(nil \"ne\"	nil)")

    bk("Layout" "<Key>Left"		"geScroll(nil \"w\"	nil)")
    bk("Schematics" "<Key>Left"         "geScroll(nil \"w\" 	nil)")
    bk("Symbol" "<Key>Left"         	"geScroll(nil \"w\" 	nil)")

    bk("Layout" "<Key>R11"		"geScroll(nil \"\"	nil)")

    bk("Layout" "<Key>Right"		"geScroll(nil \"e\"	nil)")
    bk("Schematics" "<Key>Right"        "geScroll(nil \"e\" 	nil)")
    bk("Symbol" "<Key>Right"        	"geScroll(nil \"e\" 	nil)")

    bk("Layout" "<Key>R13"		"geScroll(nil \"sw\"	nil)")

    bk("Layout" "<Key>Down"		"geScroll(nil \"s\"	nil)")
    bk("Schematics" "<Key>Down"         "geScroll(nil \"s\" 	nil)")
    bk("Symbol" "<Key>Down"         	"geScroll(nil \"s\" 	nil)")

    bk("Layout" "<Key>R15"		"geScroll(nil \"se\"	nil)")

    bk("Layout" "<Key>KP_Enter"		"mouseAddPt()")
    bk("Layout" "<Key>KP_Add"		"leHiSetRefPoint()")
    bk("Layout" "<Key>KP_Subtract" 
	    "leSetRefPointInactive(geGetEditCellView())")

    bk("Layout" "<Key>KP_Equal"		"legRpDelta = 0.5")
    bk("Layout" "<Key>KP_Divide"	"legRpDelta = 1.0")
    bk("Layout" "<Key>KP_Multiply"	"legRpDelta = 2.0")

    bk("Layout" "<Key>R4"		"legRpDelta = 0.5")
    bk("Layout" "<Key>R5"		"legRpDelta = 1.0")
    bk("Layout" "<Key>R6"		"legRpDelta = 2.0")

    bk("Layout" "Shift<Key>R7" 		"leMoveCursor(-legRpDelta  legRpDelta)")
    bk("Layout" "Shift<Key>Up"		"leMoveCursor(          0  legRpDelta)")
    bk("Layout" "Shift<Key>R9"		"leMoveCursor( legRpDelta  legRpDelta)")
    bk("Layout" "Shift<Key>Left"	"leMoveCursor(-legRpDelta           0)")
    bk("Layout" "Shift<Key>R11"		"leMoveCursorToRefPoint()")
    bk("Layout" "Shift<Key>Right"	"leMoveCursor( legRpDelta           0)")
    bk("Layout" "Shift<Key>R13"		"leMoveCursor(-legRpDelta -legRpDelta)")
    bk("Layout" "Shift<Key>Down"	"leMoveCursor(0           -legRpDelta)")
    bk("Layout" "Shift<Key>R15"		"leMoveCursor( legRpDelta -legRpDelta)")

    bk("Layout" "Ctrl<Key>R7"		"geScroll(nil \"nw\"	t)")
    bk("Layout" "Ctrl<Key>Up"		"geScroll(nil \"n\"	t)")
    bk("Layout" "Ctrl<Key>R9"		"geScroll(nil \"ne\"	t)")
    bk("Layout" "Ctrl<Key>Left"		"geScroll(nil \"w\"	t)")
    bk("Layout" "Ctrl<Key>R11"		"geScroll(nil \"\"	t)")
    bk("Layout" "Ctrl<Key>Right"	"geScroll(nil \"e\"	t)")
    bk("Layout" "Ctrl<Key>R13"		"geScroll(nil \"sw\"	t)")
    bk("Layout" "Ctrl<Key>Down"		"geScroll(nil \"s\"	t)")
    bk("Layout" "Ctrl<Key>R15"		"geScroll(nil \"se\"	t)")
    bk("Layout" "<Key>space EF"		"leSpaceBarFunc(hiGetCurrentWindow() t)")
    bk("Layout" "Shift<Key>space EF"    "leSpaceBarFunc(hiGetCurrentWindow() t t)")

unalias bk
