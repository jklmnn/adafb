package body AdaFB.SDL with
   SPARK_Mode
is

   use type System.Address;

   Screen_Width  : Natural;
   Screen_Height : Natural;

   procedure Initialize (Width  : Natural;
                         Height : Natural)
   is
   begin
      Screen_Width  := Width;
      Screen_Height := Height;
      SDL_Initialize (Width, Height);
   end Initialize;

   function Initialized return Boolean is
      (SDL_Addr /= System.Null_Address);

   procedure Render (Data   : Frame;
                     X      : Natural;
                     Y      : Natural;
                     Width  : Natural;
                     Height : Natural)
   is
      Screen : Frame (1 .. Screen_Width * Screen_Height) with
         Import,
         Address => SDL_Addr;
   begin
      if Height = 0 or Width = 0 then
         SDL_Render (Screen_Width);
         return;
      end if;
      for L in Natural range 0 .. Height - 1 loop
         for C in Natural range 0 .. Width - 1 loop
            Screen (Screen'First + (Y + L) * Screen_Width + (X + C)) :=
               Data (Data'First + L * Width + C);
         end loop;
      end loop;
      SDL_Render (Screen_Width);
   end Render;

end AdaFB.SDL;
