
import XMonad hiding ( (|||) )
import XMonad.Layout hiding ( (|||) )
import XMonad.Layout.LayoutCombinators
-- Base
import System.Directory
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

    -- Actions
import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS (Direction1D(..), moveTo, shiftTo, WSType(..), nextScreen, prevScreen, prevWS, nextWS)
import XMonad.Actions.MouseResize
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.DwmPromote
import XMonad.Actions.SwapPromote
import qualified XMonad.Actions.Search as S

    -- Data
import Data.Char (isSpace, toUpper)
import Data.Maybe (fromJust, isJust)
import Data.Monoid
import Data.Tree
import qualified Data.Map as M

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor,xmobarAction, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers 
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ScreenCorners
import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ServerMode
import XMonad.Hooks.InsertPosition

    -- Layouts
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.Hidden
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.WindowNavigation

    -- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ShowWName
import XMonad.Layout.Simplest
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.Named
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

   -- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce





-- ##################################################################
--- My variables
-- ##################################################################


chosen_font :: String
chosen_font = "xft:SauceCodePro Nerd Font Mono:regular:size=9:antialias=true:hinting=true"

mod_mask :: KeyMask
mod_mask = mod4Mask                                       -- Sets modkey to super/windows key

terminal_emulator :: String
terminal_emulator = "kitty"

web_browser :: String
web_browser = "firefox-developer-edition "

rss_reader :: String
rss_reader = terminal_emulator ++ " -e newsboat"    

matrix_client :: String
matrix_client = "nheko "

text_editor :: String
text_editor = terminal_emulator ++ " -e nvim "
-- text_editor = "emacsclient -c -a 'emacs' "

normal_w_color :: String
normal_w_color = COLOR1                                -- Border color of normal windows
-- normal_w_color = "#232323"                                -- Border color of normal windows

focused_w_color :: String
focused_w_color = COLO15                               -- Border color of focused windows
-- focused_w_color = "#ea6962"                               -- Border color of focused windows

file_manager :: String
file_manager = terminal_emulator ++ " -e lf"               

network_tool :: String
network_tool = terminal_emulator ++ " -e doas nmtui"

power_menu :: String
power_menu = "powermenu-v"  

system_monitor :: String
system_monitor = terminal_emulator ++ " -e htop"            

border_width :: Dimension
border_width = 5


-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = True




-- ##################################################################
--- Startup
-- ##################################################################

myStartupHook :: X ()
myStartupHook = do

    spawnOnce "picom &"
    spawnOnce "dunst &"
    spawnOnce "flameshot &"

    setWMName "xmonad"

    addScreenCorners [ (SCUpperLeft,  prevWS), (SCUpperRight, nextWS) ]






-- ##################################################################
--- Scratchpads
-- ##################################################################

myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal"  spawnTerm findTerm manageTerm
                , NS "sysinfo"   spawnTop  findTop  manageTop
                , NS "calendar" spawnRec  findRec  manageRec
                , NS "ranger" spawnRanger  findRanger  manageRanger
                , NS "obs" spawnOBS  findOBS  manageOBS
                ]
  where

    spawnTerm  = terminal_emulator ++ " -T scratchpad"
    findTerm   = title =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.75
                 w = 0.75
                 t = 0.125 
                 l = 0.125

    spawnTop   = terminal_emulator ++ " -T sysinfo -e htop"
    findTop    = title =? "sysinfo"
    manageTop  = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w 

    spawnRec   = terminal_emulator ++ " -T calendar -e calcurse" 
    findRec    = title =? "calendar"
    manageRec  = customFloating $ W.RationalRect l t w h
               where
                 h = 0.75
                 w = 0.75
                 t = 0.125 
                 l = 0.125

    spawnRanger   = terminal_emulator ++ " -T ranger -e ranger" 
    findRanger    = title =? "ranger"
    manageRanger  = customFloating $ W.RationalRect l t w h
                 where
                   h = 0.75
                   w = 0.75
                   t = 0.125 
                   l = 0.125

    spawnOBS   = "obs"
    findOBS    = title =? "obs"
    manageOBS  = customFloating $ W.RationalRect l t w h
               where
                 h = 0.9
                 w = 0.9
                 t = 0.95 -h
                 l = 0.95 -w 



-- GAPS

