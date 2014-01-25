;;; Copyright (c) 2013-2014 by Álvaro Castro Castilla. All Rights Reserved.
;;; SDL2 Foreign Function Interface


(c-define-constants
 ;; Hints
;; SDL_HINT_FRAMEBUFFER_ACCELERATION
 ;;SDL_HINT_IDLE_TIMER_DISABLED
 ;; SDL_HINT_ORIENTATIONS
 ;; SDL_HINT_RENDER_DRIVER
 ;; SDL_HINT_RENDER_OPENGL_SHADERS
 ;; SDL_HINT_RENDER_SCALE_QUALITY
 ;; SDL_HINT_RENDER_VSYNC

 SDL_AUDIO_MASK_BITSIZE
 SDL_AUDIO_MASK_DATATYPE
 SDL_AUDIO_MASK_ENDIAN
 SDL_AUDIO_MASK_SIGNED
 
 )

(c-define-struct SDL_AudioCVT
                 (needed int)
                 (src_format SDL_AudioFormat)
                 (dst_format SDL_AudioFormat)
                 (rate_incr double)
                 (buf unsigned-int8)
                 (len int)
                 (len_cvt int)
                 (len_mult int)
                 (len_ratio double))

(c-define-struct SDL_AudioSpec
                 (freq int)
                 (format SDL_AudioFormat)
                 (channels unsigned-int8)
                 (silence unsigned-int8)
                 (samples unsigned-int16)
                 (size unsigned-int32)
                 (callback SDL_AudioCallback)
                 (userdata void*))

(c-define-struct SDL_Color
                 (r unsigned-int8)
                 (g unsigned-int8)
                 (b unsigned-int8))

(c-define-struct SDL_ControllerAxisEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (which SDL_JoystickID)
                 (axis unsigned-int8)
                 (value int16))

(c-define-struct SDL_ControllerButtonEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (which SDL_JoystickID)
                 (button unsigned-int8)
                 (state unsigned-int8))

(c-define-struct SDL_ControllerDeviceEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (which int32))

(c-define-struct SDL_DisplayMode
                 (format unsigned-int32)
                 (w int)
                 (h int)
                 (refresh_rate int)
                 (driverdata void*))

(c-define-struct SDL_DollarGestureEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (touchId SDL_TouchID)
                 (gestureId SDL_GestureID)
                 (numFingers unsigned-int32)
                 (error float)
                 (x float)
                 (y float))

(c-define-struct SDL_DropEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (file nonnull-char-string))

#;
(c-define-union SDL_Event
                (type unsigned-int32)
                (window SDL_WindowEvent)
                (key SDL_KeyboardEvent)
                (edit SDL_TextEditingEvent)
                (text SDL_TextInputEvent)
                (motion SDL_MouseMotionEvent)
                (button SDL_MouseButtonEvent)
                (wheel SDL_MouseWheelEvent)
                (jaxis SDL_JoyAxisEvent)
                (jball SDL_JoyBallEvent)
                (jhat SDL_HatEvent)
                (jbutton SDL_JoyButtonEvent)
                (jdevice SDL_JoyDeviceEvent)
                (caxis SDL_ControllerAxisEvent)
                (cbutton SDL_ControllerButtonEvent)
                (cdevine SDL_ControllerDeviceEvent)
                (quit SDL_QuitEvent)
                (user SDL_UserEvent)
                (syswm SDL_SysWMEvent)
                (tfinger SDL_TouchFingerEvent)
                (mgesture SDL_MultiGestureEvent)
                (dgesture SDL_DollarGestureEvent)
                (drop SDL_DropEvent))

(c-define-struct SDL_Finger
                 (id SDL_FingerID)
                 (x float)
                 (y float)
                 (pressure float))

(c-define-struct SDL_HapticCondition
                 (type unsigned-int16)
                 (length unsigned-int32)
                 (delay unsigned-int16)
                 (button unsigned-int16)
                 (interval unsigned-int16)
                 (right_sat (array unsigned-int16))
                 (left_sat (array unsigned-int16))
                 (right_coeff (array int16))
                 (left_coeff (array int16))
                 (deadband (array unsigned-int16))
                 (center (array int16)))

