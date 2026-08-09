# Lesson 12: Report an Unknown Command

Lesson 11 made the `find` command report when a requested channel could not be found.

Lesson 12 handles a different kind of failure: a command that ChannelDial does not recognize.

For example:

`channeldial frobnicate`

ChannelDial has no `frobnicate` command.

Before this lesson, an unknown command could reach the end of the program without producing a useful explanation.

The goal of this lesson is to make ChannelDial report the problem clearly.

For example:

`Unknown command: frobnicate`

This lesson introduces:

- using a final `else` as a catch-all case

- distinguishing valid commands from unknown commands

- reporting the command that ChannelDial did not recognize

The existing `list` and `find` commands remain unchanged.

The important idea is that after all recognized commands have been checked, anything that remains must be an unknown command.

This continues the work begun in Lesson 11: ChannelDial should not merely work when the user does the right thing. It should also explain what happened when something goes wrong.

```ada

-- Lesson 12: Report an Unknown Command

--

-- Lesson 11 made the find command report when a channel

-- could not be found.

--

-- This lesson handles an unrecognized command.

-- After all known commands have been checked, a final else

-- reports anything remaining as an unknown command.

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

   else

      -- The new idea in this lesson: if none of the known

      -- commands matched, report the command as unknown.

      Put_Line ("Unknown command: " & Argument (1));

   end if;

end Channel_Dial;

```