gap_width :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
gap_width i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Single window has no gaps.
gap_width' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
gap_width' i = spacingRaw True (Border i i i i) False (Border i i i i) False






-- ##################################################################
--- Layouts
-- ##################################################################

tall     = renamed [Replace "[]="]
           $ windowNavigation
           $ hiddenWindows
           $ gap_width 5
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ ResizableTall 1 (3/100) (0.55) []

-- mirrorTall = renamed [Replace "MirrorTall"]
--            $ windowNavigation
--            $ addTabs shrinkText myTabTheme
--            $ subLayout [] (smartBorders Simplest)
--            $ gap_width 5
--            $ Mirror 
--            $ ResizableTall 1 (3/100) (0.55) []

htall    = renamed [Replace "bstack"]
           $ Mirror tall

monocle  = renamed [Replace "[M]"]
           $ noBorders
           $ subLayout [] (smartBorders Simplest)
           $ Full

floats   = renamed [Replace "><>"]
           $ smartBorders
           $ simplestFloat


myDefaultLayout =    withBorder border_width $ named "tall" tall
                 ||| named "monocle" monocle
                 ||| htall
                 ||| named "floats" floats


-- The layout hook

myLayoutHook =  screenCornerLayoutHook $ avoidStruts $ mouseResize $ windowArrange $ smartBorders 
               $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout


-- ##################################################################
--- Tabs SubLayout
-- ##################################################################
-- setting colors for tabs layout and tabs sublayout.
myTabTheme = def { fontName = chosen_font
                 , activeColor         = "#46d9ff"
                 , inactiveColor       = "#313846"
                 , activeTextColor     = "#282c34"
                 , inactiveTextColor   = "#d0d0d0"
                 }



-- ##################################################################
--- Workspaces
-- ##################################################################


-- windowCount :: X (Maybe String)
-- windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- workspace_names = [" dev ", " www ", " sys ", " doc ", " vbox ", " chat ", " mus ", " vid ", " gfx "]
-- myWorkspaceIndices = M.fromList $ zipWith (,) workspace_names [1..] -- (,) == \x y -> (x,y)

-- clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
--     where i = fromJust $ M.lookup ws myWorkspaceIndices
xmobarEscape = concatMap doubleLts
  where doubleLts '<' = "<<"
        doubleLts x    = [x]
workspace_names            :: [String]
workspace_names = clickable . (map xmobarEscape) $ ["\62532", "\62532", "\62532", "\62532", "\62532", "\62532", "\62532", "\62532", "\62532"] 
-- workspace_names            = clickable . (map xmobarEscape) $ ["1:\xf269","2:\xf120","3:\xf0e0", "4:\xf07c","5:\xf1b6","6:\xf281","7:\xf04b","8:\xf167","9"]
  where                                                                       
         clickable l = [ "<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
                             (i,ws) <- zip [1..9] l,                                        
                            let n = i ]
-- ##################################################################-
--- Managing windows
-- ##################################################################

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
     [ className =? "confirm"         --> doFloat
     , className =? "dialog"          --> doFloat
     , className =? "notification"          --> hasBorder False
     , className =? "Dunst"          --> hasBorder False
     , className =? "Org.gnome.Nautilus"          --> doCenterFloat
     , className =? "Thunar"          --> doCenterFloat
     , className =? "Chromium"        --> doShift ( workspace_names !! 1 )
     , className =? "discord"            --> doShift ( workspace_names !! 1 )
     , className =? "zoom"            --> doShift ( workspace_names !! 3 )
     , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat  -- Float Firefox Dialog
     , (className =? "Brave-browser" <&&> resource =? "Dialog") --> doFloat  -- Float Firefox Dialog
     , (className =? "brave-browser" <&&> resource =? "Dialog") --> doFloat  -- Float Firefox Dialog
     , isFullscreen -->  doFullFloat
     ] <+> namedScratchpadManageHook myScratchPads <+> insertPosition Below Newer





-- ##################################################################
--- Keybindings
-- ##################################################################

myKeys :: [(String, X ())]
myKeys =