(c-define-struct SDL_HapticConstant
                 (type unsigned-int16)
                 (direction SDL_HapticDirection)
                 (length unsigned-int32)
                 (delay unsigned-int16)
                 (button unsigned-int16)
                 (interval unsigned-int16)
                 (level int16)
                 (attack_length unsigned-int16)
                 (attack_level unsigned-int16)
                 (fade_length unsigned-int16)
                 (fade_level unsigned-int16))

(c-define-struct SDL_HapticCustom
                 (type unsigned-int16)
                 (direction SDL_HapticDirection)
                 (length unsigned-int32)
                 (delay unsigned-int16)
                 (button unsigned-int16)
                 (interval unsigned-int16)
                 (channels unsigned-int8)
                 (period unsigned-int16)
                 (samples unsigned-int16)
                 (data unsigned-int16*)
                 (attack_length unsigned-int16)
                 (attack_level unsigned-int16)
                 (fade_length unsigned-int16)
                 (fade_level unsigned-int16))

(c-define-struct SDL_HapticDirection
                 (type unsigned-int8)
                 (dir (array int32)))

(c-define-union SDL_HapticEffect
                (constant SDL_HapticConstant)
                (periodic SDL_HapticPeriodic)
                (condition SDL_HapticCondition)
                (ramp SDL_HapticRamp)
                (leftright SDL_HapticLeftRight)
                (custom SDL_HapticCustom))

(c-define-struct SDL_HapticLeftRight
                 (type unsigned-int16)
                 (length unsigned-int32)
                 (large_magnitude unsigned-int16)
                 (small_magnitude unsigned-int16))

(c-define-struct SDL_HapticPeriodic
                 (type unsigned-int16)
                 (direction SDL_HapticDirection)
                 (length unsigned-int32)
                 (delay unsigned-int16)
                 (button unsigned-int16)
                 (interval unsigned-int16)
                 (period unsigned-int16)
                 (magnitude int16)
                 (offset int16)
                 (phase unsigned-int16)
                 (attack_length unsigned-int16)
                 (attack_level unsigned-int16)
                 (fade_length unsigned-int16)
                 (fade_level unsigned-int16))

(c-define-struct SDL_HapticRamp
                 (type unsigned-int16)
                 (direction SDL_HapticDirection)
                 (length unsigned-int32)
                 (delay unsigned-int16)
                 (button unsigned-int16)
                 (interval unsigned-int16)
                 (start int16)
                 (end int16)
                 (attack_length unsigned-int16)
                 (attack_level unsigned-int16)
                 (fade_length unsigned-int16)
                 (fade_level unsigned-int16))


(c-define-struct SDL_JoyAxisEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (which SDL_JoystickID)
                 (axis unsigned-int8)
                 (value int16))

(c-define-struct SDL_JoyBallEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (which SDL_JoystickID)
                 (ball unsigned-int8)
                 (xrel int16)
                 (yrel int16))

(c-define-struct SDL_JoyButtonEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (which SDL_JoystickID)
                 (button unsigned-int8)
                 (state unsigned-int8))

(c-define-struct SDL_JoyDeviceEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (which int32))

(c-define-struct SDL_JoyHatEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (which SDL_JoystickID)
                 (hat unsigned-int8)
                 (value unsigned-int8))

(c-define-struct SDL_KeyboardEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (state unsigned-int8)
                 (repeat unsigned-int8)
                 (keysym SDL_Keysym))

(c-define-struct SDL_Keysym
                 (scancode SDL_Scancode)
                 (sym SDL_Keycode)
                 (mod unsigned-int16))

(c-define-struct SDL_MouseButtonEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (which unsigned-int32)
                 (button unsigned-int8)
                 (state unsigned-int8)
                 ;(clicks unsigned-int8) SDL 2.0.2
                 (x int)
                 (y int))

(c-define-struct SDL_MouseMotionEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (which unsigned-int32)
                 (state unsigned-int32)
                 (x int32)
                 (y int32)
                 (xrel int32)
                 (yrel int32))

(c-define-struct SDL_MouseWheelEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (which unsigned-int32)
                 (x int32)
                 (y int32))

(c-define-struct SDL_MultiGestureEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (touchId SDL_TouchID)
                 (dTheta float)
                 (dDist float)
                 (x float)
                 (y float)
                 (numFingers unsigned-int16))

(c-define-struct SDL_Palette
                 (ncolors int)
                 (colors SDL_Color*))

