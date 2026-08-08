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

        ("A Zello channel for amateur radio discussion."),

      Date_Last_Verified => To_Unbounded_String ("2026-08-08"));

   --  Lesson 3: Build a collection of records using an Ada array.

   type Channel_Array is array (Positive range <>) of Channel_Record;

   Channels : constant Channel_Array :=

     (1 => GMRC);

begin

   --  Lesson 4: Read a Unix-style subcommand from the command line.

   if Argument_Count = 0 then

      Put_Line ("Usage: channel_dial list");

   elsif Argument (1) = "list" then

      for Channel of Channels loop

         Put_Line ("Channel: " & To_String (Channel.Channel_Name));

         Put_Line ("Platform: " & To_String (Channel.Platform));

         Put_Line ("Topic: " & To_String (Channel.Topic));

         Put_Line ("Language: " & To_String (Channel.Language));

         Put_Line ("Region: " & To_String (Channel.Region));

         Put_Line

           ("Description: " & To_String (Channel.Description));

         Put_Line

           ("Last verified: " & To_String (Channel.Date_Last_Verified));

      end loop;

   else

      Put_Line ("Unknown command: " & Argument (1));

   end if;

end Channel_Dial;