--------------------------------------------------------------
    -- Xmonad
        -- [ ("M-S-r", spawn "restart_xmonad")    -- Restarts xmonad
        [ ("M-C-r", spawn "sh /home/thousandv/.xmonad/xmonad-wal.sh")  -- Recompiles xmonad
        , ("M-S-r", spawn "killall xmobar; xmobar --recompile ;xmonad --recompile; xmonad --restart")  -- Recompiles xmonad
        , ("M-z"  , spawn (text_editor ++ " .xmonad/xmonad-template.hs") ) 
        , ("M-S-z", spawn (text_editor ++ " .config/xmobar/xmobar-template.hs") ) 
--------------------------------------------------------------


---------------------------------------------------------------
   -- Useful programs to have a keybinding for launch
        , ("M-<Return>", spawn (terminal_emulator))
--------------------------------------------------------------

---------------------------------------------------------------
    -- Kill windows
        , ("M-q",   kill1)     -- Kill the currently focused client
        , ("M-S-a", killAll)   -- Kill all windows on current workspace
--------------------------------------------------------------

---------------------------------------------------------------
    -- Floating windows
        , ("M-S-f",   sendMessage $ JumpToLayout "floats")   -- Toggles 'floats' layout
        , ("M-S-<Space>",   withFocused $ windows . W.sink)    -- Push floating window back to tile
        , ("M-S-t", sinkAll)                           -- Push ALL floating windows to tile
--------------------------------------------------------------


---------------------------------------------------------------
    -- Increase/decrease spacing (gaps)
        , ("C-M1-j", decWindowSpacing 4)         -- Decrease window spacing
        , ("C-M1-k", incWindowSpacing 4)         -- Increase window spacing
        , ("C-M1-h", decScreenSpacing 4)         -- Decrease screen spacing
        , ("C-M1-l", incScreenSpacing 4)         -- Increase screen spacing
--------------------------------------------------------------


---------------------------------------------------------------
    -- Windows navigation
        , ("M-m",           windows W.focusMaster)  -- Move focus to the master window
        , ("M-j",           windows W.focusDown)    -- Move focus to the next window
        , ("M-k",           windows W.focusUp)      -- Move focus to the prev window
        , ("M-<Tab>", windows W.focusDown)    -- Move focus to the next window
        , ("M-S-<Tab>", windows W.focusUp)      -- Move focus to the prev window
        , ("M-S-<Return>", whenX (swapPromote False) dwmpromote) -- Swap the focused window and the master window
        , ("M-C-<Tab>",     rotAllDown)             -- Rotate all the windows in the current stack
        , ("M-S-0", windows copyToAll)
        , ("M-C-0", killAllOtherCopies)
--------------------------------------------------------------

---------------------------------------------------------------
    -- Layouts
        , ("M-M1-<Tab>", sendMessage NextLayout)                                       -- Switch to next layout
        , ("M-f", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts)   -- Toggles noborder/full
        , ("M-t",   sendMessage $ JumpToLayout "tall")   -- Toggles first layout which is tall layout
        , ("M-S-m",   sendMessage $ JumpToLayout "monocle")   -- Toggles first layout which is tall layout
        , ("M-u",   sendMessage $ JumpToLayout "bstack")   -- Toggles first layout which is tall layout

--------------------------------------------------------------


---------------------------------------------------------------
    -- Window resizing
        , ("M-h", sendMessage Shrink)                   -- Shrink horiz window width
        , ("M-M1-h", sendMessage MirrorShrink)                   -- Shrink horiz window width
        , ("M-l", sendMessage Expand)                   -- Expand horiz window width
        , ("M-M1-l", sendMessage MirrorExpand)                   -- Expand horiz window width
        , ("M-c", withFocused hideWindow)          -- Hide focused window
        , ("M-S-c", popOldestHiddenWindow)          -- Hide focused window
--------------------------------------------------------------


---------------------------------------------------------------
    -- SubLayouts
        -- This is used to push windows to tabbed sublayouts, or pull them out of it.
        , ("M-C-h", sendMessage $ pullGroup L)
        , ("M-C-l", sendMessage $ pullGroup R)
        , ("M-C-k", sendMessage $ pullGroup U)
        , ("M-C-j", sendMessage $ pullGroup D)
        , ("M-C-m", withFocused (sendMessage . MergeAll))
        , ("M-C-'", withFocused (sendMessage . UnMerge))
        , ("M-C-/", withFocused (sendMessage . UnMergeAll))
        , ("M-C-,", onGroup W.focusUp')    -- Switch focus to next tab
        , ("M-C-.", onGroup W.focusDown')  -- Switch focus to prev tab

---------------------------------------------------------------




---------------------------------------------------------------
    -- Scratchpads
    -- Toggle them to hide and it sends them back to hidden workspace (NSP).
        , ("M-y", namedScratchpadAction myScratchPads "terminal")
        , ("M-S-y", namedScratchpadAction myScratchPads "sysinfo")
        , ("M-g", namedScratchpadAction myScratchPads "calendar")
        , ("M-S-e", namedScratchpadAction myScratchPads "ranger")
        , ("M-S-o", namedScratchpadAction myScratchPads "obs")
        -- , ("M-s g", namedScratchpadAction myScratchPads "sysinfo")
        -- , ("M-s r", namedScratchpadAction myScratchPads "screenrec")
--------------------------------------------------------------


---------------------------------------------------------------
    -- Increase/Decrease Master Stack
    -- KB_GROUP Increase/decrease windows in the master pane or the stack
      , ("M-S-<Up>", sendMessage (IncMasterN 1))      -- Increase # of clients master pane
      , ("M-S-<Down>", sendMessage (IncMasterN (-1))) -- Decrease # of clients master pane

--------------------------------------------------------------
---------------------------------------------------------------
    -- Multimedia Keys
    
        -- -- Sound
        -- , ("<XF86AudioMute>",        spawn "pamixer -t")
        -- , ("<XF86AudioLowerVolume>", spawn "pamixer --allow-boost -d 5")
        -- , ("<XF86AudioRaiseVolume>", spawn "pamixer --allow-boost -i 5")

        -- -- Brightness
        -- , ("<XF86MonBrightnessUp>",   spawn "brightnessctl set +5%")
        -- , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 5%-")

        -- -- Misc.
        -- , ("<XF86HomePage>", spawn (web_browser ++ " https://gitlab.com/vojjvoda") )
        -- , ("<XF86Mail>",     spawn (web_browser ++ " https://protonmail.com") )
        -- , ("<Print>",        spawn "sss.sh")
        ]
--------------------------------------------------------------

-- ##################################################################
--- Main func, also xmobar handling
-- ##################################################################


main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobar-original.hs"
    -- xmproc <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobar.hs"
    -- xmproc2 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobar2.hs" -- Date and Time
    -- xmproc3 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobar3.hs" -- Audio and Mic
    -- xmproc4 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobar4.hs" -- Wifi Memoryj
    -- xmproc5 <- spawnPipe "xmobar -x 0 $HOME/.config/xmobar/xmobar5.hs" -- Brightness Battery

    xmonad $ ewmh defaultConfig
        { manageHook         = myManageHook <+> manageDocks
        , handleEventHook    = docksEventHook -- <+> screenCornerEventHook
        , modMask            = mod_mask
        , terminal           = terminal_emulator
        , startupHook        = myStartupHook
        , layoutHook         = myLayoutHook
        , workspaces         = workspace_names
        , focusFollowsMouse  = myFocusFollowsMouse
        , clickJustFocuses   = myClickJustFocuses
        , borderWidth        = border_width
        , normalBorderColor  = normal_w_color
        , focusedBorderColor = focused_w_color
        , logHook = dynamicLogWithPP $ namedScratchpadFilterOutWorkspacePP $ xmobarPP -- $ fadeInactiveLogHook 0.8
        -- settings for xmobar.
              { ppOutput          = \x -> hPutStrLn xmproc x 

              , ppCurrent         = xmobarColor "#ebcb8b" "" . const "<fn=4>\986031</fn>" 
              , ppVisible         = xmobarColor "#FFFFFF" "" 
              , ppHidden          = xmobarColor "#a3be8c" "" 
              , ppHiddenNoWindows = xmobarColor "#bf616a" "" . const "<fn=4>\983712</fn>"
              , ppLayout          = xmobarColor "#BBBBBB" "" . wrap "<fn=1>" " </fn>"
              , ppUrgent          = xmobarColor "#bf616a" ""
              , ppSep             = " "
              , ppWsSep           = " "
              , ppOrder           = \(ws:l:t) -> [ws,l] -- ++ [t] -- order of things in xmobar : workspaces, layout, title
              }
        } `additionalKeysP` myKeys


