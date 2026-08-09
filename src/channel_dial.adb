-- Lesson 9: Read Multiple Saved Channels

--

-- Lesson 8 read one saved channel from channels.txt.

-- This lesson extends the list command so that it reads every

-- saved channel in the file.

--

-- Each pass through the loop reads the 7 lines that make up one

-- Channel_Record. The loop ends when the end of the file is reached.

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

         -- Keep reconstructing channels until there is no more

         -- saved data to read.

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

end Channel_Dial;