(c-define-struct SDL_PixelFormat
                 (format unsigned-int32)
                 (palette SDL_Palette*)
                 (BitsPerPixel unsigned-int8)
                 (BytesPerPixel unsigned-int8)
                 (Rmask unsigned-int32)
                 (Gmask unsigned-int32)
                 (Bmask unsigned-int32)
                 (Amask unsigned-int32))

(c-define-struct SDL_Point
                 (x int)
                 (y int))

(c-define-struct SDL_QuitEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32))

;; According to SDL2 documentation, applications shouldn't have to care
;; about the internals of this structure, so we keep it opaque
;; SDL_RWops

(c-define-struct SDL_Rect
                 (x int)
                 (y int)
                 (w int)
                 (h int))

(c-define-struct SDL_RendererInfo
                 (name nonnull-char-string)
                 (flags unsigned-int32)
                 (num_texture_formats unsigned-int32)
                 (texture_formats (array unsigned-int32))
                 (max_texture_width int)
                 (max_texture_height int))

(c-define-struct SDL_Surface
                 (format SDL_PixelFormat*)
                 (w int)
                 (h int)
                 (pitch int)
                 (pixels void*)
                 (userdata void*)
                 (clip_rect SDL_Rect)
                 (refcount int))

(c-define-struct SDL_SysWMEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (msg SDL_SysWMmsg*))

(c-define-struct SDL_SysWMinfo
                 (version SDL_version)
                 (subsystem int))

(c-define-struct SDL_SysWMmsg
                 (version SDL_version)
                 (subsystem int))

(c-define-struct SDL_TextEditingEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (text (array char))
                 (start int32)
                 (length int32))

(c-define-struct SDL_TextInputEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (text (array char)))

(c-define-struct SDL_TouchFingerEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (touchId SDL_TouchID)
                 (fingerId SDL_FingerID)
                 (x float)
                 (y float)
                 (dx float)
                 (dy float)
                 (pressure float))

(c-define-struct SDL_UserEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (code int32)
                 (data1 void*)
                 (data2 void*))

(c-define-struct SDL_WindowEvent
                 (type unsigned-int32)
                 (timestamp unsigned-int32)
                 (windowID unsigned-int32)
                 (event unsigned-int8)
                 (data1 int32)
                 (data2 int32))

(c-define-struct SDL_assert_data
                 (always_ignore int)
                 (trigger_count unsigned-int)
                 (condition nonnull-char-string)
                 (filename nonnull-char-string)
                 (linenum int)
                 (function nonnull-char-string)
                 (next SDL_assert_data*))

;; The type SDL_atomic_t throws an incomplete type error
;; Anyway, should it be used in these bindings?
;; (c-define-struct SDL_atomic_t
;;                  (value int))

(c-define-struct SDL_version
                 (major unsigned-int8)
                 (minor unsigned-int8)
                 (patch unsigned-int8))




;; (define SDL_BlitSurface
;;   (c-lambda (SDL_Surface* SDL_Rect* SDL_Surface* SDL_Rect*) int "SDL_BlitSurface"))

;; (define SDL_CreateWindow
;;   (c-lambda (char-string int int int int unsigned-int32)
;; 	    SDL_Window*
;; 	    "SDL_CreateWindow"))

