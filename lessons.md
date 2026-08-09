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

