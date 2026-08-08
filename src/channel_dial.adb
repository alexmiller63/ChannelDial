with Ada.Text_IO;

use Ada.Text_IO;

with Ada.Strings.Unbounded;

use Ada.Strings.Unbounded;

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

        ("A Zello channel for amateur radio discussion."),

      Date_Last_Verified => To_Unbounded_String ("2026-08-08"));

begin

   Put_Line ("ChannelDial");

   Put_Line ("Channel: " & To_String (GMRC.Channel_Name));

   Put_Line ("Platform: " & To_String (GMRC.Platform));

   Put_Line ("Topic: " & To_String (GMRC.Topic));

   Put_Line ("Language: " & To_String (GMRC.Language));

   Put_Line ("Region: " & To_String (GMRC.Region));

   Put_Line ("Description: " & To_String (GMRC.Description));

   Put_Line ("Last verified: " & To_String (GMRC.Date_Last_Verified));

end Channel_Dial;

