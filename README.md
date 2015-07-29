# Codevelop
  Codevelop is a clone of OKCupid, focusing on finding coding pairs for programmers rather than finding dates. Visit it at www.codevelop.xyz

##Guide to Repo
  Codevelop is a project grounded in Rails, with heavy use of Backbone in order to make the site single page.
  As such you'll find the majority of the heavy lifting code in the App/Assets/Javascripts Folder. Additionally you may wish to investigate the API controllers and Routes files to see how data is moved between Rails and Javascript. Finally, if you're curious about the styling (intended to be very faithful to OKCupid's original styling) you can check out the stylesheets.

##How to Use
  To use Codevelop, first make a profile. You can then edit your profile from the profile page, as well as answering questions about yourself. Based on your answers, Codevelop will generate a match score between you and all other users. Using these scores, you can browse the index page and find another with whom you have interests in common. Inspect their profile to see if they are someone you are interested in. If so, send them a message! Messaging occurs in real time, so you can chat just as you would on Facebook or a similar social site.
  
##Tech
  -Rails
  -Backbone
  -jQuery for modal views
  -Pusher for realtime messaging
  -Kaminari for pagination and infinite scroll
  -PGSearch for user search
  -Omniauth for Github signup
  -BCrypt for secure user auth
  -Faker for random elements of database seeding
  -UI Faces API for user avatars

##TODOS
  -Notifications upon message receipt
  -Read/unread messages
  -Liking
  -Quickmatch
  -Image upload in messaging
  -Location
  -Embedded text editor for code snippets
  -Profile visits

##Questions
  If you have any questions, I can be reached at Tbescherer@gmail.com