;; (define SDL_CreateRGBSurfaceFrom
;;   (c-lambda ((pointer void #f) int int int int unsigned-int32 unsigned-int32 unsigned-int32 unsigned-int32)
;;             SDL_Surface*
;;             "SDL_CreateRGBSurfaceFrom"))

;; (define SDL_FreeSurface
;;   (c-lambda (SDL_Surface*) void "SDL_FreeSurface"))

;; (define SDL_GetError
;;   (c-lambda () char-string "SDL_GetError"))

;; (define SDL_GetWindowSurface
;;   (c-lambda (SDL_Window*) SDL_Surface* "SDL_GetWindowSurface"))

;; (define SDL_GetWindowSize
;;   (c-lambda (SDL_Window* (pointer int) (pointer int)) void "SDL_GetWindowSize"))

;; (define SDL_GL_CreateContext
;;   (c-lambda (SDL_Window*) SDL_GLContext "SDL_GL_CreateContext"))

;; (define SDL_Delay
;;   (c-lambda (unsigned-int32) void "SDL_Delay"))

;; (define SDL_DestroyWindow
;;   (c-lambda (SDL_Window*) void "SDL_DestroyWindow"))

;; (define SDL_GetTicks
;;   (c-lambda () unsigned-int32 "SDL_GetTicks"))

;; (define SDL_GetWindowPosition
;;   (c-lambda (SDL_Window* (pointer int) (pointer int)) void
;; 	    "SDL_GetWindowPosition"))

;; (define SDL_GL_DeleteContext
;;   (c-lambda (SDL_GLContext) void "SDL_GL_DeleteContext"))

;; (define SDL_GL_Extension_Supported
;;   (c-lambda (char-string) bool "SDL_GL_ExtensionSupported"))

;; (define SDL_GL_GetAttribute
;;   (c-lambda (SDL_GLattr (pointer int)) int
;;             ;; In this and other functions taking C enums, explicitly casting to the
;;             ;; appropriate enum type is required for compatibility with C++ compilers
;;             ;; (building with these remains untested)
;;             "___result = SDL_GL_GetAttribute((SDL_GLattr)___arg1, (int*)___arg2_voidstar);"))

;; (define SDL_GL_SetAttribute
;;   (c-lambda (SDL_GLattr int) int
;;             "___result = SDL_GL_SetAttribute((SDL_GLattr)___arg1, ___arg2);"))

;; (define SDL_GL_SetSwapInterval
;;   (c-lambda (int) int "SDL_GL_SetSwapInterval"))

;; (define SDL_GL_SwapWindow
;;   (c-lambda (SDL_Window*) void "SDL_GL_SwapWindow"))

;; (define SDL_GetPerformanceCounter
;;   (c-lambda () unsigned-int64 "SDL_GetPerformanceCounter"))

;; (define SDL_GetPerformanceFrequency
;;   (c-lambda () unsigned-int64 "SDL_GetPerformanceFrequency"))

;; (define SDL_Init
;;   (c-lambda (unsigned-int32) int "SDL_Init"))

;; (define SDL_LoadBMP
;;   (c-lambda (char-string) SDL_Surface* "SDL_LoadBMP"))

;; (define SDL_Log
;;   (c-lambda (char-string) void "SDL_Log"))

;; (define SDL_LogCritical
;;   (c-lambda (int char-string) void "SDL_LogCritical"))

;; (define SDL_LogDebug
;;   (c-lambda (int char-string) void "SDL_LogDebug"))

;; (define SDL_LogError
;;   (c-lambda (int char-string) void "SDL_LogError"))

;; (define SDL_LogInfo
;;   (c-lambda (int char-string) void "SDL_LogInfo"))

;; (define SDL_LogMessage
;;   (c-lambda (int int char-string) void "SDL_LogMessage"))

;; ;; TODO
;; ;; (define SDL_LogMessageV
;; ;;   (c-lambda (int int char-string) void "SDL_LogMessageV"))

;; (define SDL_LogSetAllPriority
;;   (c-lambda (int) void "SDL_LogSetAllPriority"))

;; (define SDL_LogVerbose
;;   (c-lambda (int char-string) void "SDL_LogVerbose"))

;; (define SDL_LogWarn
;;   (c-lambda (int char-string) void "SDL_LogWarn"))

;; (define SDL_PixelFormatEnumToMasks
;;   (c-lambda (unsigned-int32
;;              (pointer int)
;;              (pointer unsigned-int32)
;;              (pointer unsigned-int32)
;;              (pointer unsigned-int32)
;;              (pointer unsigned-int32))
;;             bool
;;             "SDL_PixelFormatEnumToMasks"))

;; (define SDL_PollEvent
;;   (c-lambda (SDL_Event*) int "SDL_PollEvent"))

;; (define SDL_Quit
;;   (c-lambda () void "SDL_Quit"))

;; (define SDL_RaiseWindow
;;   (c-lambda (SDL_Window*) void "SDL_RaiseWindow"))

;; (define SDL_SetSurfaceBlendMode
;;   (c-lambda (SDL_Surface* SDL_BlendMode) int "SDL_SetSurfaceBlendMode"))

;; (define SDL_UpdateWindowSurface
;;   (c-lambda (SDL_Window*) int "SDL_UpdateWindowSurface"))

;; (define SDL_WaitEvent
;;   (c-lambda (SDL_Event*) int "SDL_WaitEvent"))
