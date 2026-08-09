# Lesson 11: Report When a Channel Is Not Found

Lesson 10 introduced the `find` command and exact channel-name matching.

Lesson 11 makes the `find` command behave better when there is no match.

The goal is for the program to distinguish between:

- finding and displaying a channel

- reaching the end of `channels.txt` without finding the requested channel

This lesson introduces:

- a Boolean value that remembers whether a match was found

- changing that value when a matching channel is encountered

- checking the value after the search loop finishes

If no matching channel was found, the program will display a clear message instead of silently producing no output.

For example:

`Channel not found: GMRC`

The search itself remains unchanged. Channel names must still match exactly.

This is the first lesson devoted specifically to making ChannelDial fail well.

```ada

-- Lesson 11: Report When a Channel Is Not Found

--

-- Lesson 10 added exact channel-name searching.

-- This lesson makes the find command report when no match exists.

--

-- A Boolean value remembers whether a matching channel was found.

-- If the search reaches the end of the file without a match,

-- the program displays a clear not-found message.

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

         -- The new idea in this lesson: remember whether

         -- the search found a matching channel.

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

               -- Remember that a matching channel was found.

               Found := True;

            end if;

         end loop;

         Close (Channel_File);

         -- If Found is still False after the entire file

         -- was searched, report that no channel matched.

         if not Found then

            Put_Line ("Channel not found: " & Argument (2));

         end if;

      end;

   end if;

end Channel_Dial;

```

