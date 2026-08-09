with Ada.Text_IO;

use Ada.Text_IO;

with Ada.Strings.Unbounded;

use Ada.Strings.Unbounded;

with Ada.Command_Line;

use Ada.Command_Line;

procedure Channel_Dial is

   type Channel_Record is record

      Channel_Name       : Unbounded_String;

      Platform           : Unbounded_String;

      Topic              : Unbounded_String;

      Language           : Unbounded_String;

      Region             : Unbounded_String;

      Description        : Unbounded_String;

      Date_Last_Verified : Unbounded_String;

   end record;

   GMRC : constant Channel_Record :=

     (Channel_Name       => To_Unbounded_String ("GMRC"),

      Platform           => To_Unbounded_String ("Zello"),

      Topic              => To_Unbounded_String ("Ham radio"),

      Language           => To_Unbounded_String ("English"),

      Region             => To_Unbounded_String ("Global"),

      Description        => To_Unbounded_String

        ("Global ham radio community"),

      Date_Last_Verified => To_Unbounded_String ("2026-08-08"));

   procedure Display_Channel (Channel : Channel_Record) is

   begin

      Put_Line ("Channel: " & To_String (Channel.Channel_Name));

      Put_Line ("Platform: " & To_String (Channel.Platform));

      Put_Line ("Topic: " & To_String (Channel.Topic));

      Put_Line ("Language: " & To_String (Channel.Language));

      Put_Line ("Region: " & To_String (Channel.Region));

      Put_Line ("Description: " & To_String (Channel.Description));

      Put_Line

        ("Date last verified: " &

         To_String (Channel.Date_Last_Verified));

   end Display_Channel;

begin

   if Argument_Count = 0 then

      Put_Line ("ChannelDial");

   elsif Argument (1) = "list" then

      Display_Channel (GMRC);

   end if;

end Channel_Dial;

