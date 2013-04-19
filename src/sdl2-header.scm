(c-declare "#include \"SDL.h\"")

(c-define-type SDL_BlitMap* (pointer "SDL_BlitMap"))
(c-define-type SDL_bool "SDL_bool")
(c-define-type SDL_EventType int)
(c-define-type SDL_GLattr int)
(c-define-type SDL_GLContext (pointer void))
(c-define-type SDL_PixelFormat*  (pointer "SDL_PixelFormat"))
(c-define-type SDL_Window* (pointer "SDL_Window"))
(c-define-type SDL_WindowEventID int)
(c-define-type SDL_WindowFlags int)
(c-define-type SDL_Rect "SDL_Rect")
(c-define-type SDL_Rect* (pointer SDL_Rect))
(c-define-type SDL_Scancode int)
(c-define-type SDL_Keycode int)

(build-c-struct SDL_WindowEvent
                (type unsigned-int32 "type" "unsigned int")
                (timestamp unsigned-int32 "timestamp" "unsigned int")
                (windowID unsigned-int32 "windowID" "unsigned int")
                (event unsigned-int8 "event" "unsigned char")
                (data1 int "data1" "int")
                (data2 int "data2" "int"))

(build-c-struct SDL_Keysym
                (scancode SDL_Scancode "scancode" "SDL_Scancode") ; not pointer (implemeted as int)
                (sym SDL_Keycode "sym" "SDL_Keycode") ; not pointer (implemeted as int)
                (mod unsigned-int16 "mod" "unsigned short")
                (unicode unsigned-int32 "unicode" "unsigned int"))

(build-c-struct SDL_KeyboardEvent
                (type unsigned-int32 "type" "unsigned int")
                (timestamp unsigned-int32 "timestamp" "unsigned int")
                (windowID unsigned-int32 "windowID" "unsigned int")
                (state unsigned-int8 "state" "unsigned char")
                (repeat unsigned-int8 "repeat" "unsigned char")
                (keysym SDL_Keysym "keysym" "SDL_Keysym" pointer?: #t))

(build-c-struct SDL_MouseButtonEvent
                (type unsigned-int32 "type" "unsigned int")
                (windowID unsigned-int32 "windowID" "unsigned int")
                (button unsigned-int8 "button" "unsigned char")
                (state unsigned-int8 "state" "unsigned char")
                (x int "x" "int")
                (y int "y" "int"))

(build-c-union SDL_Event
               (type unsigned-int32 "type" "unsigned int")
               (window SDL_WindowEvent "window" "SDL_WindowEvent" pointer?: #t)
               (key SDL_KeyboardEvent "key" "SDL_KeyboardEvent" pointer?: #t)
               (button SDL_MouseButtonEvent "button" "SDL_MouseButtonEvent" pointer?: #t))

(build-c-struct SDL_Surface
                (format SDL_PixelFormat* "format" "SDL_PixelFormat*")
                (w int "w" "int")
                (h int "h" "int")
                (pitch int "pitch" "int")
                (pixels void* "pixels" "void*")
                (userdata void* "userdata" "void*")
                (clip_rect SDL_Rect "clip_rect" "SDL_Rect" pointer?: #t)
                (refcount int "refcount" "int"))
