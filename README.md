A FFXIV tool to find which blue mage spells are needed by all users in a given set created with Ruby on Rails.

The Everyone tab shows spells needed by the entire group. If someone already has all of their spells, but you've added them to the list (more on that later), then it will ignore the character with 100% completion and only show what the rest of the group needs.

![image](https://user-images.githubusercontent.com/10588570/234122013-48bced89-494f-4bbf-98e1-20831470ea68.png)

Required dependencies:

ruby 3.0.2p107 or greater
You may need to install Ruby on Rails as well. Not entirely sure.

How to use:

First each player needs to go to https://ffxivcollect.com/spells and link their account to their loadstone character. Afterward, each player must mark each spell they have in order for the BlueMageAssistant application to pull in what each player has.

Next, you will need to add each of their loadstone id's to the user_ids array located in C:\<downoad_location>\BlueMageAssistant\app\controllers\home_controller.rb. The code will look something like this:

user_ids = Array [692625, 30427225, 31883647, 1551939, 117129]

To get a player's loadstone id, search for their name on the loadstone and copy it from the url (692625 would be my id):

https://na.finalfantasyxiv.com/lodestone/character/692625/

Lastly, run the following in your command prompt (note your ruby install location may different from mine):

C:\Ruby30-x64\bin\ruby.exe C:/<Download_Location>/BlueMageAssistant/bin/rails server -b 127.0.0.1 -p 3000 -e development

Afterwards, navigate to localhost:3000 in your browser to use the application.
