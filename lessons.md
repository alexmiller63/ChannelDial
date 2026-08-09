Lesson 7: Read Channel Data from a File

Lesson 6 introduced file output by saving a new channel to channels.txt.

Lesson 7 introduces file input.

The goal is to make the list command read channel data that was previously saved to channels.txt.

Each saved channel currently occupies 7 lines:

1. Channel name
2. Platform
3. Topic
4. Language
5. Region
6. Description
7. Date last verified

This lesson introduces:

• In_File
• Get_Line
• End_Of_File
• reconstructing a Channel_Record from data stored in a file

The existing add command will remain unchanged.

The list command will be extended so that saved channel data can be read back and displayed.

