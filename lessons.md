# Lesson 7: Read Channel Data from a File

Lesson 6 introduced file output by saving a new channel to `channels.txt`.

Lesson 7 introduces file input.

The goal is to make the `list` command read channel data that was previously saved to `channels.txt`.

Each saved channel currently occupies 7 lines:

1. Channel name

2. Platform

3. Topic

4. Language

5. Region

6. Description

7. Date last verified

This lesson introduces:

- `In_File`

- `Get_Line`

- `End_Of_File`

- reconstructing a `Channel_Record` from data stored in a file

The existing `add` command will remain unchanged.

The `list` command will be extended so that it reads the saved channel data from `channels.txt`.

```ada

-- Lesson 7: Read Channel Data from a File

--

-- This lesson introduces file input.

-- The list command begins reading channel data that was

-- previously saved in channels.txt.

with Ada.Text_IO;

use Ada.Text_IO;

with Ada.Strings.Unbounded;

use Ada.Strings.Unbounded;

with Ada.Command_Line;

use Ada.Command_Line;

```

# Lesson 8: Read a Saved Channel

Lesson 7 introduced the idea of reading channel data from `channels.txt`.

Lesson 8 makes that idea work.

The goal is to have the `list` command open `channels.txt`, read one saved channel, reconstruct a `Channel_Record`, and display it.

This lesson introduces:

- opening a file for input

- reading lines with `Get_Line`

- assigning the saved values to a `Channel_Record`

- closing the file after reading it

For now, the program will read only one saved channel.

Reading multiple channels will come in a later lesson.

The important step in this lesson is completing the round trip:

**add a channel → save it → run the program again → read it back**

```ada

-- Lesson 8: Read a Saved Channel

--

-- This lesson completes the first persistence round trip.

-- A channel that was previously written to channels.txt is

-- read back into a Channel_Record and displayed by the list command.

--

-- For now, the program reads only one saved channel.

-- Reading multiple channels will be introduced in a later lesson.

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

         Close (Channel_File);

         -- The saved data is now a Channel_Record again.

         Display_Channel (Channel);

      end;

   end if;

end Channel_Dial;

```

