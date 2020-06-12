private with System;

package AdaFB.SDL with
   SPARK_Mode
is

   type Color_Value is mod 2 ** 8 with
      Object_Size => 8;

   type ARGB_8888 is record
      Alpha : Color_Value;
      Red   : Color_Value;
      Green : Color_Value;
      Blue  : Color_Value;
   end record with
      Size => 32;

   type Frame is array (Natural range <>) of ARGB_8888 with
      Pack;

   procedure Initialize (Width  : Natural;
                         Height : Natural);

   function Initialized return Boolean;

   procedure Render (Data   : Frame;
                     X      : Natural;
                     Y      : Natural;
                     Width  : Natural;
                     Height : Natural);

   procedure Finalize with
      Import,
      Convention    => C,
      External_Name => "finalize";

private

   procedure SDL_Initialize (Width  : Natural;
                             Height : Natural) with
      Import,
      Convention    => C,
      External_Name => "initialize";

   function SDL_Addr return System.Address with
      Import,
      Convention    => C,
      External_Name => "addr";

   procedure SDL_Render (Width : Natural) with
      Import,
      Convention    => C,
      External_Name => "render";

end AdaFB.SDL;
