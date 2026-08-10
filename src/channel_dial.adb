-- Lesson 15: Add a Help Command

--

-- This lesson adds a help command and a Display_Help procedure.

-- Running ChannelDial without a command also displays the same help.

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

   -- The new procedure keeps the help text in one place.

   -- Both the help command and a command line with no arguments

   -- can use the same procedure.

   procedure Display_Help is

   begin

      Put_Line ("ChannelDial");

      New_Line;

      Put_Line ("Commands:");

      Put_Line ("  list");

      Put_Line ("  find CHANNEL");

      Put_Line ("  help");

   end Display_Help;

begin

   if Argument_Count = 0 then

      Display_Help;

   elsif Argument (1) = "list" then

      if Argument_Count > 1 then

         Put_Line ("Too many arguments.");

         Put_Line ("Usage: channeldial list");

      else

         declare

            Channel_File : File_Type;

            Channel      : Channel_Record;

         begin

            Open (Channel_File, In_File, "channels.txt");

            while not End_Of_File (Channel_File) loop

               Channel.Channel_Name :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Platform :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Topic :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Language :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Region :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Description :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Date_Last_Verified :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Display_Channel (Channel);

            end loop;

            Close (Channel_File);

         end;

      end if;

   elsif Argument (1) = "find" then

      if Argument_Count < 2 then

         Put_Line ("Missing channel name.");

         Put_Line ("Usage: channeldial find CHANNEL");

      elsif Argument_Count > 2 then

         Put_Line ("Too many arguments.");

         Put_Line ("Usage: channeldial find CHANNEL");

      else

         declare

            Channel_File : File_Type;

            Channel      : Channel_Record;

            Found        : Boolean := False;

         begin

            Open (Channel_File, In_File, "channels.txt");

            while not End_Of_File (Channel_File) loop

               Channel.Channel_Name :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Platform :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Topic :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Language :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Region :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Description :=

                 To_Unbounded_String (Get_Line (Channel_File));

               Channel.Date_Last_Verified :=

                 To_Unbounded_String (Get_Line (Channel_File));

               if To_String (Channel.Channel_Name) = Argument (2) then

                  Display_Channel (Channel);

                  Found := True;

               end if;

            end loop;

            Close (Channel_File);

            if not Found then

               Put_Line ("Channel not found: " & Argument (2));

            end if;

         end;

      end if;

   elsif Argument (1) = "help" then

      -- The help command takes no additional arguments.

      if Argument_Count > 1 then

         Put_Line ("Too many arguments.");

         Put_Line ("Usage: channeldial help");

      else

         Display_Help;

      end if;

   else

      Put_Line ("Unknown command: " & Argument (1));

   end if;

end Channel_Dial;

