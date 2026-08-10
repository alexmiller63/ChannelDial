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

# Lesson 9: Read Multiple Saved Channels

Lesson 8 completed the first persistence round trip by reading one saved channel from `channels.txt` and reconstructing a `Channel_Record`.

Lesson 9 extends the `list` command so that it can read and display every saved channel in the file.

The goal is to keep reading complete channel records until the program reaches the end of `channels.txt`.

This lesson introduces:

- looping while reading a file

- using `End_Of_File` to determine when reading is finished

- reconstructing and displaying one `Channel_Record` during each pass through the loop

The format of `channels.txt` remains unchanged. Each channel still occupies 7 lines.

The `add` command remains unchanged.

After this lesson, `list` will no longer be limited to a single saved channel. It will display all of the channels stored in `channels.txt`.

# Lesson 10: Find One Channel

Lesson 9 extended the `list` command so that it reads and displays every channel stored in `channels.txt`.

Lesson 10 introduces searching.

The goal is to add a `find` command that searches the saved channels for a particular channel name.

For example:

`channeldial find GMRC`

The `list` command remains unchanged.

The new `find` command will:

- open `channels.txt`

- read one complete `Channel_Record` at a time

- compare the channel name with the name supplied on the command line

- display the channel when a match is found

This lesson introduces:

- using a second command-line argument

- comparing a field in a `Channel_Record` with a search value

- using a file-reading loop for a different purpose

The new loop will look very similar to the loop used by `list`, but it has a different job.

For now, the duplicated structure will remain visible. A later lesson can examine whether the common file-reading code should be factored out.

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

# Lesson 13: Report a Missing Argument

Lesson 12 made ChannelDial report an unknown command.

Lesson 13 handles a different problem: a valid command that is missing information it needs.

For example:

`channeldial find`

`find` is a valid ChannelDial command, but it needs the name of a channel to find.

Before this lesson, this command would fall through to the final `else` and produce:

`Unknown command: find`

That message is misleading. ChannelDial recognizes `find`. The problem is that the channel name is missing.

The goal of this lesson is to report that problem clearly.

For example:

`Missing channel name.`

`Usage: channeldial find CHANNEL`

This lesson introduces:

- recognizing a valid command before checking whether it has enough arguments

- reporting a missing command-line argument

- displaying a simple usage message

The existing `list`, `find`, channel-not-found, and unknown-command behavior remain unchanged.

The important idea is that ChannelDial should first determine **which command the user requested**, and then determine whether that command received the information it requires.

In Lesson 12, the `find` test was:

`elsif Argument (1) = "find" and Argument_Count >= 2 then`

In Lesson 13, ChannelDial first recognizes `find`:

`elsif Argument (1) = "find" then`

It then checks separately whether the required channel name was supplied.

This prevents a recognized but incomplete command from being incorrectly reported as an unknown command.

# Lesson 14: Report Too Many Arguments

Lesson 13 made ChannelDial report when the `find` command was missing its required channel name.

Lesson 14 handles the opposite problem: a recognized command that receives more arguments than it needs.

For example:

`channeldial list nonsense`

The `list` command does not need any additional arguments.

Another example is:

`channeldial find GMRC nonsense`

The `find` command needs exactly one channel name. Anything after the channel name is an extra argument.

Before this lesson, ChannelDial would silently ignore those extra arguments and continue running the command.

The goal of this lesson is to report the problem instead.

For example:

`Too many arguments.`

`Usage: channeldial list`

or:

`Too many arguments.`

`Usage: channeldial find CHANNEL`

This lesson introduces:

- checking the maximum number of arguments a command accepts

- distinguishing missing arguments from extra arguments

- refusing to silently ignore unexpected command-line input

The existing valid `list` and `find` behavior remains unchanged.

The important idea is that a command-line program should not merely recognize the command name. It should also verify that the command has been used in the form it expects.

For `list`, ChannelDial checks:

`Argument_Count > 1`

For `find`, ChannelDial first checks whether the channel name is missing:

`Argument_Count < 2`

and then checks whether additional arguments were supplied:

`Argument_Count > 2`

Only when the number of arguments is correct does ChannelDial perform the requested command.

This continues the work of making ChannelDial fail clearly instead of silently accepting malformed commands.

