-- Lesson 10: Find One Channel

--

-- Lesson 9 made it possible to read every saved channel.

-- This lesson adds a find command that searches those saved

-- channels for a channel name supplied on the command line.

--

-- The find loop resembles the list loop, but instead of displaying

-- every record, it displays only a record whose name matches.

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

begin

   if Argument_Count = 0 then

      Put_Line ("ChannelDial");

   elsif Argument (1) = "list" then

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

   elsif Argument (1) = "find" and Argument_Count >= 2 then

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

            -- The new idea in this lesson: compare each saved

            -- channel name with the second command-line argument.

            if To_String (Channel.Channel_Name) = Argument (2) then

               Display_Channel (Channel);

            end if;

         end loop;

         Close (Channel_File);

      end;

   end if;

end Channel_Dial;

