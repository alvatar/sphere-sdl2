;;; Copyright (c) 2013 by Álvaro Castro Castilla. All Rights Reserved.
;;; SDL2 Foreign Function Interface

(c-declare "#include \"SDL.h\"")

(c-define-type SDL_BlitMap* (pointer "SDL_BlitMap"))
(c-define-type SDL_bool "SDL_bool")
(c-define-type SDL_EventType int)
(c-define-type SDL_BlendMode int)
(c-define-type SDL_GLattr int)
(c-define-type SDL_GLContext (pointer void))
(c-define-type SDL_PixelFormat*  (pointer "SDL_PixelFormat"))
(c-define-type SDL_Window* (pointer "SDL_Window"))
(c-define-type SDL_WindowEventID int)
(c-define-type SDL_WindowFlags int)
(c-define-type SDL_Scancode int)
(c-define-type SDL_Keycode int)

(c-define-type* (struct SDL_Color))

(c-define-type* (struct SDL_WindowEvent))
(c-define-type* (struct SDL_Keysym))
(c-define-type* (struct SDL_KeyboardEvent))
(c-define-type* (struct SDL_MouseButtonEvent))
(c-define-type* (union SDL_Event))

(c-define-type* (struct SDL_Rect))
(c-define-type* (struct SDL_Surface))
