;;; mawce-theme.el --- Code for my custom mode line -*- no-byte-compile: t; lexical-binding: t -*-

;; Copyright (C) 2024  Scott Runnels

;; Author: Scott Runnels <srunnels@gmail.com>
;; URL: https://github.com/srunnels/dotfiles
;; Version: 0.0
;; Package-Requires: ((emacs "30.1"))


;;; Commentary:
;;;; This theme was designed as an experiment in both color and in Emacs Lisp.
;;;;
;;;; I named it for my daughter who has always had a keen sense for color and who I love.
;;; Code:

(deftheme mawce "The Mawce color theme.")

(defgroup mawce-theme nil
  "Mawce theme."
  :group 'faces
  :prefix "mawce-"
  :tag "Mawce theme")

;;;###autoload
(defcustom mawce-lightness 'light
  "Select from \='light or \='dark to determine the specific theme."
  :group 'mawce-theme
  :type 'symbol)

(defcustom mawce-override-colors-alist '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by defining them
in this list."
  :group 'mawce-theme
  :type '(alist
          :key-type (string :tag "Name")
          :value-type (string :tag " Hex")))

(defvar mawce-use-variable-pitch nil
  "When non-nil, use variable pitch face for some headings and titles.")

(defvar mawce-scale-org-headlines nil
  "Whether `org-mode' headlines should be scaled.")

(defvar mawce-scale-outline-headlines nil
  "Whether `outline-mode' headlines should be scaled.")

