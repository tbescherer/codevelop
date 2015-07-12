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

### Phase 2: User Profile (~2 days)
In this phase I will add API routes to show user profile data as JSON, then add backbone models and collections to fetch that data. I will user Filepicker for file upload so users can add profile images. By the end of this phase, users will be able to fully fill in their profile, as well as editing it, all within the central Backbone app.

[Details][phase-two]

### Phase 3: User Show Page (~2 days)
In this phase I will add the ability for users to view their own profiles, as well as those of other users. I will look into using the ace embeddable text editor so that users can upload code snippets.

[Details][phase-three]

### Phase 4: Answering Questions (~2 days)
In this phase I will investigate finding a gem which makes surveying users easy. I will then implement the question answering functionality. Users will be able to respond to questions and have their answers saved. These answers will then be used to evaluate user compatibility.

[Details][phase-four]

### Phase 5: Browse Users Index (~1-2 days)
In this phase I will add the ability to browse a list of other users. In addition I will implement a simple algorithm for evaluating user compatibility based on question responses.

[Details][phase-five]

### Phase 6:  Messaging (~2 days)
In this phase I will implement a messaging window which can be viewed from any other page of the app.
[Details][phase-six]

### Bonus Features (TBD)
- [ ] 'Recommend' button for users
- [ ] Full review of other users
- [ ] Radar graphs for review scores
- [ ] pagination/infinite scroll
- [ ] search(username, attributes)


[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
[phase-six]: ./docs/phases/phase6.md
