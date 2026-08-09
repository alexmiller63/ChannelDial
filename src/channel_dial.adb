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

   type Channel_Array is array (Positive range <>) of Channel_Record;

   Channels : constant Channel_Array :=

     (1 => GMRC);

begin

   if Argument_Count = 0 then

      Put_Line ("Usage:");

      Put_Line ("  channel_dial list");

      Put_Line

        ("  channel_dial add NAME PLATFORM TOPIC LANGUAGE REGION DESCRIPTION DATE");

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

   elsif Argument (1) = "add" then

      if Argument_Count /= 8 then

         Put_Line

           ("Usage: channel_dial add NAME PLATFORM TOPIC LANGUAGE REGION DESCRIPTION DATE");

      else

         declare

            New_Channel : constant Channel_Record :=

              (Channel_Name       => To_Unbounded_String (Argument (2)),

               Platform           => To_Unbounded_String (Argument (3)),

               Topic              => To_Unbounded_String (Argument (4)),

               Language           => To_Unbounded_String (Argument (5)),

               Region             => To_Unbounded_String (Argument (6)),

               Description        => To_Unbounded_String (Argument (7)),

               Date_Last_Verified => To_Unbounded_String (Argument (8)));

            --  Lesson 6: Persist channel data in a file.

            --

            --  The purpose of this lesson is to introduce Ada file output.

            --  File_Type represents a file that Ada has opened or created.

            Channel_File : File_Type;

         begin

            --  Open an existing file in Append_File mode.

            --  Append_File preserves the existing contents and writes

            --  new data at the end of the file.

            begin

               Open

                 (File => Channel_File,

                  Mode => Append_File,

                  Name => "channels.txt");

            --  Open raises Name_Error if channels.txt does not exist.

            --  In that case, create the file instead.

            exception

               when Name_Error =>

                  Create

                    (File => Channel_File,

                     Mode => Out_File,

                     Name => "channels.txt");

            end;

            --  Put_Line writes text to Channel_File.

            --  Each field of the record is stored on its own line.

            Put_Line

              (Channel_File,

               To_String (New_Channel.Channel_Name));

            Put_Line

              (Channel_File,

               To_String (New_Channel.Platform));

            Put_Line

              (Channel_File,

               To_String (New_Channel.Topic));

            Put_Line

              (Channel_File,

               To_String (New_Channel.Language));

            Put_Line

              (Channel_File,

               To_String (New_Channel.Region));

            Put_Line

              (Channel_File,

               To_String (New_Channel.Description));

            Put_Line

              (Channel_File,

               To_String (New_Channel.Date_Last_Verified));

            --  Close tells Ada that we have finished using the file.

            Close (Channel_File);

            Put_Line ("Channel saved.");

         end;

      end if;

   else

      Put_Line ("Unknown command: " & Argument (1));

   end if;

end Channel_Dial;