(defcustom mawce-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'mawce-theme
  :package-version '(mawce . "0.0"))

(defcustom mawce-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'mawce-theme
  :package-version '(mawce . "0.0"))

(defcustom mawce-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'mawce-theme
  :package-version '(mawce . "0.0"))

(defcustom mawce-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'mawce-theme
  :package-version '(mawce . "0.0"))

(defcustom mawce-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'mawce-theme
  :package-version '(mawce . "0.0"))

(defcustom mawce-theme-style :dark
  "Selection of coloring themes within the theme."
  :type 'symbol ;string
  :group 'mawce-theme
  :package-version '(mawce . "0.0"))

;;;; Color Palettes

;; Template
;; ("mawce-y-0x-4" . "#")
;; ("mawce-y-0x-3" . "#")
;; ("mawce-y-0x-2" . "#")
;; ("mawce-y-0x-1" . "#")
;; ("mawce-y-0x"   . "#")
;; ("mawce-y-0x+1" . "#")
;; ("mawce-y-0x+2" . "#")
;; ("mawce-y-0x+3" . "#")
;; ("mawce-y-0x+4" . "#")


(defvar mawce-colors-pallete-alist
  '(
    ;; Darker Modes
    ("mawce-dark-orange-3"      . "#f30928")
    ("mawce-dark-orange-2"      . "#812b16")
    ("mawce-dark-orange-1"      . "#462e13")
    ("mawce-dark-orange"        . "#070501")
    ("mawce-dark-orange+1"      . "#070600")
    ("mawce-dark-yellow-3"      . "#f2390c")
    ("mawce-dark-yellow-2"      . "#835018")
    ("mawce-dark-yellow-1"      . "#494115")
    ("mawce-dark-yellow"        . "#0c0c02")
    ("mawce-dark-yellow+1"      . "#090b00")
    ("mawce-dark-limegreen-3"   . "#c9de24")
    ("mawce-dark-limegreen-2"   . "#557d23")
    ("mawce-dark-limegreen-1"   . "#25481b")
    ("mawce-dark-limegreen"     . "#051004")
    ("mawce-dark-limegreen+1"   . "#020f03")
    ("mawce-dark-cyan3-3"       . "#66d631")
    ("mawce-dark-cyan3-2"       . "#297e2a")
    ("mawce-dark-cyan3-1"       . "#204c2f")
    ("mawce-dark-cyan3"         . "#07170f")
    ("mawce-dark-cyan3+1"       . "#041510")
    ("mawce-dark-cyan2-3"       . "#45c85e")
    ("mawce-dark-cyan2-2"       . "#337c59")
    ("mawce-dark-cyan2-1"       . "#274e48")
    ("mawce-dark-cyan2"         . "#0c1e1d")
    ("mawce-dark-cyan2+1"       . "#08181b")
    ("mawce-dark-cyan-3"        . "#51c38c")
    ("mawce-dark-cyan-2"        . "#3a7e74")
    ("mawce-dark-cyan-1"        . "#2d4c53")
    ("mawce-dark-cyan"          . "#111f26")
    ("mawce-dark-cyan+1"        . "#0b1723")
    ("mawce-dark-blue-3"        . "#5bbfaf")
    ("mawce-dark-blue-2"        . "#407580")
    ("mawce-dark-blue-1"        . "#324457")
    ("mawce-dark-blue"          . "#151d2c")
    ("mawce-dark-blue+1"        . "#0e1328")
    ("mawce-dark-blue2-3"       . "#69a5ba")
    ("mawce-dark-blue2-2"       . "#4a6284")
    ("mawce-dark-blue2-1"       . "#3b3e5e")
    ("mawce-dark-blue2"         . "#201e37")
    ("mawce-dark-blue2+1"       . "#1d1631")
    ("mawce-dark-grayviolet2-3" . "#7993b5")
    ("mawce-dark-grayviolet2-2" . "#565b86")
    ("mawce-dark-grayviolet2-1" . "#4d4664")
    ("mawce-dark-grayviolet2"   . "#312840")
    ("mawce-dark-grayviolet2+1" . "#2d1e39")
    ("mawce-dark-grayviolet-2"  . "#6c638c")
    ("mawce-dark-grayviolet-1"  . "#61536d")
    ("mawce-dark-grayviolet"    . "#46364d")
    ("mawce-dark-grayviolet+1"  . "#402a43")
    ("mawce-dark-graymagenta-3" . "#888cb3")
    ("mawce-dark-graymagenta-2" . "#847391")
    ("mawce-dark-graymagenta-1" . "#756277")
    ("mawce-dark-graymagenta"   . "#5a4659")
    ("mawce-dark-graymagenta+1" . "#4e3849")
    ("mawce-dark-graypink-3"    . "#aea3b6")
    ("mawce-dark-graypink-2"    . "#948296")
    ("mawce-dark-graypink-1"    . "#80707c")
    ("mawce-dark-graypink"      . "#665660")
    ("mawce-dark-graypink+1"    . "#57464e")
    ("mawce-dark-grayred2-1"    . "#91888b")
    ("mawce-dark-grayred2"      . "#7d7073")
    ("mawce-dark-grayred2+1"    . "#6a5c5d")
    ("mawce-dark-grayred-1"     . "#a09a9b")
    ("mawce-dark-grayred"       . "#8f8585")
    ("mawce-dark-grayred+1"     . "#7a6f6d")
    ("mawce-dark-grayorange-1"  . "#b4b2b0") ;; fg
    ("mawce-dark-grayorange"    . "#a6a4a0")
    ("mawce-dark-grayorange+1"  . "#8d8c83")
    ("mawce-dark-grayyellow-3"  . "#e7e6e6")
    ("mawce-dark-grayyellow-2"  . "#dddddc")
    ("mawce-dark-grayyellow-1"  . "#d7d7d6")
    ("mawce-dark-grayyellow"    . "#d0d0ce")
    ("mawce-dark-grayyellow+1"  . "#aeafab")
    ;; Lighter Modes
    ("mawce-blue-01-4"          . "#ced5ff")
    ("mawce-blue-01-3"          . "#bcc4ff")
    ("mawce-blue-01-2"          . "#a4adff")
    ("mawce-blue-01-1"          . "#6170d3")
    ("mawce-blue-01"            . "#4356b5")
    ("mawce-blue-01+1"          . "#2c43b5")
    ("mawce-blue-01+2"          . "#1f38b5")
    ("mawce-blue-01+3"          . "#1732b5")
    ("mawce-blue-01+4"          . "#001eb5")
    ("mawce-blue-02-4"          . "#cbcbcb")
    ("mawce-blue-02-3"          . "#b2bbcb")
    ("mawce-blue-02-2"          . "#8da3cb")
    ("mawce-blue-02-1"          . "#7c98cb")
    ("mawce-blue-02"            . "#5f86cb")
    ("mawce-blue-02+1"          . "#4072cb")
    ("mawce-blue-02+2"          . "#3169cb")
    ("mawce-blue-02+3"          . "#1356cb")
    ("mawce-blue-02+4"          . "#0049cb")
    ("mawce-blue-03-4"          . "#dadada")
    ("mawce-blue-03-3"          . "#c2d4da")
    ("mawce-blue-03-2"          . "#a6cdda")
    ("mawce-blue-03-1"          . "#8fc8da")
    ("mawce-blue-03"            . "#74c1da")
    ("mawce-blue-03+1"          . "#51b8da")
    ("mawce-blue-03+2"          . "#3cb3da")
    ("mawce-blue-03+3"          . "#22adda")
    ("mawce-blue-03+4"          . "#00a5da")
    ("mawce-aqua-01-4"          . "#eeeeee")
    ("mawce-aqua-01-3"          . "#d1eee1")
    ("mawce-aqua-01-2"          . "#c3eeda")
    ("mawce-aqua-01-1"          . "#aceed0")
    ("mawce-aqua-01"            . "#94eec5")
    ("mawce-aqua-01+1"          . "#67eeb0")
    ("mawce-aqua-01+2"          . "#4beea4")
    ("mawce-aqua-01+3"          . "#30ee98")
    ("mawce-aqua-01+4"          . "#00ee82")
    ("mawce-lightaqua-01-4"     . "#fdfdfd")
    ("mawce-lightaqua-01-3"     . "#eefdf1")
    ("mawce-lightaqua-01-2"     . "#e2fde8")
    ("mawce-lightaqua-01-1"     . "#d8fde0")
    ("mawce-lightaqua-01"       . "#cafdd5")
    ("mawce-lightaqua-01+1"     . "#93fdaa")
    ("mawce-lightaqua-01+2"     . "#6efd8d")
    ("mawce-lightaqua-01+3"     . "#3afd64")
    ("mawce-lightaqua-01+4"     . "#00fd37")
    ("mawce-yellowgray-01-4"    . "#fefefe")
    ("mawce-yellowgray-01-3"    . "#fdfef8")
    ("mawce-yellowgray-01-2"    . "#fcfef3")
    ("mawce-yellowgray-01-1"    . "#fbfef0")
    ("mawce-yellowgray-01"      . "#fafeeb")
    ("mawce-yellowgray-01+1"    . "#ebfea3")
    ("mawce-yellowgray-01+2"    . "#dffe69")
    ("mawce-yellowgray-01+3"    . "#d9fe4e")
    ("mawce-yellowgray-01+4"    . "#c9fe00")
    ("mawce-violet-01-4"        . "#a9a9a9")
    ("mawce-violet-01-3"        . "#9187a9")
    ("mawce-violet-01-2"        . "#7967a9")
    ("mawce-violet-01-1"        . "#644aa9")
    ("mawce-violet-01"          . "#5231a9")
    ("mawce-violet-01+1"        . "#4824a9")
    ("mawce-violet-01+2"        . "#4019a9")
    ("mawce-violet-01+3"        . "#370ca9")
    ("mawce-violet-01+4"        . "#2e00a9")
    ("mawce-darkviolet-01-4"    . "#9c9c9c")
    ("mawce-darkviolet-01-3"    . "#8f789c")
    ("mawce-darkviolet-01-2"    . "#855b9c")
    ("mawce-darkviolet-01-1"    . "#7a3e9c")
    ("mawce-darkviolet-01"      . "#6f1e9c")
    ("mawce-darkviolet-01+1"    . "#6c179c")
    ("mawce-darkviolet-01+2"    . "#690e9c")
    ("mawce-darkviolet-01+3"    . "#67069c")
    ("mawce-darkviolet-01+4"    . "#64009c")
    ("mawce-darkmagenta-01-4"   . "#8d8d8d")
    ("mawce-darkmagenta-01-3"   . "#8c628d")
    ("mawce-darkmagenta-01-2"   . "#8b428d")
    ("mawce-darkmagenta-01-1"   . "#8a258d")
    ("mawce-darkmagenta-01"     . "#890b8d")
    ("mawce-darkmagenta-01+1"   . "#89068d")
    ("mawce-darkmagenta-01+2"   . "#89058d")
    ("mawce-darkmagenta-01+3"   . "#89028d")
    ("mawce-darkmagenta-01+4"   . "#89008d")
    ("mawce-darkpink-01-4"      . "#7a7a7a")
    ("mawce-darkpink-01-3"      . "#7a5c6c")
    ("mawce-darkpink-01-2"      . "#7a3d5e")
    ("mawce-darkpink-01-1"      . "#7a2553")
    ("mawce-darkpink-01"        . "#7a0c47")
    ("mawce-darkpink-01+1"      . "#7a0845")
    ("mawce-darkpink-01+2"      . "#7a0544")
    ("mawce-darkpink-01+3"      . "#7a0242")
    ("mawce-darkpink-01+4"      . "#7a0041")
    ("mawce-verydarkred-0x-4"   . "#696969")
    ("mawce-verydarkred-0x-3"   . "#694b4e")
    ("mawce-verydarkred-0x-2"   . "#693237")
    ("mawce-verydarkred-0x-1"   . "#691b22")
    ("mawce-verydarkred-0x"     . "#69000a")
    ("mawce-white-01"           . "#fafafa")
    ("mawce-black-01"           . "#180000")
    ;; OKLCH Light
    ("mawce-light-003" . "#e5abb9")
    ("mawce-light-013" . "#e7acb1")
    ("mawce-light-023" . "#e8ada9")
    ("mawce-light-033" . "#e7aea1")
    ("mawce-light-043" . "#e5b09a")
    ("mawce-light-053" . "#e3b294")
    ("mawce-light-063" . "#dfb48f")
    ("mawce-light-073" . "#dab78c")
    ("mawce-light-083" . "#d4ba8a")
    ("mawce-light-093" . "#cdbd8a")
    ("mawce-light-103" . "#c6c08c")
    ("mawce-light-113" . "#bdc38f")
    ("mawce-light-123" . "#b5c694")
    ("mawce-light-133" . "#acc89a")
    ("mawce-light-143" . "#a4caa1")
    ("mawce-light-153" . "#9ccba9")
    ("mawce-light-163" . "#94ccb1")
    ("mawce-light-173" . "#8ecdb9")
    ("mawce-light-183" . "#8acdc2")
    ("mawce-light-193" . "#87ccca")
    ("mawce-light-203" . "#86ccd2")
    ("mawce-light-213" . "#88cad9")
    ("mawce-light-223" . "#8bc8df")
    ("mawce-light-233" . "#90c6e4")
    ("mawce-light-243" . "#97c4e8")
    ("mawce-light-253" . "#9ec1ea")
    ("mawce-light-263" . "#a6beec")
    ("mawce-light-273" . "#aebbec")
    ("mawce-light-283" . "#b7b9ea")
    ("mawce-light-293" . "#bfb6e7")
    ("mawce-light-303" . "#c7b3e3")
    ("mawce-light-313" . "#ceb1de")
    ("mawce-light-323" . "#d4afd8")
    ("mawce-light-333" . "#daadd1")
    ("mawce-light-343" . "#dfacca")
    ("mawce-light-353" . "#e3acc2")
    ;; OKLCH Medium
    ("mawce-medium-003" . "#ae7785")
    ("mawce-medium-013" . "#af787d")
    ("mawce-medium-023" . "#b07975")
    ("mawce-medium-033" . "#af7a6e")
    ("mawce-medium-043" . "#ae7c67")
    ("mawce-medium-053" . "#ab7e61")
    ("mawce-medium-063" . "#a8805c")
    ("mawce-medium-073" . "#a38359")
    ("mawce-medium-083" . "#9e8657")
    ("mawce-medium-093" . "#988857")
    ("mawce-medium-103" . "#918b59")
    ("mawce-medium-113" . "#898e5c")
    ("mawce-medium-123" . "#819061")
    ("mawce-medium-133" . "#799367")
    ("mawce-medium-143" . "#70946e")
    ("mawce-medium-153" . "#689675")
    ("mawce-medium-163" . "#60977d")
    ("mawce-medium-173" . "#5a9785")
    ("mawce-medium-183" . "#55978d")
    ("mawce-medium-193" . "#529795")
    ("mawce-medium-203" . "#51969c")
    ("mawce-medium-213" . "#5395a2")
    ("mawce-medium-223" . "#5793a8")
    ("mawce-medium-233" . "#5d91ad")
    ("mawce-medium-243" . "#638eb1")
    ("mawce-medium-253" . "#6b8cb3")
    ("mawce-medium-263" . "#7389b4")
    ("mawce-medium-273" . "#7b87b4")
    ("mawce-medium-283" . "#8384b3")
    ("mawce-medium-293" . "#8a81b0")
    ("mawce-medium-303" . "#927fac")
    ("mawce-medium-313" . "#987da8")
    ("mawce-medium-323" . "#9e7ba2")
    ("mawce-medium-333" . "#a37a9b")
    ("mawce-medium-343" . "#a87894")
    ("mawce-medium-353" . "#ab788d")
    ;; OKLCH Dark
    ("mawce-dark-003" . "#703f4c")
    ("mawce-dark-013" . "#713f45")
    ("mawce-dark-023" . "#71403d")
    ("mawce-dark-033" . "#714136")
    ("mawce-dark-043" . "#704230")
    ("mawce-dark-053" . "#6e4429")
    ("mawce-dark-063" . "#6b4724")
    ("mawce-dark-073" . "#674920")
    ("mawce-dark-083" . "#624c1d")
    ("mawce-dark-093" . "#5d4f1d")
    ("mawce-dark-103" . "#57511f")
    ("mawce-dark-113" . "#505423")
    ("mawce-dark-123" . "#485629")
    ("mawce-dark-133" . "#40582f")
    ("mawce-dark-143" . "#385a36")
    ("mawce-dark-153" . "#2f5b3d")
    ("mawce-dark-163" . "#255c45")
    ("mawce-dark-173" . "#1c5c4c")
    ("mawce-dark-183" . "#135c53")
    ("mawce-dark-193" . "#0c5c5a")
    ("mawce-dark-203" . "#0b5b61")
    ("mawce-dark-213" . "#105a67")
    ("mawce-dark-223" . "#18586c")
    ("mawce-dark-233" . "#215670")
    ("mawce-dark-243" . "#2a5473")
    ("mawce-dark-253" . "#335275")
    ("mawce-dark-263" . "#3b4f76")
    ("mawce-dark-273" . "#434d76")
    ("mawce-dark-283" . "#4a4a75")
    ("mawce-dark-293" . "#514873")
    ("mawce-dark-303" . "#58466f")
    ("mawce-dark-313" . "#5d446b")
    ("mawce-dark-323" . "#624266")
    ("mawce-dark-333" . "#674160")
    ("mawce-dark-343" . "#6a405a")
    ("mawce-dark-353" . "#6d3f53")
    ;; Dark backgrounds
    ("mawce-dark-background-022"  . "#2a1716")
    ("mawce-dark-background-052"  . "#29190f")
    ("mawce-dark-background-082"  . "#241c0b")
    ("mawce-dark-background-112"  . "#1d1f0c")
    ("mawce-dark-background-142"  . "#142113")
    ("mawce-dark-background-172"  . "#0b221b")
    ("mawce-dark-background-202"  . "#072123")
    ("mawce-dark-background-232"  . "#0c2029")
    ("mawce-dark-background-262"  . "#151d2c")
    ("mawce-dark-background-292"  . "#1d1a2b")
    ("mawce-dark-background-322"  . "#241826")
    ("mawce-dark-background-352"  . "#29171f")
    ;; Medium backgrounds
    ("mawce-medium-background-022" .  "#79615f")
    ("mawce-medium-background-052" .  "#766357")
    ("mawce-medium-background-082" .  "#706653")
    ("mawce-medium-background-112" .  "#676955")
    ("mawce-medium-background-142" .  "#5d6c5c")
    ("mawce-medium-background-172" .  "#586d62")
    ("mawce-medium-background-202" .  "#526d6f")
    ("mawce-medium-background-232" .  "#566b76")
    ("mawce-medium-background-262" .  "#5e687a")
    ("mawce-medium-background-292" .  "#676478")
    ("mawce-medium-background-322" .  "#706272")
    ("mawce-medium-background-352" .  "#766069")
    ;; Light backgrounds
    ("mawce-light-background-022" . "#d1b6b4")
    ("mawce-light-background-052" . "#ceb8ab")
    ("mawce-light-background-082" . "#c7bca7")
    ("mawce-light-background-112" . "#bdc0a9")
    ("mawce-light-background-142" . "#b3c3b0")
    ("mawce-light-background-172" . "#aac4bb")
    ("mawce-light-background-202" . "#a7c4c6")
    ("mawce-light-background-232" . "#aac1ce")
    ("mawce-light-background-262" . "#b3bed2")
    ("mawce-light-background-292" . "#bdbad0")
    ("mawce-light-background-322" . "#c7b7c9")
    ("mawce-light-background-352" . "#ceb6bf")
    ;; Grayscale
    ("mawce-grayscales-98" . "#f9f9f9")
    ("mawce-grayscales-88" . "#d8d8d8")
    ("mawce-grayscales-78" . "#b7b7b7")
    ("mawce-grayscales-68" . "#989898")
    ("mawce-grayscales-58" . "#7a7a7a")
    ("mawce-grayscales-48" . "#5e5e5e")
    ("mawce-grayscales-38" . "#434343")
    ("mawce-grayscales-28" . "#292929")
    ("mawce-grayscales-18" . "#121212")
    ("mawce-grayscales-08" . "#020202")
    ;; Mawce Blue Scale
    ("mawce-bluescale-000" . "#3f3f3f")
    ("mawce-bluescale-001" . "#3c3f47")
    ("mawce-bluescale-002" . "#393e4f")
    ("mawce-bluescale-003" . "#373e57")
    ("mawce-bluescale-004" . "#343d5f")
    ("mawce-bluescale-005" . "#323c66")
    ("mawce-bluescale-006" . "#2f3a6d")
    ("mawce-bluescale-007" . "#2d3975")
    ("mawce-bluescale-008" . "#2b377c")
    ("mawce-bluescale-009" . "#293484")
    ("mawce-bluescale-010" . "#28318b")
    )
  "List of Mawce colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is darker.
`-N' suffixes indicate a color is lighter.")

(defvar mawce-default-colors-plist
  '(("mawce-fg"                                  . '(:dark  "mawce-dark-grayorange-1"
                                                            :oklch-dark "mawce-light-background-262"
                                                            :oklch-medium "mawce-light-background-262"
                                                            :oklch-light "mawce-dark-background-262"))
    ("mawce-bg"                                  . '(:dark  "mawce-dark-blue"
                                                            :oklch-dark "mawce-bluescale-002"
                                                            :oklch-medium "mawce-medium-background-202"
                                                            :oklch-light "mawce-light-background-232"))
    ("mawce-region-bg"                           . '(:dark  "mawce-dark-blue-1"
                                                            :oklch-dark "mawce-dark-143"
                                                            :oklch-medium "mawce-medium-143"
                                                            :oklch-light "mawce-light-143"))
    ("mawce-region-fg"                           . '(:dark "mawce-dark-blue-1"
                                                           :oklch-dark "mawce-light-233"
                                                           :oklch-light "mawce-medium-233"))
    ("mawce-highlight"                           . '(:dark "mawce-dark-yellow-1"
                                                           :oklch-dark "mawce-light-background-022"
                                                           :oklch-medium "mawce-medium-background-022"
                                                           :oklch-light "mawce-dark-background-022"))
    ("mawce-internal-border"                     . '(:dark ""
                                                           :oklch-dark "mawce-dark-blue"
                                                           :oklch-medium "mawce-dark-blue"
                                                           :oklch-light "mawce-dark-blue"))
    ("mawce-fringe-fg"                           . '(:dark  "mawce-dark-cyan+1"
                                                            :oklch-dark "mawce-light-background-232"
                                                            :oklch-medium "mawce-medium-background-232"
                                                            :oklch-light "mawce-dark-background-232"))
    ("mawce-fringe-bg"                           . '(:dark  "mawce-dark-blue"
                                                            :oklch-dark "mawce-bluescale-002"
                                                            :oklch-medium "mawce-bluescale-002"
                                                            :oklch-light "mawce-bluescale-002"))
    ;; ("mawce-fringe-bg"                           . '(:dark "mawce-dark-blue2-2"
    ;;                                                  :oklch-dark "mawce-dark-background-232"
    ;;                                                  :oklch-medium "mawce-medium-background-232"
    ;;                                                  :oklch-light "mawce-dark-background-232"))
    ("mawce-cursor-bg"                           . '(:dark  "mawce-dark-grayred-1"
                                                            :oklch-dark "mawce-light-253"
                                                            :oklch-medium "mawce-medium-253"
                                                            :oklch-light "mawce-dark-253"))
    ("mawce-success"                             . '(:dark  "mawce-dark-cyan3-3"
                                                            :oklch-dark "mawce-light-153"
                                                            :oklch-medium "mawce-medium-153"
                                                            :oklch-light "mawce-dark-153"))
    ("mawce-warning"                             . '(:dark  "mawce-dark-yellow-3"
                                                            :oklch-dark "mawce-light-083"
                                                            :oklch-medium "mawce-medium-083"
                                                            :oklch-light "mawce-dark-083"))
    ;; ("mawce-alert"                            . '(:dark "mawce-")
    ;; Elfeed
    ("mawce-elfeed-search-date-face-fg"          . '(:dark  nil
                                                            :oklch-dark "mawce-light-273"
                                                            :oklch-medium "mawce-medium-273"
                                                            :oklch-light "mawce-dark-273"))
    ("mawce-elfeed-search-title-face-fg"         . '(:dark  nil
                                                            :oklch-dark "mawce-grayscales-88"
                                                            :oklch-medium "mawce-grayscales-58"
                                                            :oklch-light "mawce-grayscales-28"))
    ("mawce-elfeed-search-feed-face-fg"          . '(:dark  nil
                                                            :oklch-dark "mawce-light-083"
                                                            :oklch-medium "mawce-medium-083"
                                                            :oklch-light "mawce-dark-083"))
    ("mawce-elfeed-search-tag-face-fg"           . '(:dark  nil
                                                            :oklch-dark "mawce-light-123"
                                                            :oklch-medium "mawce-medium-123"
                                                            :oklch-light "mawce-dark-123"))
    ;; ("mawce-elfeed-search-title-face-fg"         . '(:dark  "mawce-dark-graymagenta-2"
    ;;                                                  :oklch-dark "mawce-light-283"
    ;;                                                  :oklch-medium "mawce-medium-283"
    ;;                                                  :oklch-light "mawce-dark-283"))
    ;; Font Lock
    ("mawce-fl-builtin"                          . '(:dark  "mawce-dark-graymagenta-2"
                                                            :oklch-dark "mawce-light-283"
                                                            :oklch-medium "mawce-medium-283"
                                                            :oklch-light "mawce-dark-283"))
    ("mawce-fl-comment-delimiter"                . '(:dark  "mawce-dark-grayviolet2"
                                                            :oklch-dark "mawce-light-263"
                                                            :oklch-medium "mawce-medium-263"
                                                            :oklch-light "mawce-dark-263"))
    ("mawce-fl-comment"                          . '(:dark  "mawce-dark-grayviolet2-1"
                                                            :oklch-dark "mawce-light-263"
                                                            :oklch-medium "mawce-medium-263"
                                                            :oklch-light "mawce-dark-263"))
    ("mawce-fl-constant"                         . '(:dark  "mawce-dark-limegreen-3"
                                                            :oklch-dark "mawce-light-123"
                                                            :oklch-medium "mawce-medium-123"
                                                            :oklch-light "mawce-dark-123"))
    ("mawce-fl-doc"                              . '(:dark  "mawce-dark-limegreen-2"
                                                            :oklch-dark "mawce-light-223"
                                                            :oklch-medium "mawce-medium-223"
                                                            :oklch-light "mawce-dark-223"))
    ("mawce-fl-function-name"                    . '(:dark  "mawce-dark-grayviolet2-2"
                                                            :oklch-dark "mawce-light-223"
                                                            :oklch-medium "mawce-medium-223"
                                                            :oklch-light "mawce-dark-223"))
    ("mawce-fl-keyword"                          . '(:dark  "mawce-dark-cyan-2"
                                                            :oklch-dark "mawce-light-183"
                                                            :oklch-medium "mawce-medium-183"
                                                            :oklch-light "mawce-dark-183"))
    ("mawce-fl-re-grouping-construct"            . '(:dark  "mawce-dark-blue2-3"
                                                            :oklch-dark "mawce-light-143"
                                                            :oklch-medium "mawce-medium-143"
                                                            :oklch-light "mawce-dark-143"))
    ("mawce-fl-re-grouping-backslash"            . '(:dark  "mawce-dark-blue2-2"
                                                            :oklch-dark "mawce-light-153"
                                                            :oklch-medium "mawce-medium-153"
                                                            :oklch-light "mawce-dark-153"))
    ("mawce-fl-string"                           . '(:dark  "mawce-dark-graymagenta-3"
                                                            :oklch-dark "mawce-light-283"
                                                            :oklch-medium "mawce-medium-283"
                                                            :oklch-light "mawce-dark-283"))
    ("mawce-fl-type"                             . '(:dark  "mawce-dark-cyan-3"
                                                            :oklch-dark "mawce-light-163"
                                                            :oklch-medium "mawce-medium-163"
                                                            :oklch-light "mawce-dark-163"))
    ("mawce-fl-variable-name"                    . '(:dark  "mawce-dark-grayyellow+1"
                                                            :oklch-dark "mawce-light-353"
                                                            :oklch-medium "mawce-medium-353"
                                                            :oklch-light "mawce-dark-353"))
    ("mawce-fl-warning"                          . '(:dark  "mawce-dark-yellow-3"
                                                            :oklch-dark "mawce-light-003"
                                                            :oklch-medium "mawce-medium-003"
                                                            :oklch-light "mawce-dark-003"))
    ;; ("mawce-fl-negation-char"                 . '(:dark "")
    ;; ("mawce-fl-preprocessor-face"             . '(:dark "")
    ;; hl-line
    ("mawce-hl-line-fg"                          . '(:oklch-dark ""
                                                                 :oklch-light ""))
    ;; Org
    ;; ("mawce-org-agenda-date-today-fg"         . '(:dark "mawce-")
    ;; ("mawce-org-agenda-structure"             . '(:dark "mawce-") ;; inherits font-lock-comment-face
    ;; ("mawce-org-archived-fg"                  . '(:dark "mawce-")
    ("mawce-org-code-bg"                         . '(:dark  "mawce-dark-grayviolet2"
                                                            :oklch-dark "mawce-dark-293"
                                                            :oklch-medium "mawce-medium-293"
                                                            :oklch-light "mawce-light-293"))
    ("mawce-org-code-fg"                         . '(:dark  "mawce-dark-grayviolet2-3"
                                                            :oklch-dark "mawce-medium-243"
                                                            :oklch-medium "mawce-light-243"
                                                            :oklch-light "mawce-dark-243"))
    ("mawce-org-block-bg"                        . '(:dark  "mawce-dark-grayviolet2"
                                                            :oklch-dark "mawce-dark-background-292"
                                                            :oklch-medium "mawce-medium-background-232"
                                                            :oklch-light "mawce-light-background-202"))
    ("mawce-org-block-lines-bg"                  . '(:dark  "mawce-dark-grayviolet2+1"
                                                            :oklch-dark "mawce-dark-background-292"
                                                            ;;:oklch-dark "mawce-dark-background-352"
                                                            :oklch-medium "mawce-medium-background-262"
                                                            :oklch-light "mawce-light-background-082"))
    ("mawce-org-block-lines-fg"                  . '(:dark  "mawce-dark-grayviolet2-3"
                                                            :oklch-dark "mawce-light-243"
                                                            :oklch-medium "mawce-medium-243"
                                                            :oklch-light "mawce-dark-243"))
    ;; ("mawce-org-checkbox-bg"                  . '(:dark "mawce-")
    ;; ("mawce-org-checkbox-fg"                  . '(:dark "mawce-")
    ;; ("mawce-org-date-fg"                      . '(:dark "mawce-")
    ;; ("mawce-org-deadline-announce-fg"         . '(:dark "mawce-")
    ;; ("mawce-org-done-fg"                      . '(:dark "mawce-dark-grayviolet+1")
    ;; ("mawce-org-formula-fg"                   . '(:dark "mawce-")
    ("mawce-org-headline-done-fg"                . '(:dark  "mawce-dark-grayviolet"
                                                            :oklch-dark "mawce-light-263"
                                                            :oklch-medium "mawce-medium-263"
                                                            :oklch-light "mawce-dark-263"))
    ;; ("mawce-org-hide-fg"                      . '(:dark "mawce-")
    ("mawce-org-level-1-fg"                      . '(:dark  "mawce-dark-grayviolet-2"
                                                            :oklch-dark "mawce-light-223"
                                                            :oklch-medium "mawce-medium-223"
                                                            :oklch-light "mawce-dark-223"))
    ("mawce-org-level-2-fg"                      . '(:dark  "mawce-dark-graypink-2"
                                                            :oklch-dark "mawce-light-183"
                                                            :oklch-medium "mawce-medium-183"
                                                            :oklch-light "mawce-dark-183"))
    ("mawce-org-level-3-fg"                      . '(:dark  "mawce-dark-cyan-2"
                                                            :oklch-dark "mawce-light-143"
                                                            :oklch-medium "mawce-medium-143"
                                                            :oklch-light "mawce-dark-143"))
    ("mawce-org-level-4-fg"                      . '(:dark  "mawce-dark-cyan2-2"
                                                            :oklch-dark "mawce-light-103"
                                                            :oklch-medium "mawce-medium-103"
                                                            :oklch-light "mawce-dark-103"))
    ("mawce-org-level-5-fg"                      . '(:dark  "mawce-dark-cyan3-2"
                                                            :oklch-dark "mawce-light-003"
                                                            :oklch-medium "mawce-medium-003"
                                                            :oklch-light "mawce-dark-003"))
    ("mawce-org-level-6-fg"                      . '(:dark  "mawce-dark-limegreen-2"
                                                            :oklch-dark "mawce-light-063"
                                                            :oklch-medium "mawce-medium-063"
                                                            :oklch-light "mawce-dark-063"))
    ("mawce-org-level-7-fg"                      . '(:dark  "mawce-dark-yellow-2"
                                                            :oklch-dark "mawce-light-033"
                                                            :oklch-medium "mawce-medium-033"
                                                            :oklch-light "mawce-dark-033"))
    ("mawce-org-level-8-fg"                      . '(:dark  "mawce-dark-orange-2"
                                                            :oklch-dark "mawce-light-093"
                                                            :oklch-medium "mawce-medium-093"
                                                            :oklch-light "mawce-dark-093"))
    ("mawce-org-link-fg"                         . '(:dark "mawce-violet-01-2"
                                                           :oklch-dark "mawce-light-193"
                                                           :oklch-medium "mawce-medium-193"
                                                           :oklch-light "mawce-dark-193"))
    ("mawce-org-meta-line-fg"                    . '(:dark  "mawce-dark-grayred+1"
                                                            :oklch-dark "mawce-grayscales-68"
                                                            :oklch-medium "mawce-grayscales-68"
                                                            :oklch-light "mawce-grayscales-68"))
    ;; ("mawce-org-quote-bg"                     . '(:dark "mawce-")
    ;; ("mawce-org-scheduled-fg"                 . '(:dark "mawce-")
    ;; ("mawce-org-scheduled-previously-fg"      . '(:dark "mawce-")
    ;; ("mawce-org-scheduled-today-fg"           . '(:dark "mawce-")
    ("mawce-org-sexp-date-fg"                 . '(:dark nil
                                                        :oklch-dark "mawce-grayscales-68"
                                                        :oklch-medium "mawce-grayscales-68"
                                                        :oklch-light "mawce-grayscales-68"))
    ("mawce-org-special-keyword"              . '(:oklch-dark "mawce-light-background-322"))
    ("mawce-org-table-fg"                        . '(:dark  "mawce-dark-grayred2-1"
                                                            :oklch-dark "mawce-light-233"
                                                            :oklch-medium "mawce-medium-233"
                                                            :oklch-light "mawce-dark-233"))
    ;; ("mawce-org-time-grid-fg"                 . '(:dark "mawce-")
    ("mawce-org-todo-fg"                         . '(:dark  "mawce-dark-cyan3-2"
                                                            :oklch-dark "mawce-light-143"
                                                            :oklch-medium "mawce-medium-143"
                                                            :oklch-light "mawce-dark-143"))
    ;; ("mawce-org-upcoming-headline-fg"         . '(:dark "mawce-")
    ;; ("mawce-org-warning-fg"                   . '(:dark "mawce-")
    ;; ("mawce-org-column-bg"                    . '(:dark "mawce-")
    ;; ("mawce-org-column-title"                 . '(:dark "mawce-")
    ;; ("mawce-org-mode-line-clock-fg"           . '(:dark "mawce-")
    ;; ("mawce-org-mode-line-clock-bg"           . '(:dark "mawce-")
    ;; ("mawce-org-mode-line-clock-overrun-fg"   . '(:dark "mawce-")
    ;; ("mawce-org-mode-line-clock-overrun-bg"   . '(:dark "mawce-")
    ("mawce-org-ellipsis-fg"                  . '(:dark "mawce-"
                                                        :oklch-dark "mawce-dark-293"
                                                        :oklch-medium "mawce-medium-293"
                                                        :oklch-light "mawce-light-293"))
    ;; ("mawce-org-footnote-fg"                  . '(:dark "mawce-")
    ("mawce-org-document-title-fg"               . '(:dark "mawce-dark-limegreen-2"
                                                           :oklch-dark "mawce-light-053"
                                                           :oklch-medium "mawce-medium-053"
                                                           :oklch-light "mawce-dark-053"))
    ("mawce-org-document-info-fg"                . '(:dark "mawce-dark-limegreen-2"
                                                           :oklch-dark "mawce-light-053"
                                                           :oklch-medium "mawce-medium-053"
                                                           :oklch-light "mawce-dark-053"))
    ("mawce-org-document-info-keyword-fg"        . '(:dark "mawce-dark-limegreen-1"
                                                           :oklch-dark "mawce-grayscales-68"
                                                           :oklch-medium "mawce-grayscales-68"
                                                           :oklch-light "mawce-grayscales-68"))
    ("mawce-org-drawer-fg"                       . '(:dark "mawce-dark-blue2-1"
                                                           :oklch-dark "mawce-light-313"
                                                           :oklch-medium "mawce-medium-313"
                                                           :oklch-light "mawce-dark-313"))
    ("mawce-org-verbatim-fg"                     . '(:dark "mawce-dark-grayorange+1"
                                                           :oklch-dark "mawce-light-253"
                                                           :oklch-medium "mawce-medium-253"
                                                           :oklch-light "mawce-dark-253"))
    ;; Perspective
    ("mawce-persp-selected-face"                 . '(:oklch-dark "mawce-light-163"
						                                         :oklch-medium "mawce-medium-163"
						                                         :oklch-light "mawce-dark-163"))
    ;; Compilation
    ("mawce-compilation-error-fg"                . '(:dark nil
                                                           :oklch-dark "mawce-light-023"
                                                           :oklch-medium "mawce-medium-023"
                                                           :oklch-light "mawce-dark-023"))
    ("mawce-compilation-warning-fg"                . '(:dark nil
                                                             :oklch-dark "mawce-light-103"
                                                             :oklch-medium "mawce-medium-103"
                                                             :oklch-light "mawce-dark-103"))
    ("mawce-compilation-info-fg"                . '(:dark nil
                                                          :oklch-dark "mawce-light-173"
                                                          :oklch-medium "mawce-medium-173"
                                                          :oklch-light "mawce-dark-173"))
    ;; ;;Org-habit
    ;; ("mawce-org-habit-ready-face-bg"          . '(:dark "mawce-")
    ;; ("mawce-org-habit-alert-face-fg"          . '(:dark "mawce-")
    ;; ("mawce-org-habit-alert-face-bg"          . '(:dark "mawce-")
    ;; ("mawce-org-habit-clear-face-bg"          . '(:dark "mawce-")
    ;; ("mawce-org-habit-overdue-face-bg"        . '(:dark "mawce-")
    ;; ("mawce-org-habit-clear-future-face-bg"   . '(:dark "mawce-")
    ;; ("mawce-org-habit-ready-future-face-bg"   . '(:dark "mawce-")
    ;; ("mawce-org-habit-alert-future-face-bg"   . '(:dark "mawce-")
    ;; ("mawce-org-habit-alert-future-face-fg"   . '(:dark "mawce-")
    ;; ("mawce-org-habit-overdue-future-face-bg" . '(:dark "mawce-")
    ;; Vertico
    ("mawce-vertico-current-fg"                  . '(:dark  "mawce-dark-blue-2"
                                                            :oklch-dark "mawce-light-233"
                                                            :oklch-medium "mawce-medium-233"
                                                            :oklch-light "mawce-dark-233"))
    ;; Minibuffer
    ("mawce-minibuffer-prompt-fg"                . '(:dark  "mawce-dark-limegreen-3"
                                                            :oklch-dark "mawce-light-133"
                                                            :oklch-medium "mawce-medium-133"
                                                            :oklch-light "mawce-dark-133"))
    ;; Modeline
    ("mawce-mode-line-bg"                        . '(:dark  "mawce-dark-blue+1"
                                                            :oklch-dark "mawce-dark-background-262"
                                                            :oklch-medium "mawce-medium-background-262"
                                                            :oklch-light "mawce-light-background-262"))
    ("mawce-mode-line-fg"                        . '(:dark  "mawce-dark-grayorange+1"
                                                            :oklch-dark "mawce-light-background-262"
                                                            :oklch-medium "mawce-medium-background-262"
                                                            :oklch-light "mawce-dark-background-262"))
    ("mawce-mode-line-overline"                  . '(:dark "mawce-dark-graymagenta-2"
                                                           :oklch-dark "mawce-light-303"
                                                           :oklch-medium "mawce-medium-303"
                                                           :oklch-light "mawce-dark-303"))
    ("mawce-mode-line-inactive-overline"         . '(:dark "mawce-dark-graymagenta+1"
                                                           :oklch-dark "mawce-medium-303"
                                                           :oklch-medium "mawce-dark-303"
                                                           :oklch-light "mawce-light-303"))
    ("mawce-mode-line"                           . '(:dark ""
                                                           :oklch-dark ""
                                                           :oklch-medium ""
                                                           :oklch-light ""))
    ("mawce-mode-line-active"                    . '(:dark ""
                                                           :oklch-dark ""
                                                           :oklch-medium ""
                                                           :oklch-light ""))
    ("mawce-mode-line-buffer-id-fg"              . '(:dark nil
                                                           :oklch-dark "mawce-grayscales-88"
                                                           :oklch-medium nil
                                                           :oklch-light "mawce-grayscales-18"))
    ("mawce-mode-line-buffer-id-fg-deemph"        . '(:dark nil
                                                            :oklch-dark "mawce-grayscales-28"
                                                            :oklch-medium nil
                                                            :oklch-light "mawce-grayscales-18"))
    ("mawce-mode-line-emphasis"                  . '(:dark ""
                                                           :oklch-dark ""
                                                           :oklch-medium ""
                                                           :oklch-light ""))
    ("mawce-mode-line-highlight"                 . '(:dark ""
                                                           :oklch-dark ""
                                                           :oklch-medium ""
                                                           :oklch-light ""))
    ("mawce-mode-line-inactive"                  . '(:dark ""
                                                           :oklch-dark ""
                                                           :oklch-medium ""
                                                           :oklch-light ""))
    ;; Comint
    ("mawce-comint-highlight-input-fg"           . '(:dark  "mawce-dark-grayorange+1"
                                                            :oklch-dark "mawce-light-263"
                                                            :oklch-medium "mawce-medium-263"
                                                            :oklch-light "mawce-dark-263"))
    ("mawce-secondary-selection-bg"              . '(:dark  "mawce-dark-blue2-1"
                                                            :oklch-dark "mawce-dark-283"
                                                            :oklch-medium "mawce-medium-283"
                                                            :oklch-light "mawce-dark-283")))
  "A mapping of color names to the pallet names to a plist of configurable views.")

(defmacro mawce-with-color-variables (&rest body)
  "`let' bind all colors defined in `mawce-default-colors-plist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons))
                           (cdr
                            (assoc
                             (plist-get (caddr (assoc (car cons)
                                                      mawce-default-colors-plist))
                                        mawce-theme-style)
                             mawce-colors-pallete-alist))
                           ;; (cdr (assoc (cdr cons)
                           ;;             mawce-colors-pallete-alist))
                           ))
                   mawce-default-colors-plist)
         (z-variable-pitch (if mawce-use-variable-pitch
                               'variable-pitch
			     'fixed-pitch)))
     ,@body))

;;;; Faces
(defun mawce-theme-update ()
  (interactive)
  (mawce-with-color-variables
    (custom-theme-set-faces
     'mawce
     `(default ((t (:foreground ,mawce-fg :background ,mawce-bg))))
     `(region ((,class (:background ,mawce-bg :underline t :foreground ,mawce-region-fg :extend nil))
               ;; (t :inverse-video t)
               ))
     `(internal-border ((t (:background ,mawce-internal-border))))
     ;; `(fringe ((t (:background ,mawce-fringe))))
     `(cursor ((t (:background ,mawce-cursor-bg))))
     ;; '(button ((t (:underline t))))
     ;; `(link ((t (:foreground ,mawce-blue :underline t :weight bold))))
     ;; `(link-visited ((t (:foreground ,mawce-blue-1 :underline t :weight normal))))
     ;; `(widget-field ((t (:foreground ,mawce-fg :background ,mawce-bg+3))))
     ;; `(escape-glyph ((t (:foreground ,mawce-blue :weight bold))))
     ;; `(fringe ((t ( :background ,mawce-fringe-bg ;; :foreground ,mawce-fringe-fg
     ;;                            ))))
     `(fringe ((t ( :inherit mawce-bg ;; :foreground ,mawce-fringe-fg
                    ))))
     ;; `(header-line ((t (:foreground ,mawce-blue
     ;;                                :background ,mawce-bg-1
     ;;                                :box (:line-width -1 :style released-button)
     ;;                                :extend t))))
     `(highlight ((t ( :foreground ,mawce-highlight ;; :underline  ,mawce-highlight
                       ))))
     `(italic ((t (:slant italic))))
     `(success ((t (:foreground ,mawce-success :weight bold))))
     `(warning ((t (:foreground ,mawce-warning :weight bold))))
     ;; `(tooltip ((t (:foreground ,mawce-fg :background ,mawce-bg+1))))
     ;; ;;;;; ansi-colors
     ;;    `(ansi-color-black ((t (:foreground ,zenburn-bg
     ;;                                        :background ,zenburn-bg-1))))
     ;;    `(ansi-color-red ((t (:foreground ,zenburn-red-2
     ;;                                      :background ,zenburn-red-4))))
     ;;    `(ansi-color-green ((t (:foreground ,zenburn-green
     ;;                                        :background ,zenburn-green+2))))
     ;;    `(ansi-color-yellow ((t (:foreground ,zenburn-orange
     ;;                                         :background ,zenburn-yellow))))
     ;;    `(ansi-color-blue ((t (:foreground ,zenburn-blue-1
     ;;                                       :background ,zenburn-blue-4))))
     ;;    `(ansi-color-magenta ((t (:foreground ,zenburn-magenta
     ;;                                          :background ,zenburn-red))))
     ;;    `(ansi-color-cyan ((t (:foreground ,zenburn-cyan
     ;;                                       :background ,zenburn-blue))))
     ;;    `(ansi-color-white ((t (:foreground ,zenburn-fg
     ;;                                        :background ,zenburn-fg-1))))
   ;;;;; comint
     `(comint-highlight-input ((t (:foreground ,mawce-comint-highlight-input-fg :weight normal :slant italic))))
     ;; ;;;;; compilation
     ;;    `(compilation-column-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(compilation-enter-directory-face ((t (:foreground ,zenburn-green))))
     ;;    `(compilation-error-face ((t (:foreground ,zenburn-red-1 :weight bold :underline t))))
     ;;    `(compilation-face ((t (:foreground ,zenburn-fg))))
     ;;    `(compilation-info-face ((t (:foreground ,zenburn-blue))))
     `(compilation-error ((t (:foreground ,mawce-compilation-error-fg))))
     `(compilation-warning ((t (:foreground ,mawce-compilation-warning-fg))))
     `(compilation-info ((t (:foreground ,mawce-compilation-info-fg))))
     ;;    `(compilation-leave-directory-face ((t (:foreground ,zenburn-green))))
     ;;    `(compilation-line-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(compilation-line-number ((t (:foreground ,zenburn-yellow))))
     ;;    `(compilation-message-face ((t (:foreground ,zenburn-blue))))
     ;;    `(compilation-warning-face ((t (:foreground ,zenburn-orange :weight bold :underline t))))
     ;;    `(compilation-mode-line-exit ((t (:foreground ,zenburn-green+2 :weight bold))))
     ;;    `(compilation-mode-line-fail ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(compilation-mode-line-run ((t (:foreground ,zenburn-yellow :weight bold))))
     ;; ;;;;; completions
     ;;    `(completions-annotations ((t (:foreground ,zenburn-fg-1))))
     ;;    `(completions-common-part ((t (:foreground ,zenburn-blue))))
     ;;    `(completions-first-difference ((t (:foreground ,zenburn-fg+1))))
     ;; ;;;;; customize
     ;;    `(custom-variable-tag ((t (:foreground ,zenburn-blue :weight bold))))
     ;;    `(custom-group-tag ((t (:foreground ,zenburn-blue :weight bold :height 1.2))))
     ;;    `(custom-state ((t (:foreground ,zenburn-green+4))))
     ;; ;;;;; display-fill-column-indicator
     ;;    `(fill-column-indicator ((,class :foreground ,zenburn-bg-05 :weight semilight)))
     ;; ;;;;; eww
     ;;    '(eww-invalid-certificate ((t (:inherit error))))
     ;;    '(eww-valid-certificate   ((t (:inherit success))))
     ;; ;;;;; grep
     ;;    `(grep-context-face ((t (:foreground ,zenburn-fg))))
     ;;    `(grep-error-face ((t (:foreground ,zenburn-red-1 :weight bold :underline t))))
     ;;    `(grep-hit-face ((t (:foreground ,zenburn-blue))))
     ;;    `(grep-match-face ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(match ((t (:background ,zenburn-bg-1 :foreground ,zenburn-orange :weight bold))))
     ;; ;;;;; hi-lock
     ;;    `(hi-blue    ((t (:background ,zenburn-cyan    :foreground ,zenburn-bg-1))))
     ;;    `(hi-green   ((t (:background ,zenburn-green+4 :foreground ,zenburn-bg-1))))
     ;;    `(hi-pink    ((t (:background ,zenburn-magenta :foreground ,zenburn-bg-1))))
     ;;    `(hi-yellow  ((t (:background ,zenburn-yellow  :foreground ,zenburn-bg-1))))
     ;;    `(hi-blue-b  ((t (:foreground ,zenburn-blue    :weight     bold))))
     ;;    `(hi-green-b ((t (:foreground ,zenburn-green+2 :weight     bold))))
     ;;    `(hi-red-b   ((t (:foreground ,zenburn-red     :weight     bold))))
     ;; ;;;;; info
     ;;    `(Info-quoted ((t (:inherit font-lock-constant-face))))
     ;; ;;;;; isearch
     ;;    `(isearch ((t (:foreground ,zenburn-yellow-2 :weight bold :background ,zenburn-bg+2))))
     ;;    `(isearch-fail ((t (:foreground ,zenburn-fg :background ,zenburn-red-4))))
     ;;    `(lazy-highlight ((t (:foreground ,zenburn-yellow-2 :weight bold :background ,zenburn-bg-05))))
     ;;    `(menu ((t (:foreground ,zenburn-fg :background ,zenburn-bg))))
     `(minibuffer-prompt ((t (:foreground ,mawce-minibuffer-prompt-fg))))
     `(mode-line
       ((,class (:foreground ,mawce-mode-line-fg
                             :background ,mawce-bg ;; ,mawce-mode-line-bg
                             :box nil ;; (:line-width -1 :style released-button)
                             :overline ,mawce-mode-line-overline
                             ))
        (t :inverse-video t)))
     `(mode-line-buffer-id ((t (:foreground ,mawce-mode-line-buffer-id-fg))))
     `(mode-line-buffer-id-deemph ((t (:foreground ,mawce-mode-line-buffer-id-fg))))
     `(mode-line-inactive ((t (:foreground ,mawce-mode-line-buffer-id-fg
                                           :background ,mawce-bg
                                           :box nil;; (:line-width -1 :style released-button)
                                           :overline ,mawce-mode-line-inactive-overline
                                           ))))
     `(secondary-selection ((t (:background ,mawce-secondary-selection-bg))))
     ;;    `(trailing-whitespace ((t (:background ,zenburn-red))))
     ;;    `(vertical-border ((t (:foreground ,zenburn-fg))))
        ;;;;; Font lock
     `(font-lock-builtin-face ((t (:foreground ,mawce-fl-builtin :weight bold))))
     `(font-lock-comment-face ((t (:foreground ,mawce-fl-comment))))
     `(font-lock-comment-delimiter-face ((t (:foreground ,mawce-fl-comment-delimiter))))
     `(font-lock-constant-face ((t (:foreground ,mawce-fl-constant))))
     `(font-lock-doc-face ((t (:foreground ,mawce-fl-doc))))
     `(font-lock-function-name-face ((t (:foreground ,mawce-fl-function-name))))
     `(font-lock-keyword-face ((t (:foreground ,mawce-fl-keyword :weight bold))))
     ;;    `(font-lock-negation-char-face ((t (:foreground ,mawce-fl-yellow :weight bold))))
     ;;    `(font-lock-preprocessor-face ((t (:foreground ,mawce-fl-blue+1))))
     `(font-lock-regexp-grouping-construct ((t (:foreground ,mawce-fl-re-grouping-construct :weight bold))))
     `(font-lock-regexp-grouping-backslash ((t (:foreground ,mawce-fl-re-grouping-backslash :weight bold))))
     `(font-lock-string-face ((t (:foreground ,mawce-fl-string))))
     `(font-lock-type-face ((t (:foreground ,mawce-fl-type))))
     `(font-lock-variable-name-face ((t (:foreground ,mawce-fl-variable-name :slant italic))))
     `(font-lock-variable-use-face ((t (:foreground ,mawce-fl-variable-name))))
     `(font-lock-warning-face ((t (:foreground ,mawce-fl-warning :weight bold))))
     ;;    `(c-annotation-face ((t (:inherit font-lock-constant-face))))
     ;; ;;;;; line numbers (Emacs 26.1 and above)
     ;;    `(line-number ((t (:inherit default :foreground ,zenburn-bg+3 :background ,zenburn-bg-05))))
     ;;    `(line-number-current-line ((t (:inherit line-number :foreground ,zenburn-yellow-2))))
     ;; ;;;;; man
     ;;    '(Man-overstrike ((t (:inherit font-lock-keyword-face))))
     ;;    '(Man-underline  ((t (:inherit (font-lock-string-face underline)))))
     ;; ;;;;; newsticker
     ;;    `(newsticker-date-face ((t (:foreground ,zenburn-fg))))
     ;;    `(newsticker-default-face ((t (:foreground ,zenburn-fg))))
     ;;    `(newsticker-enclosure-face ((t (:foreground ,zenburn-green+3))))
     ;;    `(newsticker-extra-face ((t (:foreground ,zenburn-bg+2 :height 0.8))))
     ;;    `(newsticker-feed-face ((t (:foreground ,zenburn-fg))))
     ;;    `(newsticker-immortal-item-face ((t (:foreground ,zenburn-green))))
     ;;    `(newsticker-new-item-face ((t (:foreground ,zenburn-blue))))
     ;;    `(newsticker-obsolete-item-face ((t (:foreground ,zenburn-red))))
     ;;    `(newsticker-old-item-face ((t (:foreground ,zenburn-bg+3))))
     ;;    `(newsticker-statistics-face ((t (:foreground ,zenburn-fg))))
     ;;    `(newsticker-treeview-face ((t (:foreground ,zenburn-fg))))
     ;;    `(newsticker-treeview-immortal-face ((t (:foreground ,zenburn-green))))
     ;;    `(newsticker-treeview-listwindow-face ((t (:foreground ,zenburn-fg))))
     ;;    `(newsticker-treeview-new-face ((t (:foreground ,zenburn-blue :weight bold))))
     ;;    `(newsticker-treeview-obsolete-face ((t (:foreground ,zenburn-red))))
     ;;    `(newsticker-treeview-old-face ((t (:foreground ,zenburn-bg+3))))
     ;;    `(newsticker-treeview-selection-face ((t (:background ,zenburn-bg-1 :foreground ,zenburn-yellow))))
     ;; ;;;;; woman
     ;;    '(woman-bold   ((t (:inherit font-lock-keyword-face))))
     ;;    '(woman-italic ((t (:inherit (font-lock-string-face italic)))))
     ;; ;;;; Third-party packages
     ;; ;;;;; ace-jump
     ;;    `(ace-jump-face-background
     ;;      ((t (:foreground ,zenburn-fg-1 :background ,zenburn-bg :inverse-video nil))))
     ;;    `(ace-jump-face-foreground
     ;;      ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg :inverse-video nil))))
     ;; ;;;;; ace-window
     ;;    `(aw-background-face
     ;;      ((t (:foreground ,zenburn-fg-1 :background ,zenburn-bg :inverse-video nil))))
     ;;    `(aw-leading-char-face ((t (:inherit aw-mode-line-face))))
     ;; ;;;;; adoc-mode
     ;;    `(adoc-anchor-face ((t (:foreground ,zenburn-blue+1))))
     ;;    `(adoc-code-face ((t (:inherit font-lock-constant-face))))
     ;;    `(adoc-command-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(adoc-emphasis-face ((t (:inherit bold))))
     ;;    `(adoc-internal-reference-face ((t (:foreground ,zenburn-yellow-2 :underline t))))
     ;;    `(adoc-list-face ((t (:foreground ,zenburn-fg+1))))
     ;;    `(adoc-meta-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(adoc-meta-hide-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(adoc-secondary-text-face ((t (:foreground ,zenburn-yellow-1))))
     ;;    `(adoc-title-0-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(adoc-title-1-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(adoc-title-2-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(adoc-title-3-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(adoc-title-4-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(adoc-typewriter-face ((t (:inherit font-lock-constant-face))))
     ;;    `(adoc-verbatim-face ((t (:inherit font-lock-constant-face))))
     ;;    `(adoc-value-face ((t (:foreground ,zenburn-yellow))))
     ;; ;;;;; android mode
     ;;    `(android-mode-debug-face ((t (:foreground ,zenburn-green+1))))
     ;;    `(android-mode-error-face ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(android-mode-info-face ((t (:foreground ,zenburn-fg))))
     ;;    `(android-mode-verbose-face ((t (:foreground ,zenburn-green))))
     ;;    `(android-mode-warning-face ((t (:foreground ,zenburn-yellow))))
     ;; ;;;;; anzu
     ;;    `(anzu-mode-line ((t (:foreground ,zenburn-cyan :weight bold))))
     ;;    `(anzu-mode-line-no-match ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(anzu-match-1 ((t (:foreground ,zenburn-bg :background ,zenburn-green))))
     ;;    `(anzu-match-2 ((t (:foreground ,zenburn-bg :background ,zenburn-orange))))
     ;;    `(anzu-match-3 ((t (:foreground ,zenburn-bg :background ,zenburn-blue))))
     ;;    `(anzu-replace-to ((t (:inherit anzu-replace-highlight :foreground ,zenburn-yellow))))
     ;; ;;;;; auctex
     ;;    `(font-latex-bold-face ((t (:inherit bold))))
     ;;    `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
     ;;    `(font-latex-sectioning-5-face ((t (:foreground ,zenburn-red :weight bold ))))
     ;;    `(font-latex-sedate-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(font-latex-italic-face ((t (:foreground ,zenburn-cyan :slant italic))))
     ;;    `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
     ;;    `(font-latex-math-face ((t (:foreground ,zenburn-orange))))
     ;;    `(font-latex-script-char-face ((t (:foreground ,zenburn-orange))))
     ;; ;;;;; agda-mode
     ;;    `(agda2-highlight-keyword-face ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(agda2-highlight-string-face ((t (:foreground ,zenburn-red))))
     ;;    `(agda2-highlight-symbol-face ((t (:foreground ,zenburn-orange))))
     ;;    `(agda2-highlight-primitive-type-face ((t (:foreground ,zenburn-blue-1))))
     ;;    `(agda2-highlight-inductive-constructor-face ((t (:foreground ,zenburn-fg))))
     ;;    `(agda2-highlight-coinductive-constructor-face ((t (:foreground ,zenburn-fg))))
     ;;    `(agda2-highlight-datatype-face ((t (:foreground ,zenburn-blue))))
     ;;    `(agda2-highlight-function-face ((t (:foreground ,zenburn-blue))))
     ;;    `(agda2-highlight-module-face ((t (:foreground ,zenburn-blue-1))))
     ;;    `(agda2-highlight-error-face ((t (:foreground ,zenburn-bg :background ,zenburn-magenta))))
     ;;    `(agda2-highlight-unsolved-meta-face ((t (:foreground ,zenburn-bg :background ,zenburn-magenta))))
     ;;    `(agda2-highlight-unsolved-constraint-face ((t (:foreground ,zenburn-bg :background ,zenburn-magenta))))
     ;;    `(agda2-highlight-termination-problem-face ((t (:foreground ,zenburn-bg :background ,zenburn-magenta))))
     ;;    `(agda2-highlight-incomplete-pattern-face ((t (:foreground ,zenburn-bg :background ,zenburn-magenta))))
     ;;    `(agda2-highlight-typechecks-face ((t (:background ,zenburn-red-4))))
     ;; ;;;;; auto-complete
     ;;    `(ac-candidate-face ((t (:background ,zenburn-bg+3 :foreground ,zenburn-bg-2))))
     ;;    `(ac-selection-face ((t (:background ,zenburn-blue-4 :foreground ,zenburn-fg))))
     ;;    `(popup-tip-face ((t (:background ,zenburn-yellow-2 :foreground ,zenburn-bg-2))))
     ;;    `(popup-menu-mouse-face ((t (:background ,zenburn-yellow-2 :foreground ,zenburn-bg-2))))
     ;;    `(popup-summary-face ((t (:background ,zenburn-bg+3 :foreground ,zenburn-bg-2))))
     ;;    `(popup-scroll-bar-foreground-face ((t (:background ,zenburn-blue-5))))
     ;;    `(popup-scroll-bar-background-face ((t (:background ,zenburn-bg-1))))
     ;;    `(popup-isearch-match ((t (:background ,zenburn-bg :foreground ,zenburn-fg))))
     ;; ;;;;; avy
     ;;    `(avy-background-face
     ;;      ((t (:foreground ,zenburn-fg-1 :background ,zenburn-bg :inverse-video nil))))
     ;;    `(avy-lead-face-0
     ;;      ((t (:foreground ,zenburn-green+3 :background ,zenburn-bg :inverse-video nil :weight bold))))
     ;;    `(avy-lead-face-1
     ;;      ((t (:foreground ,zenburn-yellow :background ,zenburn-bg :inverse-video nil :weight bold))))
     ;;    `(avy-lead-face-2
     ;;      ((t (:foreground ,zenburn-red+1 :background ,zenburn-bg :inverse-video nil :weight bold))))
     ;;    `(avy-lead-face
     ;;      ((t (:foreground ,zenburn-cyan :background ,zenburn-bg :inverse-video nil :weight bold))))
     ;; ;;;;; company-mode
     ;;    `(company-tooltip ((t (:foreground ,zenburn-fg :background ,zenburn-bg+1))))
     ;;    `(company-tooltip-annotation ((t (:foreground ,zenburn-orange :background ,zenburn-bg+1))))
     ;;    `(company-tooltip-annotation-selection ((t (:foreground ,zenburn-orange :background ,zenburn-bg-1))))
     ;;    `(company-tooltip-selection ((t (:foreground ,zenburn-fg :background ,zenburn-bg-1))))
     ;;    `(company-tooltip-mouse ((t (:background ,zenburn-bg-1))))
     ;;    `(company-tooltip-common ((t (:foreground ,zenburn-green+2))))
     ;;    `(company-tooltip-common-selection ((t (:foreground ,zenburn-green+2))))
     ;;    `(company-scrollbar-fg ((t (:background ,zenburn-bg-1))))
     ;;    `(company-scrollbar-bg ((t (:background ,zenburn-bg+2))))
     ;;    `(company-preview ((t (:background ,zenburn-green+2))))
     ;;    `(company-preview-common ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg-1))))
     ;; ;;;;; bm
     ;;    `(bm-face ((t (:background ,zenburn-yellow-1 :foreground ,zenburn-bg))))
     ;;    `(bm-fringe-face ((t (:background ,zenburn-yellow-1 :foreground ,zenburn-bg))))
     ;;    `(bm-fringe-persistent-face ((t (:background ,zenburn-green-2 :foreground ,zenburn-bg))))
     ;;    `(bm-persistent-face ((t (:background ,zenburn-green-2 :foreground ,zenburn-bg))))
     ;; ;;;;; calfw
     ;;    `(cfw:face-annotation ((t (:foreground ,zenburn-red :inherit cfw:face-day-title))))
     ;;    `(cfw:face-day-title ((t nil)))
     ;;    `(cfw:face-default-content ((t (:foreground ,zenburn-green))))
     ;;    `(cfw:face-default-day ((t (:weight bold))))
     ;;    `(cfw:face-disable ((t (:foreground ,zenburn-fg-1))))
     ;;    `(cfw:face-grid ((t (:inherit shadow))))
     ;;    `(cfw:face-header ((t (:inherit font-lock-keyword-face))))
     ;;    `(cfw:face-holiday ((t (:inherit cfw:face-sunday))))
     ;;    `(cfw:face-periods ((t (:foreground ,zenburn-cyan))))
     ;;    `(cfw:face-saturday ((t (:foreground ,zenburn-blue :weight bold))))
     ;;    `(cfw:face-select ((t (:background ,zenburn-blue-5))))
     ;;    `(cfw:face-sunday ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(cfw:face-title ((t (:height 2.0 :inherit (variable-pitch font-lock-keyword-face)))))
     ;;    `(cfw:face-today ((t (:foreground ,zenburn-cyan :weight bold))))
     ;;    `(cfw:face-today-title ((t (:inherit highlight bold))))
     ;;    `(cfw:face-toolbar ((t (:background ,zenburn-blue-5))))
     ;;    `(cfw:face-toolbar-button-off ((t (:underline nil :inherit link))))
     ;;    `(cfw:face-toolbar-button-on ((t (:underline nil :inherit link-visited))))
     ;; ;;;;; centaur-tabs
     ;;    `(centaur-tabs-default ((t (:background ,zenburn-bg :foreground ,zenburn-fg :box nil))))
     ;;    `(centaur-tabs-selected ((t (:background ,zenburn-bg :foreground ,zenburn-fg+2 :box nil))))
     ;;    `(centaur-tabs-unselected ((t (:background ,zenburn-bg-1 :foreground ,zenburn-fg-05 :box nil))))
     ;;    `(centaur-tabs-selected-modified ((t (:background ,zenburn-bg :foreground ,zenburn-orange :box nil))))
     ;;    `(centaur-tabs-unselected-modified ((t (:background ,zenburn-bg-1 :foreground ,zenburn-orange :box nil))))
     ;;    `(centaur-tabs-active-bar-face ((t (:background ,zenburn-yellow :box nil))))
     ;;    `(centaur-tabs-modified-marker-selected ((t (:inherit 'centaur-tabs-selected-modified :foreground ,zenburn-yellow :box nil))))
     ;;    `(centaur-tabs-modified-marker-unselected ((t (:inherit 'centaur-tabs-unselected-modified :foreground ,zenburn-yellow :box nil))))
     ;; ;;;;; cider
     ;;    `(cider-result-overlay-face ((t (:background unspecified))))
     ;;    `(cider-enlightened-face ((t (:box (:color ,zenburn-orange :line-width -1)))))
     ;;    `(cider-enlightened-local-face ((t (:weight bold :foreground ,zenburn-green+1))))
     ;;    `(cider-deprecated-face ((t (:background ,zenburn-yellow-2))))
     ;;    `(cider-instrumented-face ((t (:box (:color ,zenburn-red :line-width -1)))))
     ;;    `(cider-traced-face ((t (:box (:color ,zenburn-cyan :line-width -1)))))
     ;;    `(cider-test-failure-face ((t (:background ,zenburn-red-4))))
     ;;    `(cider-test-error-face ((t (:background ,zenburn-magenta))))
     ;;    `(cider-test-success-face ((t (:background ,zenburn-green-2))))
     ;;    `(cider-fringe-good-face ((t (:foreground ,zenburn-green+4))))
     ;; ;;;;; circe
     ;;    `(circe-highlight-nick-face ((t (:foreground ,zenburn-cyan))))
     ;;    `(circe-my-message-face ((t (:foreground ,zenburn-fg))))
     ;;    `(circe-fool-face ((t (:foreground ,zenburn-red+1))))
     ;;    `(circe-topic-diff-removed-face ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(circe-originator-face ((t (:foreground ,zenburn-fg))))
     ;;    `(circe-server-face ((t (:foreground ,zenburn-green))))
     ;;    `(circe-topic-diff-new-face ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(circe-prompt-face ((t (:foreground ,zenburn-orange :background ,zenburn-bg :weight bold))))
     ;; ;;;;; context-coloring
     ;;    `(context-coloring-level-0-face ((t :foreground ,zenburn-fg)))
     ;;    `(context-coloring-level-1-face ((t :foreground ,zenburn-cyan)))
     ;;    `(context-coloring-level-2-face ((t :foreground ,zenburn-green+4)))
     ;;    `(context-coloring-level-3-face ((t :foreground ,zenburn-yellow)))
     ;;    `(context-coloring-level-4-face ((t :foreground ,zenburn-orange)))
     ;;    `(context-coloring-level-5-face ((t :foreground ,zenburn-magenta)))
     ;;    `(context-coloring-level-6-face ((t :foreground ,zenburn-blue+1)))
     ;;    `(context-coloring-level-7-face ((t :foreground ,zenburn-green+2)))
     ;;    `(context-coloring-level-8-face ((t :foreground ,zenburn-yellow-2)))
     ;;    `(context-coloring-level-9-face ((t :foreground ,zenburn-red+1)))
     ;; ;;;;; coq
     ;;    `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
     ;; ;;;;; ctable
     ;;    `(ctbl:face-cell-select ((t (:background ,zenburn-blue :foreground ,zenburn-bg))))
     ;;    `(ctbl:face-continue-bar ((t (:background ,zenburn-bg-05 :foreground ,zenburn-bg))))
     ;;    `(ctbl:face-row-select ((t (:background ,zenburn-cyan :foreground ,zenburn-bg))))
     ;; ;;;;; debbugs
     ;;    `(debbugs-gnu-done ((t (:foreground ,zenburn-fg-1))))
     ;;    `(debbugs-gnu-handled ((t (:foreground ,zenburn-green))))
     ;;    `(debbugs-gnu-new ((t (:foreground ,zenburn-red))))
     ;;    `(debbugs-gnu-pending ((t (:foreground ,zenburn-blue))))
     ;;    `(debbugs-gnu-stale ((t (:foreground ,zenburn-orange))))
     ;;    `(debbugs-gnu-tagged ((t (:foreground ,zenburn-red))))
     ;; ;;;;; diff
     ;;    ;; Please read (info "(magit)Theming Faces") before changing this.
     ;;    `(diff-added          ((t (:background "#335533" :foreground ,zenburn-green))))
     ;;    `(diff-changed        ((t (:background "#555511" :foreground ,zenburn-yellow-1))))
     ;;    `(diff-removed        ((t (:background "#553333" :foreground ,zenburn-red-2))))
     ;;    `(diff-refine-added   ((t (:background "#338833" :foreground ,zenburn-green+4))))
     ;;    `(diff-refine-changed ((t (:background "#888811" :foreground ,zenburn-yellow))))
     ;;    `(diff-refine-removed ((t (:background "#883333" :foreground ,zenburn-red))))
     ;;    `(diff-header ((,class (:background ,zenburn-bg+2))
     ;;                   (t (:background ,zenburn-fg :foreground ,zenburn-bg))))
     ;;    `(diff-file-header
     ;;      ((,class (:background ,zenburn-bg+2 :foreground ,zenburn-fg :weight bold))
     ;;       (t (:background ,zenburn-fg :foreground ,zenburn-bg :weight bold))))
     ;; ;;;;; diff-hl
     ;;    `(diff-hl-change ((,class (:foreground ,zenburn-blue :background ,zenburn-blue-2))))
     ;;    `(diff-hl-delete ((,class (:foreground ,zenburn-red+1 :background ,zenburn-red-1))))
     ;;    `(diff-hl-insert ((,class (:foreground ,zenburn-green+1 :background ,zenburn-green-2))))
     ;; ;;;;; dim-autoload
     ;;    `(dim-autoload-cookie-line ((t :foreground ,zenburn-bg+1)))
     ;; ;;;;; dired+
     ;;    `(diredp-display-msg ((t (:foreground ,zenburn-blue))))
     ;;    `(diredp-compressed-file-suffix ((t (:foreground ,zenburn-orange))))
     ;;    `(diredp-date-time ((t (:foreground ,zenburn-magenta))))
     ;;    `(diredp-deletion ((t (:foreground ,zenburn-yellow))))
     ;;    `(diredp-deletion-file-name ((t (:foreground ,zenburn-red))))
     ;;    `(diredp-dir-heading ((t (:foreground ,zenburn-blue :background ,zenburn-bg-1))))
     ;;    `(diredp-dir-priv ((t (:foreground ,zenburn-cyan))))
     ;;    `(diredp-exec-priv ((t (:foreground ,zenburn-red))))
     ;;    `(diredp-executable-tag ((t (:foreground ,zenburn-green+1))))
     ;;    `(diredp-file-name ((t (:foreground ,zenburn-blue))))
     ;;    `(diredp-file-suffix ((t (:foreground ,zenburn-green))))
     ;;    `(diredp-flag-mark ((t (:foreground ,zenburn-yellow))))
     ;;    `(diredp-flag-mark-line ((t (:foreground ,zenburn-orange))))
     ;;    `(diredp-ignored-file-name ((t (:foreground ,zenburn-red))))
     ;;    `(diredp-link-priv ((t (:foreground ,zenburn-yellow))))
     ;;    `(diredp-mode-line-flagged ((t (:foreground ,zenburn-yellow))))
     ;;    `(diredp-mode-line-marked ((t (:foreground ,zenburn-orange))))
     ;;    `(diredp-no-priv ((t (:foreground ,zenburn-fg))))
     ;;    `(diredp-number ((t (:foreground ,zenburn-green+1))))
     ;;    `(diredp-other-priv ((t (:foreground ,zenburn-yellow-1))))
     ;;    `(diredp-rare-priv ((t (:foreground ,zenburn-red-1))))
     ;;    `(diredp-read-priv ((t (:foreground ,zenburn-green-2))))
     ;;    `(diredp-symlink ((t (:foreground ,zenburn-yellow))))
     ;;    `(diredp-write-priv ((t (:foreground ,zenburn-magenta))))
     ;; ;;;;; dired-async
     ;;    `(dired-async-failures ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(dired-async-message ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(dired-async-mode-message ((t (:foreground ,zenburn-yellow))))
     ;; ;;;;; diredfl
     ;;    `(diredfl-compressed-file-suffix ((t (:foreground ,zenburn-orange))))
     ;;    `(diredfl-date-time ((t (:foreground ,zenburn-magenta))))
     ;;    `(diredfl-deletion ((t (:foreground ,zenburn-yellow))))
     ;;    `(diredfl-deletion-file-name ((t (:foreground ,zenburn-red))))
     ;;    `(diredfl-dir-heading ((t (:foreground ,zenburn-blue :background ,zenburn-bg-1))))
     ;;    `(diredfl-dir-priv ((t (:foreground ,zenburn-cyan))))
     ;;    `(diredfl-exec-priv ((t (:foreground ,zenburn-red))))
     ;;    `(diredfl-executable-tag ((t (:foreground ,zenburn-green+1))))
     ;;    `(diredfl-file-name ((t (:foreground ,zenburn-blue))))
     ;;    `(diredfl-file-suffix ((t (:foreground ,zenburn-green))))
     ;;    `(diredfl-flag-mark ((t (:foreground ,zenburn-yellow))))
     ;;    `(diredfl-flag-mark-line ((t (:foreground ,zenburn-orange))))
     ;;    `(diredfl-ignored-file-name ((t (:foreground ,zenburn-red))))
     ;;    `(diredfl-link-priv ((t (:foreground ,zenburn-yellow))))
     ;;    `(diredfl-no-priv ((t (:foreground ,zenburn-fg))))
     ;;    `(diredfl-number ((t (:foreground ,zenburn-green+1))))
     ;;    `(diredfl-other-priv ((t (:foreground ,zenburn-yellow-1))))
     ;;    `(diredfl-rare-priv ((t (:foreground ,zenburn-red-1))))
     ;;    `(diredfl-read-priv ((t (:foreground ,zenburn-green-1))))
     ;;    `(diredfl-symlink ((t (:foreground ,zenburn-yellow))))
     ;;    `(diredfl-write-priv ((t (:foreground ,zenburn-magenta))))
     ;; ;;;;; doom-modeline
     ;;    `(doom-modeline-bar  ((t (:background ,zenburn-yellow))))
     ;;    `(doom-modeline-inactive-bar  ((t (:background nil))))
     ;; ;;;;; ediff
     ;;    `(ediff-current-diff-A ((t (:foreground ,zenburn-fg :background ,zenburn-red-4))))
     ;;    `(ediff-current-diff-Ancestor ((t (:foreground ,zenburn-fg :background ,zenburn-red-4))))
     ;;    `(ediff-current-diff-B ((t (:foreground ,zenburn-fg :background ,zenburn-green-2))))
     ;;    `(ediff-current-diff-C ((t (:foreground ,zenburn-fg :background ,zenburn-blue-5))))
     ;;    `(ediff-even-diff-A ((t (:background ,zenburn-bg+1))))
     ;;    `(ediff-even-diff-Ancestor ((t (:background ,zenburn-bg+1))))
     ;;    `(ediff-even-diff-B ((t (:background ,zenburn-bg+1))))
     ;;    `(ediff-even-diff-C ((t (:background ,zenburn-bg+1))))
     ;;    `(ediff-fine-diff-A ((t (:foreground ,zenburn-fg :background ,zenburn-red-2 :weight bold))))
     ;;    `(ediff-fine-diff-Ancestor ((t (:foreground ,zenburn-fg :background ,zenburn-red-2 weight bold))))
     ;;    `(ediff-fine-diff-B ((t (:foreground ,zenburn-fg :background ,zenburn-green :weight bold))))
     ;;    `(ediff-fine-diff-C ((t (:foreground ,zenburn-fg :background ,zenburn-blue-3 :weight bold ))))
     ;;    `(ediff-odd-diff-A ((t (:background ,zenburn-bg+2))))
     ;;    `(ediff-odd-diff-Ancestor ((t (:background ,zenburn-bg+2))))
     ;;    `(ediff-odd-diff-B ((t (:background ,zenburn-bg+2))))
     ;;    `(ediff-odd-diff-C ((t (:background ,zenburn-bg+2))))
     ;; ;;;;; egg
     ;;    `(egg-text-base ((t (:foreground ,zenburn-fg))))
     ;;    `(egg-help-header-1 ((t (:foreground ,zenburn-yellow))))
     ;;    `(egg-help-header-2 ((t (:foreground ,zenburn-green+3))))
     ;;    `(egg-branch ((t (:foreground ,zenburn-yellow))))
     ;;    `(egg-branch-mono ((t (:foreground ,zenburn-yellow))))
     ;;    `(egg-term ((t (:foreground ,zenburn-yellow))))
     ;;    `(egg-diff-add ((t (:foreground ,zenburn-green+4))))
     ;;    `(egg-diff-del ((t (:foreground ,zenburn-red+1))))
     ;;    `(egg-diff-file-header ((t (:foreground ,zenburn-yellow-2))))
     ;;    `(egg-section-title ((t (:foreground ,zenburn-yellow))))
     ;;    `(egg-stash-mono ((t (:foreground ,zenburn-green+4))))
     ;; ;;;;; elfeed
     ;;    `(elfeed-log-error-level-face ((t (:foreground ,zenburn-red))))
     ;;    `(elfeed-log-info-level-face ((t (:foreground ,zenburn-blue))))
     ;;    `(elfeed-log-warn-level-face ((t (:foreground ,zenburn-yellow))))
     `(elfeed-search-date-face ((t (:foreground ,mawce-elfeed-search-date-face-fg ;; :underline t weight bold
                                                ))))
     `(elfeed-search-tag-face ((t (:foreground ,mawce-elfeed-search-tag-face-fg))))
     `(elfeed-search-feed-face ((t (:foreground ,mawce-elfeed-search-feed-face-fg))))
     `(elfeed-search-title-face ((t (:foreground ,mawce-elfeed-search-title-face-fg :slant italic))))
     `(elfeed-search-unread-title-face ((t (:inherit elfeed-search-title-face :slant normal :weight bold
                                                     ))))
     ;; ;;;;; emacs-w3m
     ;;    `(w3m-anchor ((t (:foreground ,zenburn-yellow :underline t
     ;;                                  :weight bold))))
     ;;    `(w3m-arrived-anchor ((t (:foreground ,zenburn-yellow-2
     ;;                                          :underline t :weight normal))))
     ;;    `(w3m-form ((t (:foreground ,zenburn-red-1 :underline t))))
     ;;    `(w3m-header-line-location-title ((t (:foreground ,zenburn-yellow
     ;;                                                      :underline t :weight bold))))
     ;;    '(w3m-history-current-url ((t (:inherit match))))
     ;;    `(w3m-lnum ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))
     ;;    `(w3m-lnum-match ((t (:background ,zenburn-bg-1
     ;;                                      :foreground ,zenburn-orange
     ;;                                      :weight bold))))
     ;;    `(w3m-lnum-minibuffer-prompt ((t (:foreground ,zenburn-yellow))))
     ;; ;;;;; erc
     ;;    `(erc-action-face ((t (:inherit erc-default-face))))
     ;;    `(erc-bold-face ((t (:weight bold))))
     ;;    `(erc-current-nick-face ((t (:foreground ,zenburn-blue :weight bold))))
     ;;    `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
     ;;    `(erc-default-face ((t (:foreground ,zenburn-fg))))
     ;;    `(erc-direct-msg-face ((t (:inherit erc-default-face))))
     ;;    `(erc-error-face ((t (:inherit font-lock-warning-face))))
     ;;    `(erc-fool-face ((t (:inherit erc-default-face))))
     ;;    `(erc-highlight-face ((t (:inherit hover-highlight))))
     ;;    `(erc-input-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(erc-keyword-face ((t (:foreground ,zenburn-blue :weight bold))))
     ;;    `(erc-nick-default-face ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(erc-my-nick-face ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(erc-nick-msg-face ((t (:inherit erc-default-face))))
     ;;    `(erc-notice-face ((t (:foreground ,zenburn-green))))
     ;;    `(erc-pal-face ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(erc-prompt-face ((t (:foreground ,zenburn-orange :background ,zenburn-bg :weight bold))))
     ;;    `(erc-timestamp-face ((t (:foreground ,zenburn-green+4))))
     ;;    `(erc-underline-face ((t (:underline t))))
     ;; ;;;;; eros
     ;;    `(eros-result-overlay-face ((t (:background unspecified))))
     ;; ;;;;; ert
     ;;    `(ert-test-result-expected ((t (:foreground ,zenburn-green+4 :background ,zenburn-bg))))
     ;;    `(ert-test-result-unexpected ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
     ;; ;;;;; eshell
     ;;    `(eshell-prompt ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(eshell-ls-archive ((t (:foreground ,zenburn-red-1 :weight bold))))
     ;;    `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
     ;;    `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
     ;;    `(eshell-ls-directory ((t (:foreground ,zenburn-blue+1 :weight bold))))
     ;;    `(eshell-ls-executable ((t (:foreground ,zenburn-red+1 :weight bold))))
     ;;    `(eshell-ls-unreadable ((t (:foreground ,zenburn-fg))))
     ;;    `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
     ;;    `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
     ;;    `(eshell-ls-special ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(eshell-ls-symlink ((t (:foreground ,zenburn-cyan :weight bold))))
     ;; ;;;;; flx
     ;;    `(flx-highlight-face ((t (:foreground ,zenburn-green+2 :weight bold))))
     ;; ;;;;; flycheck
     ;;    `(flycheck-error
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-red-1) :inherit unspecified))
     ;;       (t (:foreground ,zenburn-red-1 :weight bold :underline t))))
     ;;    `(flycheck-warning
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-yellow) :inherit unspecified))
     ;;       (t (:foreground ,zenburn-yellow :weight bold :underline t))))
     ;;    `(flycheck-info
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-cyan) :inherit unspecified))
     ;;       (t (:foreground ,zenburn-cyan :weight bold :underline t))))
     ;;    `(flycheck-fringe-error ((t (:foreground ,zenburn-red-1 :weight bold))))
     ;;    `(flycheck-fringe-warning ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(flycheck-fringe-info ((t (:foreground ,zenburn-cyan :weight bold))))
     ;; ;;;;; flymake
     ;;    `(flymake-errline
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-red)
     ;;                    :inherit unspecified :foreground unspecified :background unspecified))
     ;;       (t (:foreground ,zenburn-red-1 :weight bold :underline t))))
     ;;    `(flymake-warnline
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-orange)
     ;;                    :inherit unspecified :foreground unspecified :background unspecified))
     ;;       (t (:foreground ,zenburn-orange :weight bold :underline t))))
     ;;    `(flymake-infoline
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-green)
     ;;                    :inherit unspecified :foreground unspecified :background unspecified))
     ;;       (t (:foreground ,zenburn-green-2 :weight bold :underline t))))
     ;;    `(flymake-error
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-red)
     ;;                    :inherit unspecified :foreground unspecified :background unspecified))
     ;;       (t (:foreground ,zenburn-red-1 :weight bold :underline t))))
     ;;    `(flymake-warning
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-orange)
     ;;                    :inherit unspecified :foreground unspecified :background unspecified))
     ;;       (t (:foreground ,zenburn-orange :weight bold :underline t))))
     ;;    `(flymake-note
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-green)
     ;;                    :inherit unspecified :foreground unspecified :background unspecified))
     ;;       (t (:foreground ,zenburn-green-2 :weight bold :underline t))))
     ;; ;;;;; flyspell
     ;;    `(flyspell-duplicate
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-orange) :inherit unspecified))
     ;;       (t (:foreground ,zenburn-orange :weight bold :underline t))))
     ;;    `(flyspell-incorrect
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-red) :inherit unspecified))
     ;;       (t (:foreground ,zenburn-red-1 :weight bold :underline t))))
     ;; ;;;;; full-ack
     ;;    `(ack-separator ((t (:foreground ,zenburn-fg))))
     ;;    `(ack-file ((t (:foreground ,zenburn-blue))))
     ;;    `(ack-line ((t (:foreground ,zenburn-yellow))))
     ;;    `(ack-match ((t (:foreground ,zenburn-orange :background ,zenburn-bg-1 :weight bold))))
     ;; ;;;;; git-annex
     ;;    '(git-annex-dired-annexed-available ((t (:inherit success :weight normal))))
     ;;    '(git-annex-dired-annexed-unavailable ((t (:inherit error :weight normal))))
     ;; ;;;;; git-commit
     ;;    `(git-commit-comment-action  ((,class (:foreground ,zenburn-green+1 :weight bold))))
     ;;    `(git-commit-comment-branch  ((,class (:foreground ,zenburn-blue+1  :weight bold)))) ; obsolete
     ;;    `(git-commit-comment-branch-local  ((,class (:foreground ,zenburn-blue+1  :weight bold))))
     ;;    `(git-commit-comment-branch-remote ((,class (:foreground ,zenburn-green  :weight bold))))
     ;;    `(git-commit-comment-heading ((,class (:foreground ,zenburn-yellow  :weight bold))))
     ;; ;;;;; git-gutter
     ;;    `(git-gutter:added ((t (:foreground ,zenburn-green :weight bold :inverse-video t))))
     ;;    `(git-gutter:deleted ((t (:foreground ,zenburn-red :weight bold :inverse-video t))))
     ;;    `(git-gutter:modified ((t (:foreground ,zenburn-magenta :weight bold :inverse-video t))))
     ;;    `(git-gutter:unchanged ((t (:foreground ,zenburn-fg :weight bold :inverse-video t))))
     ;; ;;;;; git-gutter-fr
     ;;    `(git-gutter-fr:added ((t (:foreground ,zenburn-green  :weight bold))))
     ;;    `(git-gutter-fr:deleted ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(git-gutter-fr:modified ((t (:foreground ,zenburn-magenta :weight bold))))
     ;; ;;;;; git-rebase
     ;;    `(git-rebase-hash ((t (:foreground, zenburn-orange))))
     ;; ;;;;; gnus
     ;;    `(gnus-group-mail-1 ((t (:weight bold :inherit gnus-group-mail-1-empty))))
     ;;    `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
     ;;    `(gnus-group-mail-2 ((t (:weight bold :inherit gnus-group-mail-2-empty))))
     ;;    `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
     ;;    `(gnus-group-mail-3 ((t (:weight bold :inherit gnus-group-mail-3-empty))))
     ;;    `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
     ;;    `(gnus-group-mail-4 ((t (:weight bold :inherit gnus-group-mail-4-empty))))
     ;;    `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
     ;;    `(gnus-group-mail-5 ((t (:weight bold :inherit gnus-group-mail-5-empty))))
     ;;    `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
     ;;    `(gnus-group-mail-6 ((t (:weight bold :inherit gnus-group-mail-6-empty))))
     ;;    `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
     ;;    `(gnus-group-mail-low ((t (:weight bold :inherit gnus-group-mail-low-empty))))
     ;;    `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
     ;;    `(gnus-group-news-1 ((t (:weight bold :inherit gnus-group-news-1-empty))))
     ;;    `(gnus-group-news-2 ((t (:weight bold :inherit gnus-group-news-2-empty))))
     ;;    `(gnus-group-news-3 ((t (:weight bold :inherit gnus-group-news-3-empty))))
     ;;    `(gnus-group-news-4 ((t (:weight bold :inherit gnus-group-news-4-empty))))
     ;;    `(gnus-group-news-5 ((t (:weight bold :inherit gnus-group-news-5-empty))))
     ;;    `(gnus-group-news-6 ((t (:weight bold :inherit gnus-group-news-6-empty))))
     ;;    `(gnus-group-news-low ((t (:weight bold :inherit gnus-group-news-low-empty))))
     ;;    `(gnus-header-content ((t (:inherit message-header-other))))
     ;;    `(gnus-header-from ((t (:inherit message-header-to))))
     ;;    `(gnus-header-name ((t (:inherit message-header-name))))
     ;;    `(gnus-header-newsgroups ((t (:inherit message-header-other))))
     ;;    `(gnus-header-subject ((t (:inherit message-header-subject))))
     ;;    `(gnus-server-opened ((t (:foreground ,zenburn-green+2 :weight bold))))
     ;;    `(gnus-server-denied ((t (:foreground ,zenburn-red+1 :weight bold))))
     ;;    `(gnus-server-closed ((t (:foreground ,zenburn-blue :slant italic))))
     ;;    `(gnus-server-offline ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(gnus-server-agent ((t (:foreground ,zenburn-blue :weight bold))))
     ;;    `(gnus-summary-cancelled ((t (:foreground ,zenburn-orange))))
     ;;    `(gnus-summary-high-ancient ((t (:foreground ,zenburn-blue))))
     ;;    `(gnus-summary-high-read ((t (:foreground ,zenburn-green :weight bold))))
     ;;    `(gnus-summary-high-ticked ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(gnus-summary-high-unread ((t (:foreground ,zenburn-fg :weight bold))))
     ;;    `(gnus-summary-low-ancient ((t (:foreground ,zenburn-blue))))
     ;;    `(gnus-summary-low-read ((t (:foreground ,zenburn-green))))
     ;;    `(gnus-summary-low-ticked ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(gnus-summary-low-unread ((t (:foreground ,zenburn-fg))))
     ;;    `(gnus-summary-normal-ancient ((t (:foreground ,zenburn-blue))))
     ;;    `(gnus-summary-normal-read ((t (:foreground ,zenburn-green))))
     ;;    `(gnus-summary-normal-ticked ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(gnus-summary-normal-unread ((t (:foreground ,zenburn-fg))))
     ;;    `(gnus-summary-selected ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(gnus-cite-1 ((t (:foreground ,zenburn-blue))))
     ;;    `(gnus-cite-10 ((t (:foreground ,zenburn-yellow-1))))
     ;;    `(gnus-cite-11 ((t (:foreground ,zenburn-yellow))))
     ;;    `(gnus-cite-2 ((t (:foreground ,zenburn-blue-1))))
     ;;    `(gnus-cite-3 ((t (:foreground ,zenburn-blue-2))))
     ;;    `(gnus-cite-4 ((t (:foreground ,zenburn-green+2))))
     ;;    `(gnus-cite-5 ((t (:foreground ,zenburn-green+1))))
     ;;    `(gnus-cite-6 ((t (:foreground ,zenburn-green))))
     ;;    `(gnus-cite-7 ((t (:foreground ,zenburn-red))))
     ;;    `(gnus-cite-8 ((t (:foreground ,zenburn-red-1))))
     ;;    `(gnus-cite-9 ((t (:foreground ,zenburn-red-2))))
     ;;    `(gnus-group-news-1-empty ((t (:foreground ,zenburn-yellow))))
     ;;    `(gnus-group-news-2-empty ((t (:foreground ,zenburn-green+3))))
     ;;    `(gnus-group-news-3-empty ((t (:foreground ,zenburn-green+1))))
     ;;    `(gnus-group-news-4-empty ((t (:foreground ,zenburn-blue-2))))
     ;;    `(gnus-group-news-5-empty ((t (:foreground ,zenburn-blue-3))))
     ;;    `(gnus-group-news-6-empty ((t (:foreground ,zenburn-bg+2))))
     ;;    `(gnus-group-news-low-empty ((t (:foreground ,zenburn-bg+2))))
     ;;    `(gnus-signature ((t (:foreground ,zenburn-yellow))))
     ;;    `(gnus-x ((t (:background ,zenburn-fg :foreground ,zenburn-bg))))
     ;;    `(mm-uu-extract ((t (:background ,zenburn-bg-05 :foreground ,zenburn-green+1))))
     ;; ;;;;; go-guru
     ;;    `(go-guru-hl-identifier-face ((t (:foreground ,zenburn-bg-1 :background ,zenburn-green+1))))
     ;; ;;;;; guide-key
     ;;    `(guide-key/highlight-command-face ((t (:foreground ,zenburn-blue))))
     ;;    `(guide-key/key-face ((t (:foreground ,zenburn-green))))
     ;;    `(guide-key/prefix-command-face ((t (:foreground ,zenburn-green+1))))
     ;; ;;;;; hackernews
     ;;    '(hackernews-comment-count ((t (:inherit link-visited :underline nil))))
     ;;    '(hackernews-link          ((t (:inherit link         :underline nil))))
     ;; ;;;;; helm
     ;;    `(helm-header
     ;;      ((t (:foreground ,zenburn-green
     ;;                       :background ,zenburn-bg
     ;;                       :underline nil
     ;;                       :box nil
     ;;                       :extend t))))
     ;;    `(helm-source-header
     ;;      ((t (:foreground ,zenburn-yellow
     ;;                       :background ,zenburn-bg-1
     ;;                       :underline nil
     ;;                       :weight bold
     ;;                       :box (:line-width -1 :style released-button)
     ;;                       :extend t))))
     ;;    `(helm-selection ((t (:background ,zenburn-bg+1 :underline nil))))
     ;;    `(helm-selection-line ((t (:background ,zenburn-bg+1))))
     ;;    `(helm-visible-mark ((t (:foreground ,zenburn-bg :background ,zenburn-yellow-2))))
     ;;    `(helm-candidate-number ((t (:foreground ,zenburn-green+4 :background ,zenburn-bg-1))))
     ;;    `(helm-separator ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
     ;;    `(helm-time-zone-current ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))
     ;;    `(helm-time-zone-home ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
     ;;    `(helm-bookmark-addressbook ((t (:foreground ,zenburn-orange :background ,zenburn-bg))))
     ;;    `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
     ;;    `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
     ;;    `(helm-bookmark-gnus ((t (:foreground ,zenburn-magenta :background ,zenburn-bg))))
     ;;    `(helm-bookmark-info ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))
     ;;    `(helm-bookmark-man ((t (:foreground ,zenburn-yellow :background ,zenburn-bg))))
     ;;    `(helm-bookmark-w3m ((t (:foreground ,zenburn-magenta :background ,zenburn-bg))))
     ;;    `(helm-buffer-not-saved ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
     ;;    `(helm-buffer-process ((t (:foreground ,zenburn-cyan :background ,zenburn-bg))))
     ;;    `(helm-buffer-saved-out ((t (:foreground ,zenburn-fg :background ,zenburn-bg))))
     ;;    `(helm-buffer-size ((t (:foreground ,zenburn-fg-1 :background ,zenburn-bg))))
     ;;    `(helm-ff-directory ((t (:foreground ,zenburn-cyan :background ,zenburn-bg :weight bold))))
     ;;    `(helm-ff-file ((t (:foreground ,zenburn-fg :background ,zenburn-bg :weight normal))))
     ;;    `(helm-ff-file-extension ((t (:foreground ,zenburn-fg :background ,zenburn-bg :weight normal))))
     ;;    `(helm-ff-executable ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg :weight normal))))
     ;;    `(helm-ff-invalid-symlink ((t (:foreground ,zenburn-red :background ,zenburn-bg :weight bold))))
     ;;    `(helm-ff-symlink ((t (:foreground ,zenburn-yellow :background ,zenburn-bg :weight bold))))
     ;;    `(helm-ff-prefix ((t (:foreground ,zenburn-bg :background ,zenburn-yellow :weight normal))))
     ;;    `(helm-grep-cmd-line ((t (:foreground ,zenburn-cyan :background ,zenburn-bg))))
     ;;    `(helm-grep-file ((t (:foreground ,zenburn-fg :background ,zenburn-bg))))
     ;;    `(helm-grep-finish ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))
     ;;    `(helm-grep-lineno ((t (:foreground ,zenburn-fg-1 :background ,zenburn-bg))))
     ;;    `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
     ;;    `(helm-grep-running ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
     ;;    `(helm-match ((t (:foreground ,zenburn-orange :background ,zenburn-bg-1 :weight bold))))
     ;;    `(helm-moccur-buffer ((t (:foreground ,zenburn-cyan :background ,zenburn-bg))))
     ;;    `(helm-mu-contacts-address-face ((t (:foreground ,zenburn-fg-1 :background ,zenburn-bg))))
     ;;    `(helm-mu-contacts-name-face ((t (:foreground ,zenburn-fg :background ,zenburn-bg))))
     ;; ;;;;; helm-lxc
     ;;    `(helm-lxc-face-frozen ((t (:foreground ,zenburn-blue :background ,zenburn-bg))))
     ;;    `(helm-lxc-face-running ((t (:foreground ,zenburn-green :background ,zenburn-bg))))
     ;;    `(helm-lxc-face-stopped ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
     ;; ;;;;; helm-swoop
     ;;    `(helm-swoop-target-line-face ((t (:foreground ,zenburn-fg :background ,zenburn-bg+1))))
     ;;    `(helm-swoop-target-word-face ((t (:foreground ,zenburn-yellow :background ,zenburn-bg+2 :weight bold))))
     ;; ;;;;; highlight-numbers
     ;;    `(highlight-numbers-number ((t (:foreground ,zenburn-blue))))
     ;; ;;;;; highlight-symbol
     ;;    `(highlight-symbol-face ((t (:background ,zenburn-bg+2))))
     ;; ;;;;; highlight-thing
     ;;    `(highlight-thing ((t (:background ,zenburn-bg+2))))
     ;; ;;;;; hl-line-mode
     ;;    `(hl-line-face ((,class (:background ,zenburn-bg-05))
     ;;                    (t :weight bold)))
     ;;    `(hl-line ((,class (:background ,zenburn-bg-05 :extend t)) ; old emacsen
     ;;               (t :weight bold)))
     ;; ;;;;; hl-sexp
     ;;    `(hl-sexp-face ((,class (:background ,zenburn-bg+1))
     ;;                    (t :weight bold)))
     ;; ;;;;; hydra
     ;;    `(hydra-face-red ((t (:foreground ,zenburn-red-1 :background ,zenburn-bg))))
     ;;    `(hydra-face-amaranth ((t (:foreground ,zenburn-red-3 :background ,zenburn-bg))))
     ;;    `(hydra-face-blue ((t (:foreground ,zenburn-blue :background ,zenburn-bg))))
     ;;    `(hydra-face-pink ((t (:foreground ,zenburn-magenta :background ,zenburn-bg))))
     ;;    `(hydra-face-teal ((t (:foreground ,zenburn-cyan :background ,zenburn-bg))))
     ;; ;;;;; info+
     ;;    `(info-command-ref-item ((t (:background ,zenburn-bg-1 :foreground ,zenburn-orange))))
     ;;    `(info-constant-ref-item ((t (:background ,zenburn-bg-1 :foreground ,zenburn-magenta))))
     ;;    `(info-double-quoted-name ((t (:inherit font-lock-comment-face))))
     ;;    `(info-file ((t (:background ,zenburn-bg-1 :foreground ,zenburn-yellow))))
     ;;    `(info-function-ref-item ((t (:background ,zenburn-bg-1 :inherit font-lock-function-name-face))))
     ;;    `(info-macro-ref-item ((t (:background ,zenburn-bg-1 :foreground ,zenburn-yellow))))
     ;;    `(info-menu ((t (:foreground ,zenburn-yellow))))
     ;;    `(info-quoted-name ((t (:inherit font-lock-constant-face))))
     ;;    `(info-reference-item ((t (:background ,zenburn-bg-1))))
     ;;    `(info-single-quote ((t (:inherit font-lock-keyword-face))))
     ;;    `(info-special-form-ref-item ((t (:background ,zenburn-bg-1 :foreground ,zenburn-yellow))))
     ;;    `(info-string ((t (:inherit font-lock-string-face))))
     ;;    `(info-syntax-class-item ((t (:background ,zenburn-bg-1 :foreground ,zenburn-blue+1))))
     ;;    `(info-user-option-ref-item ((t (:background ,zenburn-bg-1 :foreground ,zenburn-red))))
     ;;    `(info-variable-ref-item ((t (:background ,zenburn-bg-1 :foreground ,zenburn-orange))))
     ;; ;;;;; irfc
     ;;    `(irfc-head-name-face ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(irfc-head-number-face ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(irfc-reference-face ((t (:foreground ,zenburn-blue-1 :weight bold))))
     ;;    `(irfc-requirement-keyword-face ((t (:inherit font-lock-keyword-face))))
     ;;    `(irfc-rfc-link-face ((t (:inherit link))))
     ;;    `(irfc-rfc-number-face ((t (:foreground ,zenburn-cyan :weight bold))))
     ;;    `(irfc-std-number-face ((t (:foreground ,zenburn-green+4 :weight bold))))
     ;;    `(irfc-table-item-face ((t (:foreground ,zenburn-green+3))))
     ;;    `(irfc-title-face ((t (:foreground ,zenburn-yellow
     ;;                                       :underline t :weight bold))))
     ;; ;;;;; ivy
     ;;    `(ivy-confirm-face ((t (:foreground ,zenburn-green :background ,zenburn-bg))))
     ;;    `(ivy-current-match ((t (:foreground ,zenburn-yellow :weight bold :underline t))))
     ;;    `(ivy-cursor ((t (:foreground ,zenburn-bg :background ,zenburn-fg))))
     ;;    `(ivy-match-required-face ((t (:foreground ,zenburn-red :background ,zenburn-bg))))
     ;;    `(ivy-minibuffer-match-face-1 ((t (:background ,zenburn-bg+1))))
     ;;    `(ivy-minibuffer-match-face-2 ((t (:background ,zenburn-green-2))))
     ;;    `(ivy-minibuffer-match-face-3 ((t (:background ,zenburn-green))))
     ;;    `(ivy-minibuffer-match-face-4 ((t (:background ,zenburn-green+1))))
     ;;    `(ivy-remote ((t (:foreground ,zenburn-blue :background ,zenburn-bg))))
     ;;    `(ivy-subdir ((t (:foreground ,zenburn-yellow :background ,zenburn-bg))))
     ;; ;;;;; ido-mode
     ;;    `(ido-first-match ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(ido-only-match ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(ido-subdir ((t (:foreground ,zenburn-yellow))))
     ;;    `(ido-indicator ((t (:foreground ,zenburn-yellow :background ,zenburn-red-4))))
     ;; ;;;;; iedit-mode
     ;;    `(iedit-occurrence ((t (:background ,zenburn-bg+2 :weight bold))))
     ;; ;;;;; jabber-mode
     ;;    `(jabber-roster-user-away ((t (:foreground ,zenburn-green+2))))
     ;;    `(jabber-roster-user-online ((t (:foreground ,zenburn-blue-1))))
     ;;    `(jabber-roster-user-dnd ((t (:foreground ,zenburn-red+1))))
     ;;    `(jabber-roster-user-xa ((t (:foreground ,zenburn-magenta))))
     ;;    `(jabber-roster-user-chatty ((t (:foreground ,zenburn-orange))))
     ;;    `(jabber-roster-user-error ((t (:foreground ,zenburn-red+1))))
     ;;    `(jabber-rare-time-face ((t (:foreground ,zenburn-green+1))))
     ;;    `(jabber-chat-prompt-local ((t (:foreground ,zenburn-blue-1))))
     ;;    `(jabber-chat-prompt-foreign ((t (:foreground ,zenburn-red+1))))
     ;;    `(jabber-chat-prompt-system ((t (:foreground ,zenburn-green+3))))
     ;;    `(jabber-activity-face((t (:foreground ,zenburn-red+1))))
     ;;    `(jabber-activity-personal-face ((t (:foreground ,zenburn-blue+1))))
     ;;    `(jabber-title-small ((t (:height 1.1 :weight bold))))
     ;;    `(jabber-title-medium ((t (:height 1.2 :weight bold))))
     ;;    `(jabber-title-large ((t (:height 1.3 :weight bold))))
     ;; ;;;;; js2-mode
     ;;    `(js2-warning ((t (:underline ,zenburn-orange))))
     ;;    `(js2-error ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(js2-jsdoc-tag ((t (:foreground ,zenburn-green-2))))
     ;;    `(js2-jsdoc-type ((t (:foreground ,zenburn-green+2))))
     ;;    `(js2-jsdoc-value ((t (:foreground ,zenburn-green+3))))
     ;;    `(js2-function-param ((t (:foreground, zenburn-orange))))
     ;;    `(js2-external-variable ((t (:foreground ,zenburn-orange))))
     ;; ;;;;; additional js2 mode attributes for better syntax highlighting
     ;;    `(js2-instance-member ((t (:foreground ,zenburn-green-2))))
     ;;    `(js2-jsdoc-html-tag-delimiter ((t (:foreground ,zenburn-orange))))
     ;;    `(js2-jsdoc-html-tag-name ((t (:foreground ,zenburn-red-1))))
     ;;    `(js2-object-property ((t (:foreground ,zenburn-blue+1))))
     ;;    `(js2-magic-paren ((t (:foreground ,zenburn-blue-5))))
     ;;    `(js2-private-function-call ((t (:foreground ,zenburn-cyan))))
     ;;    `(js2-function-call ((t (:foreground ,zenburn-cyan))))
     ;;    `(js2-private-member ((t (:foreground ,zenburn-blue-1))))
     ;;    `(js2-keywords ((t (:foreground ,zenburn-magenta))))
     ;; ;;;;; ledger-mode
     ;;    `(ledger-font-payee-uncleared-face ((t (:foreground ,zenburn-red-1 :weight bold))))
     ;;    `(ledger-font-payee-cleared-face ((t (:foreground ,zenburn-fg :weight normal))))
     ;;    `(ledger-font-payee-pending-face ((t (:foreground ,zenburn-red :weight normal))))
     ;;    `(ledger-font-xact-highlight-face ((t (:background ,zenburn-bg+1))))
     ;;    `(ledger-font-auto-xact-face ((t (:foreground ,zenburn-yellow-1 :weight normal))))
     ;;    `(ledger-font-periodic-xact-face ((t (:foreground ,zenburn-green :weight normal))))
     ;;    `(ledger-font-pending-face ((t (:foreground ,zenburn-orange weight: normal))))
     ;;    `(ledger-font-other-face ((t (:foreground ,zenburn-fg))))
     ;;    `(ledger-font-posting-date-face ((t (:foreground ,zenburn-orange :weight normal))))
     ;;    `(ledger-font-posting-account-face ((t (:foreground ,zenburn-blue-1))))
     ;;    `(ledger-font-posting-account-cleared-face ((t (:foreground ,zenburn-fg))))
     ;;    `(ledger-font-posting-account-pending-face ((t (:foreground ,zenburn-orange))))
     ;;    `(ledger-font-posting-amount-face ((t (:foreground ,zenburn-orange))))
     ;;    `(ledger-occur-narrowed-face ((t (:foreground ,zenburn-fg-1 :invisible t))))
     ;;    `(ledger-occur-xact-face ((t (:background ,zenburn-bg+1))))
     ;;    `(ledger-font-comment-face ((t (:foreground ,zenburn-green))))
     ;;    `(ledger-font-reconciler-uncleared-face ((t (:foreground ,zenburn-red-1 :weight bold))))
     ;;    `(ledger-font-reconciler-cleared-face ((t (:foreground ,zenburn-fg :weight normal))))
     ;;    `(ledger-font-reconciler-pending-face ((t (:foreground ,zenburn-orange :weight normal))))
     ;;    `(ledger-font-report-clickable-face ((t (:foreground ,zenburn-orange :weight normal))))
     ;; ;;;;; linum-mode
     ;;    `(linum ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))
     ;; ;;;;; lispy
     ;;    `(lispy-command-name-face ((t (:background ,zenburn-bg-05 :inherit font-lock-function-name-face))))
     ;;    `(lispy-cursor-face ((t (:foreground ,zenburn-bg :background ,zenburn-fg))))
     ;;    `(lispy-face-hint ((t (:inherit highlight :foreground ,zenburn-yellow))))
     ;; ;;;;; ruler-mode
     ;;    `(ruler-mode-column-number ((t (:inherit 'ruler-mode-default :foreground ,zenburn-fg))))
     ;;    `(ruler-mode-fill-column ((t (:inherit 'ruler-mode-default :foreground ,zenburn-yellow))))
     ;;    `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
     ;;    `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
     ;;    `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
     ;;    `(ruler-mode-current-column ((t (:foreground ,zenburn-yellow :box t))))
     ;;    `(ruler-mode-default ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))

     ;; ;;;;; lui
     ;;    `(lui-time-stamp-face ((t (:foreground ,zenburn-blue-1))))
     ;;    `(lui-hilight-face ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg))))
     ;;    `(lui-button-face ((t (:inherit hover-highlight))))
     ;; ;;;;; macrostep
     ;;    `(macrostep-gensym-1
     ;;      ((t (:foreground ,zenburn-green+2 :background ,zenburn-bg-1))))
     ;;    `(macrostep-gensym-2
     ;;      ((t (:foreground ,zenburn-red+1 :background ,zenburn-bg-1))))
     ;;    `(macrostep-gensym-3
     ;;      ((t (:foreground ,zenburn-blue+1 :background ,zenburn-bg-1))))
     ;;    `(macrostep-gensym-4
     ;;      ((t (:foreground ,zenburn-magenta :background ,zenburn-bg-1))))
     ;;    `(macrostep-gensym-5
     ;;      ((t (:foreground ,zenburn-yellow :background ,zenburn-bg-1))))
     ;;    `(macrostep-expansion-highlight-face
     ;;      ((t (:inherit highlight))))
     ;;    `(macrostep-macro-face
     ;;      ((t (:underline t))))
     ;; ;;;;; magit
     ;; ;;;;;; headings and diffs
     ;;    ;; Please read (info "(magit)Theming Faces") before changing this.
     ;;    `(magit-section-highlight           ((t (:background ,zenburn-bg+05))))
     ;;    `(magit-section-heading             ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(magit-section-heading-selection   ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(magit-diff-file-heading           ((t (:weight bold))))
     ;;    `(magit-diff-file-heading-highlight ((t (:background ,zenburn-bg+05 :weight bold))))
     ;;    `(magit-diff-file-heading-selection ((t (:background ,zenburn-bg+05 :weight bold
     ;;                                                         :foreground ,zenburn-orange))))
     ;;    `(magit-diff-added                  ((t (:background ,zenburn-green-2))))
     ;;    `(magit-diff-added-highlight        ((t (:background ,zenburn-green))))
     ;;    `(magit-diff-removed                ((t (:background ,zenburn-red-4))))
     ;;    `(magit-diff-removed-highlight      ((t (:background ,zenburn-red-3))))
     ;;    `(magit-diff-hunk-heading           ((t (:background ,zenburn-bg+1))))
     ;;    `(magit-diff-hunk-heading-highlight ((t (:background ,zenburn-bg+2))))
     ;;    `(magit-diff-hunk-heading-selection ((t (:background ,zenburn-bg+2
     ;;                                                         :foreground ,zenburn-orange))))
     ;;    `(magit-diff-lines-heading          ((t (:background ,zenburn-orange
     ;;                                                         :foreground ,zenburn-bg+2))))
     ;;    `(magit-diff-context-highlight      ((t (:background ,zenburn-bg+05
     ;;                                                         :foreground "grey70"))))
     ;;    `(magit-diffstat-added              ((t (:foreground ,zenburn-green+4))))
     ;;    `(magit-diffstat-removed            ((t (:foreground ,zenburn-red))))
     ;; ;;;;;; popup
     ;;    `(magit-popup-heading             ((t (:foreground ,zenburn-yellow  :weight bold))))
     ;;    `(magit-popup-key                 ((t (:foreground ,zenburn-green-2 :weight bold))))
     ;;    `(magit-popup-argument            ((t (:foreground ,zenburn-green   :weight bold))))
     ;;    `(magit-popup-disabled-argument   ((t (:foreground ,zenburn-fg-1    :weight normal))))
     ;;    `(magit-popup-option-value        ((t (:foreground ,zenburn-blue-2  :weight bold))))
     ;; ;;;;;; process
     ;;    `(magit-process-ok    ((t (:foreground ,zenburn-green  :weight bold))))
     ;;    `(magit-process-ng    ((t (:foreground ,zenburn-red    :weight bold))))
     ;; ;;;;;; log
     ;;    `(magit-log-author    ((t (:foreground ,zenburn-orange))))
     ;;    `(magit-log-date      ((t (:foreground ,zenburn-fg-1))))
     ;;    `(magit-log-graph     ((t (:foreground ,zenburn-fg+1))))
     ;; ;;;;;; sequence
     ;;    `(magit-sequence-pick ((t (:foreground ,zenburn-yellow-2))))
     ;;    `(magit-sequence-stop ((t (:foreground ,zenburn-green))))
     ;;    `(magit-sequence-part ((t (:foreground ,zenburn-yellow))))
     ;;    `(magit-sequence-head ((t (:foreground ,zenburn-blue))))
     ;;    `(magit-sequence-drop ((t (:foreground ,zenburn-red))))
     ;;    `(magit-sequence-done ((t (:foreground ,zenburn-fg-1))))
     ;;    `(magit-sequence-onto ((t (:foreground ,zenburn-fg-1))))
     ;; ;;;;;; bisect
     ;;    `(magit-bisect-good ((t (:foreground ,zenburn-green))))
     ;;    `(magit-bisect-skip ((t (:foreground ,zenburn-yellow))))
     ;;    `(magit-bisect-bad  ((t (:foreground ,zenburn-red))))
     ;; ;;;;;; blame
     ;;    `(magit-blame-heading ((t (:background ,zenburn-bg-1 :foreground ,zenburn-blue-2))))
     ;;    `(magit-blame-hash    ((t (:background ,zenburn-bg-1 :foreground ,zenburn-blue-2))))
     ;;    `(magit-blame-name    ((t (:background ,zenburn-bg-1 :foreground ,zenburn-orange))))
     ;;    `(magit-blame-date    ((t (:background ,zenburn-bg-1 :foreground ,zenburn-orange))))
     ;;    `(magit-blame-summary ((t (:background ,zenburn-bg-1 :foreground ,zenburn-blue-2
     ;;                                           :weight bold))))
     ;; ;;;;;; references etc
     ;;    `(magit-dimmed         ((t (:foreground ,zenburn-bg+3))))
     ;;    `(magit-hash           ((t (:foreground ,zenburn-bg+3))))
     ;;    `(magit-tag            ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(magit-branch-remote  ((t (:foreground ,zenburn-green  :weight bold))))
     ;;    `(magit-branch-local   ((t (:foreground ,zenburn-blue   :weight bold))))
     ;;    `(magit-branch-current ((t (:foreground ,zenburn-blue   :weight bold :box t))))
     ;;    `(magit-head           ((t (:foreground ,zenburn-blue   :weight bold))))
     ;;    `(magit-refname        ((t (:background ,zenburn-bg+2 :foreground ,zenburn-fg :weight bold))))
     ;;    `(magit-refname-stash  ((t (:background ,zenburn-bg+2 :foreground ,zenburn-fg :weight bold))))
     ;;    `(magit-refname-wip    ((t (:background ,zenburn-bg+2 :foreground ,zenburn-fg :weight bold))))
     ;;    `(magit-signature-good      ((t (:foreground ,zenburn-green))))
     ;;    `(magit-signature-bad       ((t (:foreground ,zenburn-red))))
     ;;    `(magit-signature-untrusted ((t (:foreground ,zenburn-yellow))))
     ;;    `(magit-signature-expired   ((t (:foreground ,zenburn-orange))))
     ;;    `(magit-signature-revoked   ((t (:foreground ,zenburn-magenta))))
     ;;    '(magit-signature-error     ((t (:inherit    magit-signature-bad))))
     ;;    `(magit-cherry-unmatched    ((t (:foreground ,zenburn-cyan))))
     ;;    `(magit-cherry-equivalent   ((t (:foreground ,zenburn-magenta))))
     ;;    `(magit-reflog-commit       ((t (:foreground ,zenburn-green))))
     ;;    `(magit-reflog-amend        ((t (:foreground ,zenburn-magenta))))
     ;;    `(magit-reflog-merge        ((t (:foreground ,zenburn-green))))
     ;;    `(magit-reflog-checkout     ((t (:foreground ,zenburn-blue))))
     ;;    `(magit-reflog-reset        ((t (:foreground ,zenburn-red))))
     ;;    `(magit-reflog-rebase       ((t (:foreground ,zenburn-magenta))))
     ;;    `(magit-reflog-cherry-pick  ((t (:foreground ,zenburn-green))))
     ;;    `(magit-reflog-remote       ((t (:foreground ,zenburn-cyan))))
     ;;    `(magit-reflog-other        ((t (:foreground ,zenburn-cyan))))
     ;; ;;;;; markup-faces
     ;;    `(markup-anchor-face ((t (:foreground ,zenburn-blue+1))))
     ;;    `(markup-code-face ((t (:inherit font-lock-constant-face))))
     ;;    `(markup-command-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(markup-emphasis-face ((t (:inherit bold))))
     ;;    `(markup-internal-reference-face ((t (:foreground ,zenburn-yellow-2 :underline t))))
     ;;    `(markup-list-face ((t (:foreground ,zenburn-fg+1))))
     ;;    `(markup-meta-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(markup-meta-hide-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(markup-secondary-text-face ((t (:foreground ,zenburn-yellow-1))))
     ;;    `(markup-title-0-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(markup-title-1-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(markup-title-2-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(markup-title-3-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(markup-title-4-face ((t (:inherit font-lock-function-name-face :weight bold))))
     ;;    `(markup-typewriter-face ((t (:inherit font-lock-constant-face))))
     ;;    `(markup-verbatim-face ((t (:inherit font-lock-constant-face))))
     ;;    `(markup-value-face ((t (:foreground ,zenburn-yellow))))
     ;; ;;;;; message-mode
     ;;    `(message-cited-text ((t (:inherit font-lock-comment-face))))
     ;;    `(message-header-name ((t (:foreground ,zenburn-green+1))))
     ;;    `(message-header-other ((t (:foreground ,zenburn-green))))
     ;;    `(message-header-to ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(message-header-cc ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(message-header-newsgroups ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(message-header-subject ((t (:foreground ,zenburn-orange :weight bold))))
     ;;    `(message-header-xheader ((t (:foreground ,zenburn-green))))
     ;;    `(message-mml ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(message-separator ((t (:inherit font-lock-comment-face))))
     ;; ;;;;; mew
     ;;    `(mew-face-header-subject ((t (:foreground ,zenburn-orange))))
     ;;    `(mew-face-header-from ((t (:foreground ,zenburn-yellow))))
     ;;    `(mew-face-header-date ((t (:foreground ,zenburn-green))))
     ;;    `(mew-face-header-to ((t (:foreground ,zenburn-red))))
     ;;    `(mew-face-header-key ((t (:foreground ,zenburn-green))))
     ;;    `(mew-face-header-private ((t (:foreground ,zenburn-green))))
     ;;    `(mew-face-header-important ((t (:foreground ,zenburn-blue))))
     ;;    `(mew-face-header-marginal ((t (:foreground ,zenburn-fg :weight bold))))
     ;;    `(mew-face-header-warning ((t (:foreground ,zenburn-red))))
     ;;    `(mew-face-header-xmew ((t (:foreground ,zenburn-green))))
     ;;    `(mew-face-header-xmew-bad ((t (:foreground ,zenburn-red))))
     ;;    `(mew-face-body-url ((t (:foreground ,zenburn-orange))))
     ;;    `(mew-face-body-comment ((t (:foreground ,zenburn-fg :slant italic))))
     ;;    `(mew-face-body-cite1 ((t (:foreground ,zenburn-green))))
     ;;    `(mew-face-body-cite2 ((t (:foreground ,zenburn-blue))))
     ;;    `(mew-face-body-cite3 ((t (:foreground ,zenburn-orange))))
     ;;    `(mew-face-body-cite4 ((t (:foreground ,zenburn-yellow))))
     ;;    `(mew-face-body-cite5 ((t (:foreground ,zenburn-red))))
     ;;    `(mew-face-mark-review ((t (:foreground ,zenburn-blue))))
     ;;    `(mew-face-mark-escape ((t (:foreground ,zenburn-green))))
     ;;    `(mew-face-mark-delete ((t (:foreground ,zenburn-red))))
     ;;    `(mew-face-mark-unlink ((t (:foreground ,zenburn-yellow))))
     ;;    `(mew-face-mark-refile ((t (:foreground ,zenburn-green))))
     ;;    `(mew-face-mark-unread ((t (:foreground ,zenburn-red-2))))
     ;;    `(mew-face-eof-message ((t (:foreground ,zenburn-green))))
     ;;    `(mew-face-eof-part ((t (:foreground ,zenburn-yellow))))
     ;; ;;;;; mic-paren
     ;;    `(paren-face-match ((t (:foreground ,zenburn-cyan :background ,zenburn-bg :weight bold))))
     ;;    `(paren-face-mismatch ((t (:foreground ,zenburn-bg :background ,zenburn-magenta :weight bold))))
     ;;    `(paren-face-no-match ((t (:foreground ,zenburn-bg :background ,zenburn-red :weight bold))))
     ;; ;;;;; mingus
     ;;    `(mingus-directory-face ((t (:foreground ,zenburn-blue))))
     ;;    `(mingus-pausing-face ((t (:foreground ,zenburn-magenta))))
     ;;    `(mingus-playing-face ((t (:foreground ,zenburn-cyan))))
     ;;    `(mingus-playlist-face ((t (:foreground ,zenburn-cyan ))))
     ;;    `(mingus-mark-face ((t (:bold t :foreground ,zenburn-magenta))))
     ;;    `(mingus-song-file-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(mingus-artist-face ((t (:foreground ,zenburn-cyan))))
     ;;    `(mingus-album-face ((t (:underline t :foreground ,zenburn-red+1))))
     ;;    `(mingus-album-stale-face ((t (:foreground ,zenburn-red+1))))
     ;;    `(mingus-stopped-face ((t (:foreground ,zenburn-red))))
     ;; ;;;;; nav
     ;;    `(nav-face-heading ((t (:foreground ,zenburn-yellow))))
     ;;    `(nav-face-button-num ((t (:foreground ,zenburn-cyan))))
     ;;    `(nav-face-dir ((t (:foreground ,zenburn-green))))
     ;;    `(nav-face-hdir ((t (:foreground ,zenburn-red))))
     ;;    `(nav-face-file ((t (:foreground ,zenburn-fg))))
     ;;    `(nav-face-hfile ((t (:foreground ,zenburn-red-4))))
     ;; ;;;;; merlin
     ;;    `(merlin-type-face ((t (:inherit highlight))))
     ;;    `(merlin-compilation-warning-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-orange)))
     ;;       (t
     ;;        (:underline ,zenburn-orange))))
     ;;    `(merlin-compilation-error-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-red)))
     ;;       (t
     ;;        (:underline ,zenburn-red))))
     ;; ;;;;; mu4e
     ;;    `(mu4e-cited-1-face ((t (:foreground ,zenburn-blue    :slant italic))))
     ;;    `(mu4e-cited-2-face ((t (:foreground ,zenburn-green+2 :slant italic))))
     ;;    `(mu4e-cited-3-face ((t (:foreground ,zenburn-blue-2  :slant italic))))
     ;;    `(mu4e-cited-4-face ((t (:foreground ,zenburn-green   :slant italic))))
     ;;    `(mu4e-cited-5-face ((t (:foreground ,zenburn-blue-4  :slant italic))))
     ;;    `(mu4e-cited-6-face ((t (:foreground ,zenburn-green-2 :slant italic))))
     ;;    `(mu4e-cited-7-face ((t (:foreground ,zenburn-blue    :slant italic))))
     ;;    `(mu4e-replied-face ((t (:foreground ,zenburn-bg+3))))
     ;;    `(mu4e-trashed-face ((t (:foreground ,zenburn-bg+3 :strike-through t))))
     ;; ;;;;; mumamo
     ;;    `(mumamo-background-chunk-major ((t (:background nil))))
     ;;    `(mumamo-background-chunk-submode1 ((t (:background ,zenburn-bg-1))))
     ;;    `(mumamo-background-chunk-submode2 ((t (:background ,zenburn-bg+2))))
     ;;    `(mumamo-background-chunk-submode3 ((t (:background ,zenburn-bg+3))))
     ;;    `(mumamo-background-chunk-submode4 ((t (:background ,zenburn-bg+1))))
     ;; ;;;;; neotree
     ;;    `(neo-banner-face ((t (:foreground ,zenburn-blue+1 :weight bold))))
     ;;    `(neo-header-face ((t (:foreground ,zenburn-fg))))
     ;;    `(neo-root-dir-face ((t (:foreground ,zenburn-blue+1 :weight bold))))
     ;;    `(neo-dir-link-face ((t (:foreground ,zenburn-blue))))
     ;;    `(neo-file-link-face ((t (:foreground ,zenburn-fg))))
     ;;    `(neo-expand-btn-face ((t (:foreground ,zenburn-blue))))
     ;;    `(neo-vc-default-face ((t (:foreground ,zenburn-fg+1))))
     ;;    `(neo-vc-user-face ((t (:foreground ,zenburn-red :slant italic))))
     ;;    `(neo-vc-up-to-date-face ((t (:foreground ,zenburn-fg))))
     ;;    `(neo-vc-edited-face ((t (:foreground ,zenburn-magenta))))
     ;;    `(neo-vc-needs-merge-face ((t (:foreground ,zenburn-red+1))))
     ;;    `(neo-vc-unlocked-changes-face ((t (:foreground ,zenburn-red :background ,zenburn-blue-5))))
     ;;    `(neo-vc-added-face ((t (:foreground ,zenburn-green+1))))
     ;;    `(neo-vc-conflict-face ((t (:foreground ,zenburn-red+1))))
     ;;    `(neo-vc-missing-face ((t (:foreground ,zenburn-red+1))))
     ;;    `(neo-vc-ignored-face ((t (:foreground ,zenburn-fg-1))))
     ;; ;;;;; notmuch
     ;;    `(notmuch-crypto-decryption ((t (:foreground ,zenburn-bg :background ,zenburn-magenta))))
     ;;    `(notmuch-crypto-part-header ((t (:foreground ,zenburn-blue+1))))
     ;;    `(notmuch-crypto-signature-bad ((t (:foreground ,zenburn-bg :background ,zenburn-red))))
     ;;    `(notmuch-crypto-signature-good ((t (:foreground ,zenburn-bg :background ,zenburn-green+1))))
     ;;    `(notmuch-crypto-signature-good-key ((t (:foreground ,zenburn-bg :background ,zenburn-orange))))
     ;;    `(notmuch-crypto-signature-unknown ((t (:foreground ,zenburn-bg :background ,zenburn-red))))
     ;;    `(notmuch-hello-logo-background ((t (:background ,zenburn-bg+2))))
     ;;    `(notmuch-message-summary-face ((t (:background ,zenburn-bg-08))))
     ;;    `(notmuch-search-flagged-face ((t (:foreground ,zenburn-blue+1))))
     ;;    `(notmuch-search-non-matching-authors ((t (:foreground ,zenburn-fg-1))))
     ;;    `(notmuch-tag-added ((t (:underline ,zenburn-green+1))))
     ;;    `(notmuch-tag-deleted ((t (:strike-through ,zenburn-red))))
     ;;    `(notmuch-tag-face ((t (:foreground ,zenburn-green+1))))
     ;;    `(notmuch-tag-flagged ((t (:foreground ,zenburn-blue+1))))
     ;;    `(notmuch-tag-unread ((t (:foreground ,zenburn-red))))
     ;;    `(notmuch-tree-match-author-face ((t (:foreground ,zenburn-green+1))))
     ;;    `(notmuch-tree-match-tag-face ((t (:foreground ,zenburn-green+1))))
     ;; ;;;;; orderless
     ;;    `(orderless-match-face-0 ((t (:foreground ,zenburn-green))))
     ;;    `(orderless-match-face-1 ((t (:foreground ,zenburn-magenta))))
     ;;    `(orderless-match-face-2 ((t (:foreground ,zenburn-blue))))
     ;;    `(orderless-match-face-3 ((t (:foreground ,zenburn-orange))))
      ;;;;; org-mode
     ;;    `(org-agenda-date-today
     ;;      ((t (:foreground ,zenburn-fg+1 :slant italic :weight bold))) t)
     ;;    `(org-agenda-structure
     ;;      ((t (:inherit font-lock-comment-face))))
     ;;    `(org-archived ((t (:foreground ,zenburn-fg :weight bold))))
     ;; Org blocks
     `(org-block ((t (:inherit fixed-pitch :background ,mawce-org-block-bg :extend t))))
     ;; `(org-block-begin-line ((t (:inherit fixed-pitch :overline ,mawce-mode-line-overline :foreground ,mawce-org-block-lines-fg :extend t)))) ;; :background ,mawce-org-block-lines-bg
     ;; `(org-block-end-line ((t (:inherit fixed-pitch :underline ,mawce-mode-line-overline :foreground ,mawce-org-block-lines-fg  :extend t)))) ;; :background ,mawce-org-block-lines-bg
     `(org-block-begin-line ((t (:inherit fixed-pitch :foreground ,mawce-org-block-lines-fg :extend t :background ,mawce-org-block-lines-bg)))) ;;
     `(org-block-end-line ((t (:inherit fixed-pitch :foreground ,mawce-org-block-lines-fg  :extend t :background ,mawce-org-block-lines-bg)))) ;;
     ;;    `(org-checkbox ((t (:background ,zenburn-bg+2 :foreground ,zenburn-fg+1
     ;;                                    :box (:line-width 1 :style released-button)))))
     `(org-code ((t (:foreground ,mawce-org-code-fg :extend t :slant italic ;; :background ,mawce-org-code-bg
                                 ))))
     `(org-drawer ((t (:inherit fixed-pitch :foreground ,mawce-org-drawer-fg :slant italic))))
     ;;    `(org-date ((t (:foreground ,zenburn-blue :underline t))))
     ;;    `(org-deadline-announce ((t (:foreground ,zenburn-red-1))))
     ;; `(org-done ((t (:weight bold :foreground ,mawce-org-done-fg))))
     ;;    `(org-formula ((t (:foreground ,zenburn-yellow-2))))
     `(org-headline-done ((t (:foreground ,mawce-org-headline-done-fg :slant italic))))
     ;;    `(org-hide ((t (:foreground ,zenburn-bg))))
     `(org-level-1 ((t ( :foreground ,mawce-org-level-1-fg
                         ,@(when mawce-scale-org-headlines
                             (list :height mawce-height-plus-4))))))
     `(org-level-2 ((t ( :foreground ,mawce-org-level-2-fg
                         ,@(when mawce-scale-org-headlines
                             (list :height mawce-height-plus-3))))))
     `(org-level-3 ((t ( :foreground ,mawce-org-level-3-fg
                         ,@(when mawce-scale-org-headlines
                             (list :height mawce-height-plus-2))))))
     `(org-level-4 ((t ( :foreground ,mawce-org-level-4-fg
                         ,@(when mawce-scale-org-headlines
                             (list :height mawce-height-plus-1))))))
     `(org-level-5 ((t ( :foreground ,mawce-org-level-5-fg))))
     `(org-level-6 ((t ( :foreground ,mawce-org-level-6-fg))))
     `(org-level-7 ((t ( :foreground ,mawce-org-level-7-fg))))
     `(org-level-8 ((t ( :foreground ,mawce-org-level-8-fg))))
     `(org-link ((t (:foreground ,mawce-org-link-fg :underline t))))
     `(org-meta-line ((t (:inherit fixed-pitch :foreground ,mawce-org-meta-line-fg))))
     ;; `(org-modern-date-inactive ((t (:inherit (fixed-pitch org-modern-date-inactive)))))
     ;; `(org-modern-date-active ((t (:inherit fixed-pitch))))
     `(org-modern-symbol ((t (:inherit fixed-pitch))))
     ;;    `(org-quote ((t (:background ,zenburn-bg+05 :extend t))))
     ;;    `(org-scheduled ((t (:foreground ,zenburn-green+4))))
     ;;    `(org-scheduled-previously ((t (:foreground ,zenburn-red))))
     ;;    `(org-scheduled-today ((t (:foreground ,zenburn-blue+1))))
     `(org-sexp-date ((t (:foreground ,mawce-org-sexp-date-fg :underline t))))
     `(org-special-keyword ((t (:inherit fixed-pitch, :foreground ,mawce-org-special-keyword))))
     `(org-table ((t (:inherit fixed-pitch :foreground ,mawce-org-table-fg))))
     ;;    `(org-tag ((t (:weight bold))))
     ;;    `(org-time-grid ((t (:foreground ,zenburn-orange))))
     `(org-todo ((t (:weight bold :foreground ,mawce-org-todo-fg))))
     `(org-verbatim ((t (:inherit fixed-pitch :foreground ,mawce-org-verbatim-fg))))
     ;;    `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
     ;;    `(org-warning ((t (:weight bold :foreground ,zenburn-red :underline nil))))
     ;;    `(org-column ((t (:background ,zenburn-bg-1))))
     ;;    `(org-column-title ((t (:background ,zenburn-bg-1 :underline t :weight bold))))
     ;;    `(org-mode-line-clock ((t (:foreground ,zenburn-fg :background ,zenburn-bg-1))))
     ;;    `(org-mode-line-clock-overrun ((t (:foreground ,zenburn-bg :background ,zenburn-red-1))))
     `(org-ellipsis ((t (:foreground ,mawce-org-ellipses-fg ))))
     ;;    `(org-footnote ((t (:foreground ,zenburn-cyan :underline t))))
     `(org-document-title ((t (:inherit ,z-variable-pitch :foreground ,mawce-org-document-title-fg
                                        :weight bold
                                        ,@(when mawce-scale-org-headlines
                                            (list :height mawce-height-plus-4))))))
     `(org-document-info ((t (:inherit ,z-variable-pitch :foreground ,mawce-org-document-info-fg))))
     `(org-document-info-keyword ((t (:inherit ,z-variable-pitch :foreground ,mawce-org-document-info-keyword-fg))))
     ;;    `(org-habit-ready-face ((t :background ,zenburn-green)))
     ;;    `(org-habit-alert-face ((t :background ,zenburn-yellow-1 :foreground ,zenburn-bg)))
     ;;    `(org-habit-clear-face ((t :background ,zenburn-blue-3)))
     ;;    `(org-habit-overdue-face ((t :background ,zenburn-red-3)))
     ;;    `(org-habit-clear-future-face ((t :background ,zenburn-blue-4)))
     ;;    `(org-habit-ready-future-face ((t :background ,zenburn-green-2)))
     ;;    `(org-habit-alert-future-face ((t :background ,zenburn-yellow-2 :foreground ,zenburn-bg)))
     ;;    `(org-habit-overdue-future-face ((t :background ,zenburn-red-4)))
     ;; ;;;;; org-ref
     ;;    `(org-ref-ref-face ((t :underline t)))
     ;;    `(org-ref-label-face ((t :underline t)))
     ;;    `(org-ref-cite-face ((t :underline t)))
     ;;    `(org-ref-glossary-face ((t :underline t)))
     ;;    `(org-ref-acronym-face ((t :underline t)))
     ;; ;;;;; outline
     ;;    `(outline-1 ((t (:inherit ,z-variable-pitch :foreground ,zenburn-orange
     ;;                              ,@(when zenburn-scale-outline-headlines
     ;;                                  (list :height zenburn-height-plus-4))))))
     ;;    `(outline-2 ((t (:inherit ,z-variable-pitch :foreground ,zenburn-green+4
     ;;                              ,@(when zenburn-scale-outline-headlines
     ;;                                  (list :height zenburn-height-plus-3))))))
     ;;    `(outline-3 ((t (:inherit ,z-variable-pitch :foreground ,zenburn-blue-1
     ;;                              ,@(when zenburn-scale-outline-headlines
     ;;                                  (list :height zenburn-height-plus-2))))))
     ;;    `(outline-4 ((t (:inherit ,z-variable-pitch :foreground ,zenburn-yellow-2
     ;;                              ,@(when zenburn-scale-outline-headlines
     ;;                                  (list :height zenburn-height-plus-1))))))
     ;;    `(outline-5 ((t (:inherit ,z-variable-pitch :foreground ,zenburn-cyan))))
     ;;    `(outline-6 ((t (:inherit ,z-variable-pitch :foreground ,zenburn-green+2))))
     ;;    `(outline-7 ((t (:inherit ,z-variable-pitch :foreground ,zenburn-red-4))))
     ;;    `(outline-8 ((t (:inherit ,z-variable-pitch :foreground ,zenburn-blue-4))))
     ;; ;;;;; p4
     ;;    `(p4-depot-added-face ((t :inherit diff-added)))
     ;;    `(p4-depot-branch-op-face ((t :inherit diff-changed)))
     ;;    `(p4-depot-deleted-face ((t :inherit diff-removed)))
     ;;    `(p4-depot-unmapped-face ((t :inherit diff-changed)))
     ;;    `(p4-diff-change-face ((t :inherit diff-changed)))
     ;;    `(p4-diff-del-face ((t :inherit diff-removed)))
     ;;    `(p4-diff-file-face ((t :inherit diff-file-header)))
     ;;    `(p4-diff-head-face ((t :inherit diff-header)))
     ;;    `(p4-diff-ins-face ((t :inherit diff-added)))
     ;; ;;;;; c/perl
     ;;    `(cperl-nonoverridable-face ((t (:foreground ,zenburn-magenta))))
     ;;    `(cperl-array-face ((t (:foreground ,zenburn-yellow, :background ,zenburn-bg))))
     ;;    `(cperl-hash-face ((t (:foreground ,zenburn-yellow-1, :background ,zenburn-bg))))
     ;; ;;;;; paren-face
     ;;    `(parenthesis ((t (:foreground ,zenburn-fg-1))))
     ;; ;;;;; perspective
     `(persp-selected-face ((t (:foreground ,mawce-persp-selected-face))))
     ;; ;;;;; powerline
     ;;    `(powerline-active1 ((t (:background ,zenburn-bg-05 :inherit mode-line))))
     ;;    `(powerline-active2 ((t (:background ,zenburn-bg+2 :inherit mode-line))))
     ;;    `(powerline-inactive1 ((t (:background ,zenburn-bg+1 :inherit mode-line-inactive))))
     ;;    `(powerline-inactive2 ((t (:background ,zenburn-bg+3 :inherit mode-line-inactive))))
     ;; ;;;;; proofgeneral
     ;;    `(proof-active-area-face ((t (:underline t))))
     ;;    `(proof-boring-face ((t (:foreground ,zenburn-fg :background ,zenburn-bg+2))))
     ;;    `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
     ;;    `(proof-debug-message-face ((t (:inherit proof-boring-face))))
     ;;    `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
     ;;    `(proof-eager-annotation-face ((t (:foreground ,zenburn-bg :background ,zenburn-orange))))
     ;;    `(proof-error-face ((t (:foreground ,zenburn-fg :background ,zenburn-red-4))))
     ;;    `(proof-highlight-dependency-face ((t (:foreground ,zenburn-bg :background ,zenburn-yellow-1))))
     ;;    `(proof-highlight-dependent-face ((t (:foreground ,zenburn-bg :background ,zenburn-orange))))
     ;;    `(proof-locked-face ((t (:background ,zenburn-blue-5))))
     ;;    `(proof-mouse-highlight-face ((t (:foreground ,zenburn-bg :background ,zenburn-orange))))
     ;;    `(proof-queue-face ((t (:background ,zenburn-red-4))))
     ;;    `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
     ;;    `(proof-script-highlight-error-face ((t (:background ,zenburn-red-2))))
     ;;    `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,zenburn-bg))))
     ;;    `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,zenburn-bg))))
     ;;    `(proof-warning-face ((t (:foreground ,zenburn-bg :background ,zenburn-yellow-1))))
     ;; ;;;;; racket-mode
     ;;    `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
     ;;    `(racket-selfeval-face ((t (:inherit font-lock-type-face))))
     ;; ;;;;; rainbow-delimiters
     ;;    `(rainbow-delimiters-depth-1-face ((t (:foreground ,zenburn-fg))))
     ;;    `(rainbow-delimiters-depth-2-face ((t (:foreground ,zenburn-green+4))))
     ;;    `(rainbow-delimiters-depth-3-face ((t (:foreground ,zenburn-yellow-2))))
     ;;    `(rainbow-delimiters-depth-4-face ((t (:foreground ,zenburn-cyan))))
     ;;    `(rainbow-delimiters-depth-5-face ((t (:foreground ,zenburn-green+2))))
     ;;    `(rainbow-delimiters-depth-6-face ((t (:foreground ,zenburn-blue+1))))
     ;;    `(rainbow-delimiters-depth-7-face ((t (:foreground ,zenburn-yellow-1))))
     ;;    `(rainbow-delimiters-depth-8-face ((t (:foreground ,zenburn-green+1))))
     ;;    `(rainbow-delimiters-depth-9-face ((t (:foreground ,zenburn-blue-2))))
     ;;    `(rainbow-delimiters-depth-10-face ((t (:foreground ,zenburn-orange))))
     ;;    `(rainbow-delimiters-depth-11-face ((t (:foreground ,zenburn-green))))
     ;;    `(rainbow-delimiters-depth-12-face ((t (:foreground ,zenburn-blue-5))))
     ;; ;;;;; rcirc
     ;;    `(rcirc-my-nick ((t (:foreground ,zenburn-blue))))
     ;;    `(rcirc-other-nick ((t (:foreground ,zenburn-orange))))
     ;;    `(rcirc-bright-nick ((t (:foreground ,zenburn-blue+1))))
     ;;    `(rcirc-dim-nick ((t (:foreground ,zenburn-blue-2))))
     ;;    `(rcirc-server ((t (:foreground ,zenburn-green))))
     ;;    `(rcirc-server-prefix ((t (:foreground ,zenburn-green+1))))
     ;;    `(rcirc-timestamp ((t (:foreground ,zenburn-green+2))))
     ;;    `(rcirc-nick-in-message ((t (:foreground ,zenburn-yellow))))
     ;;    `(rcirc-nick-in-message-full-line ((t (:weight bold))))
     ;;    `(rcirc-prompt ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(rcirc-track-nick ((t (:inverse-video t))))
     ;;    `(rcirc-track-keyword ((t (:weight bold))))
     ;;    `(rcirc-url ((t (:weight bold))))
     ;;    `(rcirc-keyword ((t (:foreground ,zenburn-yellow :weight bold))))
     ;; ;;;;; re-builder
     ;;    `(reb-match-0 ((t (:foreground ,zenburn-bg :background ,zenburn-magenta))))
     ;;    `(reb-match-1 ((t (:foreground ,zenburn-bg :background ,zenburn-blue))))
     ;;    `(reb-match-2 ((t (:foreground ,zenburn-bg :background ,zenburn-orange))))
     ;;    `(reb-match-3 ((t (:foreground ,zenburn-bg :background ,zenburn-red))))
     ;; ;;;;; realgud
     ;;    `(realgud-overlay-arrow1 ((t (:foreground ,zenburn-green))))
     ;;    `(realgud-overlay-arrow2 ((t (:foreground ,zenburn-yellow))))
     ;;    `(realgud-overlay-arrow3 ((t (:foreground ,zenburn-orange))))
     ;;    `(realgud-bp-enabled-face ((t (:inherit error))))
     ;;    `(realgud-bp-disabled-face ((t (:inherit secondary-selection))))
     ;;    `(realgud-bp-line-enabled-face ((t (:box (:color ,zenburn-red :style nil)))))
     ;;    `(realgud-bp-line-disabled-face ((t (:box (:color "grey70" :style nil)))))
     ;;    `(realgud-line-number ((t (:foreground ,zenburn-yellow))))
     ;;    `(realgud-backtrace-number ((t (:foreground ,zenburn-yellow, :weight bold))))
     ;; ;;;;; regex-tool
     ;;    `(regex-tool-matched-face ((t (:background ,zenburn-blue-4 :weight bold))))
     ;; ;;;;; rmail
     ;;    `(rmail-highlight ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(rmail-header-name ((t (:foreground ,zenburn-blue))))
     ;; ;;;;; rpm-mode
     ;;    `(rpm-spec-dir-face ((t (:foreground ,zenburn-green))))
     ;;    `(rpm-spec-doc-face ((t (:foreground ,zenburn-green))))
     ;;    `(rpm-spec-ghost-face ((t (:foreground ,zenburn-red))))
     ;;    `(rpm-spec-macro-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(rpm-spec-obsolete-tag-face ((t (:foreground ,zenburn-red))))
     ;;    `(rpm-spec-package-face ((t (:foreground ,zenburn-red))))
     ;;    `(rpm-spec-section-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(rpm-spec-tag-face ((t (:foreground ,zenburn-blue))))
     ;;    `(rpm-spec-var-face ((t (:foreground ,zenburn-red))))
     ;; ;;;;; rst-mode
     ;;    `(rst-level-1-face ((t (:foreground ,zenburn-orange))))
     ;;    `(rst-level-2-face ((t (:foreground ,zenburn-green+1))))
     ;;    `(rst-level-3-face ((t (:foreground ,zenburn-blue-1))))
     ;;    `(rst-level-4-face ((t (:foreground ,zenburn-yellow-2))))
     ;;    `(rst-level-5-face ((t (:foreground ,zenburn-cyan))))
     ;;    `(rst-level-6-face ((t (:foreground ,zenburn-green-2))))
     ;; ;;;;; selectrum
     ;;    `(selectrum-current-candidate ((t (:foreground ,zenburn-yellow :weight bold :underline t))))
     ;;    `(selectrum-primary-highlight ((t (:background ,zenburn-green-2))))
     ;;    `(selectrum-secondary-highlight ((t (:background ,zenburn-green))))
     ;; ;;;;; sh-mode
     ;;    `(sh-heredoc     ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(sh-quoted-exec ((t (:foreground ,zenburn-red))))
     ;; ;;;;; show-paren
     ;;    `(show-paren-mismatch ((t (:foreground ,zenburn-red+1 :background ,zenburn-bg+3 :weight bold))))
     ;;    `(show-paren-match ((t (:foreground ,zenburn-fg :background ,zenburn-bg+3 :weight bold))))
     ;; ;;;;; smart-mode-line
     ;;    ;; use (setq sml/theme nil) to enable Zenburn for sml
     ;;    `(sml/global ((,class (:foreground ,zenburn-fg :weight bold))))
     ;;    `(sml/modes ((,class (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(sml/minor-modes ((,class (:foreground ,zenburn-fg-1 :weight bold))))
     ;;    `(sml/filename ((,class (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(sml/line-number ((,class (:foreground ,zenburn-blue :weight bold))))
     ;;    `(sml/col-number ((,class (:foreground ,zenburn-blue+1 :weight bold))))
     ;;    `(sml/position-percentage ((,class (:foreground ,zenburn-blue-1 :weight bold))))
     ;;    `(sml/prefix ((,class (:foreground ,zenburn-orange))))
     ;;    `(sml/git ((,class (:foreground ,zenburn-green+3))))
     ;;    `(sml/process ((,class (:weight bold))))
     ;;    `(sml/sudo ((,class  (:foreground ,zenburn-orange :weight bold))))
     ;;    `(sml/read-only ((,class (:foreground ,zenburn-red-2))))
     ;;    `(sml/outside-modified ((,class (:foreground ,zenburn-orange))))
     ;;    `(sml/modified ((,class (:foreground ,zenburn-red))))
     ;;    `(sml/vc-edited ((,class (:foreground ,zenburn-green+2))))
     ;;    `(sml/charging ((,class (:foreground ,zenburn-green+4))))
     ;;    `(sml/discharging ((,class (:foreground ,zenburn-red+1))))
     ;; ;;;;; smartparens
     ;;    `(sp-show-pair-mismatch-face ((t (:foreground ,zenburn-red+1 :background ,zenburn-bg+3 :weight bold))))
     ;;    `(sp-show-pair-match-face ((t (:background ,zenburn-bg+3 :weight bold))))
     ;; ;;;;; sml-mode-line
     ;;    '(sml-modeline-end-face ((t :inherit default :width condensed)))
     ;; ;;;;; SLIME
     ;;    `(slime-repl-output-face ((t (:foreground ,zenburn-red))))
     ;;    `(slime-repl-inputed-output-face ((t (:foreground ,zenburn-green))))
     ;;    `(slime-error-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-red)))
     ;;       (t
     ;;        (:underline ,zenburn-red))))
     ;;    `(slime-warning-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-orange)))
     ;;       (t
     ;;        (:underline ,zenburn-orange))))
     ;;    `(slime-style-warning-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-yellow)))
     ;;       (t
     ;;        (:underline ,zenburn-yellow))))
     ;;    `(slime-note-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-green)))
     ;;       (t
     ;;        (:underline ,zenburn-green))))
     ;;    `(slime-highlight-face ((t (:inherit highlight))))
     ;; ;;;;; SLY
     ;;    `(sly-mrepl-output-face ((t (:foreground ,zenburn-red))))
     ;;    `(sly-error-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-red)))
     ;;       (t
     ;;        (:underline ,zenburn-red))))
     ;;    `(sly-warning-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-orange)))
     ;;       (t
     ;;        (:underline ,zenburn-orange))))
     ;;    `(sly-style-warning-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-yellow)))
     ;;       (t
     ;;        (:underline ,zenburn-yellow))))
     ;;    `(sly-note-face
     ;;      ((((supports :underline (:style wave)))
     ;;        (:underline (:style wave :color ,zenburn-green)))
     ;;       (t
     ;;        (:underline ,zenburn-green))))
     ;;    `(sly-stickers-placed-face ((t (:foreground ,zenburn-fg :background ,zenburn-bg+3))))
     ;; ;;;;; solaire
     ;;    `(solaire-default-face ((t (:inherit default :background ,zenburn-bg-08))))
     ;;    `(solaire-minibuffer-face ((t (:inherit default :background ,zenburn-bg-08))))
     ;;    `(solaire-hl-line-face ((t (:inherit hl-line :background ,zenburn-bg))))
     ;;    `(solaire-org-hide-face ((t (:inherit org-hide :background ,zenburn-bg-08))))
     ;; ;;;;; speedbar
     ;;    `(speedbar-button-face ((t (:foreground ,zenburn-green+2))))
     ;;    `(speedbar-directory-face ((t (:foreground ,zenburn-cyan))))
     ;;    `(speedbar-file-face ((t (:foreground ,zenburn-fg))))
     ;;    `(speedbar-highlight-face ((t (:foreground ,zenburn-bg :background ,zenburn-green+2))))
     ;;    `(speedbar-selected-face ((t (:foreground ,zenburn-red))))
     ;;    `(speedbar-separator-face ((t (:foreground ,zenburn-bg :background ,zenburn-blue-1))))
     ;;    `(speedbar-tag-face ((t (:foreground ,zenburn-yellow))))
     ;; ;;;;; swiper
     ;;    `(swiper-line-face ((t (:underline t))))
     ;; ;;;;; sx
     ;;    `(sx-custom-button
     ;;      ((t (:background ,zenburn-fg :foreground ,zenburn-bg-1
     ;;                       :box (:line-width 3 :style released-button) :height 0.9))))
     ;;    `(sx-question-list-answers
     ;;      ((t (:foreground ,zenburn-green+3
     ;;                       :height 1.0 :inherit sx-question-list-parent))))
     ;;    `(sx-question-mode-accepted
     ;;      ((t (:foreground ,zenburn-green+3
     ;;                       :height 1.3 :inherit sx-question-mode-title))))
     ;;    '(sx-question-mode-content-face ((t (:inherit highlight))))
     ;;    `(sx-question-mode-kbd-tag
     ;;      ((t (:box (:color ,zenburn-bg-1 :line-width 3 :style released-button)
     ;;                :height 0.9 :weight semi-bold))))
     ;; ;;;;; tabbar
     ;;    `(tabbar-button ((t (:foreground ,zenburn-fg
     ;;                                     :background ,zenburn-bg))))
     ;;    `(tabbar-selected ((t (:foreground ,zenburn-fg
     ;;                                       :background ,zenburn-bg
     ;;                                       :box (:line-width -1 :style pressed-button)))))
     ;;    `(tabbar-unselected ((t (:foreground ,zenburn-fg
     ;;                                         :background ,zenburn-bg+1
     ;;                                         :box (:line-width -1 :style released-button)))))
     ;; ;;;;; tab-bar
     ;;    `(tab-bar ((t (:background ,zenburn-bg+1))))
     ;;    `(tab-bar-tab ((t (:foreground ,zenburn-fg
     ;;                                   :background ,zenburn-bg
     ;;                                   :weight bold
     ;;                                   :box (:line-width -1 :style released-button)))))
     ;;    `(tab-bar-tab-inactive ((t (:foreground ,zenburn-fg
     ;;                                            :background ,zenburn-bg+1
     ;;                                            :box (:line-width -1 :style released-button)))))
     ;; ;;;;; tab-line
     ;;    `(tab-line ((t (:background ,zenburn-bg+1))))
     ;;    `(tab-line-tab ((t (:foreground ,zenburn-fg
     ;;                                   :background ,zenburn-bg
     ;;                                   :weight bold
     ;;                                   :box (:line-width -1 :style released-button)))))
     ;;    `(tab-line-tab-inactive ((t (:foreground ,zenburn-fg
     ;;                                            :background ,zenburn-bg+1
     ;;                                            :box (:line-width -1 :style released-button)))))
     ;;    `(tab-line-tab-current ((t (:foreground ,zenburn-fg
     ;;                                            :background ,zenburn-bg+1
     ;;                                            :box (:line-width -1 :style pressed-button)))))
     ;; ;;;;; term
     ;;    `(term-color-black ((t (:foreground ,zenburn-bg
     ;;                                        :background ,zenburn-bg-1))))
     ;;    `(term-color-red ((t (:foreground ,zenburn-red-2
     ;;                                      :background ,zenburn-red-4))))
     ;;    `(term-color-green ((t (:foreground ,zenburn-green
     ;;                                        :background ,zenburn-green+2))))
     ;;    `(term-color-yellow ((t (:foreground ,zenburn-orange
     ;;                                         :background ,zenburn-yellow))))
     ;;    `(term-color-blue ((t (:foreground ,zenburn-blue-1
     ;;                                       :background ,zenburn-blue-4))))
     ;;    `(term-color-magenta ((t (:foreground ,zenburn-magenta
     ;;                                          :background ,zenburn-red))))
     ;;    `(term-color-cyan ((t (:foreground ,zenburn-cyan
     ;;                                       :background ,zenburn-blue))))
     ;;    `(term-color-white ((t (:foreground ,zenburn-fg
     ;;                                        :background ,zenburn-fg-1))))
     ;;    '(term-default-fg-color ((t (:inherit term-color-white))))
     ;;    '(term-default-bg-color ((t (:inherit term-color-black))))
     ;; ;;;;; undo-tree
     ;;    `(undo-tree-visualizer-active-branch-face ((t (:foreground ,zenburn-fg+1 :weight bold))))
     ;;    `(undo-tree-visualizer-current-face ((t (:foreground ,zenburn-red-1 :weight bold))))
     ;;    `(undo-tree-visualizer-default-face ((t (:foreground ,zenburn-fg))))
     ;;    `(undo-tree-visualizer-register-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(undo-tree-visualizer-unmodified-face ((t (:foreground ,zenburn-cyan))))
     ;; ;;;;; vertico
     `(vertico-current ((t (:foreground ,mawce-vertico-current-fg :weight bold :underline t))))
     ;; ;;;;; visual-regexp
     ;;    `(vr/group-0 ((t (:foreground ,zenburn-bg :background ,zenburn-green :weight bold))))
     ;;    `(vr/group-1 ((t (:foreground ,zenburn-bg :background ,zenburn-orange :weight bold))))
     ;;    `(vr/group-2 ((t (:foreground ,zenburn-bg :background ,zenburn-blue :weight bold))))
     ;;    `(vr/match-0 ((t (:inherit isearch))))
     ;;    `(vr/match-1 ((t (:foreground ,zenburn-yellow-2 :background ,zenburn-bg-1 :weight bold))))
     ;;    `(vr/match-separator-face ((t (:foreground ,zenburn-red :weight bold))))
     ;; ;;;;; volatile-highlights
     ;;    `(vhl/default-face ((t (:background ,zenburn-bg-05))))
     ;; ;;;;; web-mode
     ;;    `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
     ;;    `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
     ;;    `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
     ;;    `(web-mode-css-at-rule-face ((t (:foreground ,zenburn-orange ))))
     ;;    `(web-mode-css-prop-face ((t (:foreground ,zenburn-orange))))
     ;;    `(web-mode-css-pseudo-class-face ((t (:foreground ,zenburn-green+3 :weight bold))))
     ;;    `(web-mode-css-rule-face ((t (:foreground ,zenburn-blue))))
     ;;    `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
     ;;    `(web-mode-folded-face ((t (:underline t))))
     ;;    `(web-mode-function-name-face ((t (:foreground ,zenburn-blue))))
     ;;    `(web-mode-html-attr-name-face ((t (:foreground ,zenburn-orange))))
     ;;    `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
     ;;    `(web-mode-html-tag-face ((t (:foreground ,zenburn-cyan))))
     ;;    `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
     ;;    `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
     ;;    `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
     ;;    `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
     ;;    `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
     ;;    `(web-mode-server-background-face ((t (:background ,zenburn-bg))))
     ;;    `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
     ;;    `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
     ;;    `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
     ;;    `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
     ;;    `(web-mode-whitespaces-face ((t (:background ,zenburn-red))))
     ;; ;;;;; whitespace-mode
     ;;    `(whitespace-space ((t (:background ,zenburn-bg+1 :foreground ,zenburn-bg+1))))
     ;;    `(whitespace-hspace ((t (:background ,zenburn-bg+1 :foreground ,zenburn-bg+1))))
     ;;    `(whitespace-tab ((t (:background ,zenburn-red-1))))
     ;;    `(whitespace-newline ((t (:foreground ,zenburn-bg+1))))
     ;;    `(whitespace-trailing ((t (:background ,zenburn-red))))
     ;;    `(whitespace-line ((t (:background ,zenburn-bg :foreground ,zenburn-magenta))))
     ;;    `(whitespace-space-before-tab ((t (:background ,zenburn-orange :foreground ,zenburn-orange))))
     ;;    `(whitespace-indentation ((t (:background ,zenburn-yellow :foreground ,zenburn-red))))
     ;;    `(whitespace-empty ((t (:background ,zenburn-yellow))))
     ;;    `(whitespace-space-after-tab ((t (:background ,zenburn-yellow :foreground ,zenburn-red))))
     ;; ;;;;; wanderlust
     ;;    `(wl-highlight-folder-few-face ((t (:foreground ,zenburn-red-2))))
     ;;    `(wl-highlight-folder-many-face ((t (:foreground ,zenburn-red-1))))
     ;;    `(wl-highlight-folder-path-face ((t (:foreground ,zenburn-orange))))
     ;;    `(wl-highlight-folder-unread-face ((t (:foreground ,zenburn-blue))))
     ;;    `(wl-highlight-folder-zero-face ((t (:foreground ,zenburn-fg))))
     ;;    `(wl-highlight-folder-unknown-face ((t (:foreground ,zenburn-blue))))
     ;;    `(wl-highlight-message-citation-header ((t (:foreground ,zenburn-red-1))))
     ;;    `(wl-highlight-message-cited-text-1 ((t (:foreground ,zenburn-red))))
     ;;    `(wl-highlight-message-cited-text-2 ((t (:foreground ,zenburn-green+2))))
     ;;    `(wl-highlight-message-cited-text-3 ((t (:foreground ,zenburn-blue))))
     ;;    `(wl-highlight-message-cited-text-4 ((t (:foreground ,zenburn-blue+1))))
     ;;    `(wl-highlight-message-header-contents-face ((t (:foreground ,zenburn-green))))
     ;;    `(wl-highlight-message-headers-face ((t (:foreground ,zenburn-red+1))))
     ;;    `(wl-highlight-message-important-header-contents ((t (:foreground ,zenburn-green+2))))
     ;;    `(wl-highlight-message-header-contents ((t (:foreground ,zenburn-green+1))))
     ;;    `(wl-highlight-message-important-header-contents2 ((t (:foreground ,zenburn-green+2))))
     ;;    `(wl-highlight-message-signature ((t (:foreground ,zenburn-green))))
     ;;    `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,zenburn-fg))))
     ;;    `(wl-highlight-summary-answered-face ((t (:foreground ,zenburn-blue))))
     ;;    `(wl-highlight-summary-disposed-face ((t (:foreground ,zenburn-fg
     ;;                                                          :slant italic))))
     ;;    `(wl-highlight-summary-new-face ((t (:foreground ,zenburn-blue))))
     ;;    `(wl-highlight-summary-normal-face ((t (:foreground ,zenburn-fg))))
     ;;    `(wl-highlight-summary-thread-top-face ((t (:foreground ,zenburn-yellow))))
     ;;    `(wl-highlight-thread-indent-face ((t (:foreground ,zenburn-magenta))))
     ;;    `(wl-highlight-summary-refiled-face ((t (:foreground ,zenburn-fg))))
     ;;    `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
     ;; ;;;;; which-func-mode
     ;;    `(which-func ((t (:foreground ,zenburn-green+4))))
     ;; ;;;;; xcscope
     ;;    `(cscope-file-face ((t (:foreground ,zenburn-yellow :weight bold))))
     ;;    `(cscope-function-face ((t (:foreground ,zenburn-cyan :weight bold))))
     ;;    `(cscope-line-number-face ((t (:foreground ,zenburn-red :weight bold))))
     ;;    `(cscope-mouse-face ((t (:foreground ,zenburn-bg :background ,zenburn-blue+1))))
     ;;    `(cscope-separator-face ((t (:foreground ,zenburn-red :weight bold
     ;;                                             :underline t :overline t))))
     ;; ;;;;; yascroll
     ;;    `(yascroll:thumb-text-area ((t (:background ,zenburn-bg-1))))
     ;;    `(yascroll:thumb-fringe ((t (:background ,zenburn-bg-1 :foreground ,zenburn-bg-1))))
     )))

(mawce-theme-update)

;;;;; Helper Function
(defun mawce-show-pallette (&rest background)
  "Provide simple output of all pallet colors into the current buffer.  Configurable BACKGROUND color available."
  (interactive "sBackground HEX: ")
  (cl-loop for m in mawce-colors-pallete-alist
           do
           (let* ((max-name-length (cl-reduce (lambda (x y)
                                                (let ()
                                                  (if (> x (length (car y)))
                                                      x
                                                    (length (car y)))))
                                              mawce-colors-pallete-alist
                                              :initial-value 0))
                  (format-string (format "%%-%ds %%s" max-name-length))
                  (current-color (car m))
                  (current-fg (cdr m))
                  (base-string (format "%s %s " current-fg "the quick brown fox jumps over the lazy dog 0123456789           \n") )
                  (face (if (string= ""  (car  background))
                            `(:foreground ,current-fg)
                          `(:foreground ,current-fg :background ,(car  background)))
                        )
                  (current-string (format format-string
                                          current-color
                                          base-string))
                  )
             (put-text-property (+ 1  max-name-length)
                                (length current-string)
                                'face face
                                current-string)
             (put-text-property (- (length current-string) 10 )
                                (length current-string)
                                'face `(:background ,current-fg)
                                current-string
                                )
             (insert current-string))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'mawce)
;;; mawce-theme.el ends here
