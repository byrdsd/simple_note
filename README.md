# Simple Note

A simple notetaking app in Ruby on Rails. See the demo at https://simple-note.herokuapp.com

## Approach

Refer to the [design document](https://github.com/byrdsd/simple_note/issues/1) for details about the approach used to create the app, including a planned breakdown of work, the user story, and high-level specifications.

Refer to [the adr docs](doc/adr) for details about the architectural decisions. These are simple but effective documents which outline underlying decisions that could be difficult to change down the road.

## Testing

Models are happy-path tested, and controllers are lightly tested. No ui tests or mailer test at this time. I wanted to get to those but didn't quite have the space for this project. The testing is a bit lighter than I'd prefer.

## Features

Create, edit, view and destroy simple notes from an authenticated dashboard. You can also send the notes to your friends!

## Future Improvements

It'd be nice to be able to edit notes and send email from a modal on desktop. For mobile, the current experience is better than popping up modals. Some better error messaging and clearer UX around messages would be beneficial as well.

UI tests and more complete controller testing would help prevent problems before they went live.
