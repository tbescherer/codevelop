# Codevelop


[Heroku link][heroku]

[heroku]: http://codevelop.herokuapp.com

## Minimum Viable Product
Codevelop is a clone of OKCupid developed using Rails and Backbone. Users are able to:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [ ] Create accounts
- [ ] Create sessions (log in)
- [ ] Upload pictures
- [ ] Answer questions
- [ ] Browse an index of other users
- [ ] See individual profiles of other users
- [ ] See compatibility score with other users
- [ ] Send messages to other users


## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./views.md
[schema]: ./schema.md

## Implementation Timeline

### Phase 1: User Authentication (~1 day)
I will set up user signup with authentication using the standard pattern suggested by App Academy. By the end of this phase, users will be able to sign in and fill in parts of their profile. I may or may not implement login using a github account.

I will push this phase to Heroku and test everything before proceeding to Phase 2.

[Details][phase-one]

### Phase 2: User Profile (~1 days)
In this phase I will add API routes to show user profile data as JSON, then add backbone models and collections to fetch that data. By the end of this phase, users will be able to fully fill in their profile, as well as editing it, all within the central Backbone app.

[Details][phase-two]

### Phase 3: User Show Page (~2 days)
In this phase I will add the ability for users to view their own profiles, as well as those of other users. I will user Filepicker for file upload so
users can add profile images. I will look into using the ace embeddable text editor so that users can upload code snippets.

[Details][phase-three]

### Phase 4: Answering Questions (~2 days)
In this phase I will investigate finding a gem which makes surveying users easy. I will then implement

### Phase 5: Browse Users Index (~1-2 days)
I'll start by adding a `feed` route that uses the `current_user`'s
`subscribed_blogs` association to serve a list of blog posts ordered
chronologically. On the Backbone side, I'll make a `FeedShow` view whose `posts`
collection fetches from the new route.  Ultimately, this will be the page users
see after logging in.

[Details][phase-four]

### Phase 6:  Messaging (~2 days)
I'll need to add `search` routes to both the Blogs and Posts controllers. On the
Backbone side, there will be a `SearchResults` composite view has `BlogsIndex`
and `PostsIndex` subviews. These views will use plain old `blogs` and `posts`
collections, but they will fetch from the new `search` routes.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] "Like" button and counter for posts
- [ ] Custom blog urls
- [ ] Pagination/infinite scroll
- [ ] Activity history (e.g. likes, reblogs, taggings)
- [ ] Post types (image posts, quote posts, etc)
- [ ] Reblogging
- [ ] Multiple sessions/session management
- [ ] User avatars
- [ ] Typeahead search bar

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
