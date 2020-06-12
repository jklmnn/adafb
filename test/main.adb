
with AdaFB.SDL;

procedure Main
is
begin
   AdaFB.SDL.Initialize (640, 640);
   for I in Natural range 0 .. 15 loop
      for J in Natural range 0 .. 15 loop
         AdaFB.SDL.Render ((1 .. 1600 => (others => AdaFB.SDL.Color_Value (30 + I * J))),
                           J * 40, I * 40, 40, 40);
         delay Duration (0.2);
      end loop;
   end loop;
   AdaFB.SDL.Finalize;
end Main;
