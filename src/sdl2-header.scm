;;; Copyright (c) 2013-2014 by Álvaro Castro Castilla. All Rights Reserved.
;;; SDL2 Foreign Function Interface

(c-declare "#include \"SDL.h\"")
;; Include this file explicitly for the SDL_SysWMinfo declaration
(c-declare "#include \"SDL_syswm.h\"")

;; We need to declare these structs, otherwise we get an
;; incomplete type 'struct SDL_DisplayMode' error
(c-declare #<<end-of-string
struct SDL_DisplayMode
{
    Uint32 format;              /**< pixel format */
    int w;                      /**< width */
    int h;                      /**< height */
    int refresh_rate;           /**< refresh rate (or zero for unspecified) */
    void *driverdata;           /**< driver-specific data, initialize to 0 */
};
end-of-string
)

;;------------------------------------------------------------------------------
;;!! Types

(c-define-type SDL_AudioFormat unsigned-int16)
(c-define-type SDL_AudioCallback (function (void* unsigned-int8* int) void))
(c-define-type SDL_FingerID int64)
(c-define-type SDL_GestureID int64)
(c-define-type SDL_JoystickID int32)
(c-define-type SDL_Keycode int) ; enums are ints in C
(c-define-type SDL_TouchID int64)
(c-define-type SDL_Scancode int) ; enums are ints in C

(c-define-type* (struct SDL_AudioCVT))
(c-define-type* (struct SDL_AudioSpec))
(c-define-type* (struct SDL_Color))
(c-define-type* (struct SDL_ControllerAxisEvent))
(c-define-type* (struct SDL_ControllerButtonEvent))
(c-define-type* (struct SDL_ControllerDeviceEvent))
(c-define-type* (struct SDL_DisplayMode))
(c-define-type* (struct SDL_DollarGestureEvent))
(c-define-type* (struct SDL_DropEvent))
(c-define-type* (union SDL_Event))
(c-define-type* (struct SDL_Finger))
(c-define-type* (struct SDL_HapticCondition))
(c-define-type* (struct SDL_HapticConstant))
(c-define-type* (struct SDL_HapticCustom))
(c-define-type* (struct SDL_HapticDirection))
(c-define-type* (union SDL_HapticEffect))
(c-define-type* (struct SDL_HapticLeftRight))
(c-define-type* (struct SDL_HapticPeriodic))
(c-define-type* (struct SDL_HapticRamp))
(c-define-type* (struct SDL_JoyAxisEvent))
(c-define-type* (struct SDL_JoyBallEvent))
(c-define-type* (struct SDL_JoyButtonEvent))
(c-define-type* (struct SDL_JoyDeviceEvent))
(c-define-type* (struct SDL_JoyHatEvent))
(c-define-type* (struct SDL_KeyboardEvent))
(c-define-type* (struct SDL_Keysym))
(c-define-type* (struct SDL_MouseButtonEvent))
(c-define-type* (struct SDL_MouseMotionEvent))
(c-define-type* (struct SDL_MouseWheelEvent))
(c-define-type* (struct SDL_MultiGestureEvent))
(c-define-type* (struct SDL_Palette))
(c-define-type* (struct SDL_PixelFormat))
(c-define-type* (struct SDL_Point))
(c-define-type* (struct SDL_QuitEvent))
;; According to SDL2 documentation, applications shouldn't have to care
;; about the internals of this structure, so we keep it opaque
(c-define-type SDL_RWops (struct "SDL_RWops"))
(c-define-type* (struct SDL_Rect))
(c-define-type* (struct SDL_RendererInfo))
(c-define-type* (struct SDL_Surface))
(c-define-type* (struct SDL_SysWMEvent))
(c-define-type* (struct SDL_SysWMinfo))
(c-define-type* (struct SDL_SysWMmsg))
(c-define-type* (struct SDL_TextEditingEvent))
(c-define-type* (struct SDL_TextInputEvent))
(c-define-type* (struct SDL_TouchFingerEvent))
(c-define-type* (struct SDL_UserEvent))
(c-define-type* (struct SDL_WindowEvent))
(c-define-type* (struct SDL_assert_data))
(c-define-type* (struct SDL_atomic_t))
(c-define-type* (struct SDL_version))
