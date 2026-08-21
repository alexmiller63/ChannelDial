# Channel Dial Error Messages

Channel Dial should treat errors as part of its personality.

The message shown to the user should be short, memorable, and occasionally funny. Humor must never hide the useful information. The playful headline comes first; the actual technical error appears immediately beneath it.

## Error Headlines

### Cowardly failed.

For an operation that started but refused or failed to complete.

Inspired by the wonderfully judgmental Unix `tar` error:

> Cowardly refusing to create an empty archive.

### He’s dead, Jim.

For a process, connection, service, or resource that is definitively gone.

Use when retrying the same thing without changing anything is unlikely to help.

### Lost in space.

For something that cannot be located: a file, resource, route, device, or destination.

### Does not compute.

For invalid input, an impossible combination of settings, malformed data, or something Channel Dial cannot interpret.

### Mostly harmless.

For a warning rather than a fatal error.

The operation can continue, but something deserves the user’s attention.

### The stars are not aligned.

For a dependency, configuration, timing, compatibility, or environment problem.

The individual pieces may be valid, but they do not currently work together.

### Well, that was unexpected.

The general fallback for an error that does not fit a more useful category.

This should be uncommon. Whenever Channel Dial knows enough to give a more specific headline, it should.

## Presentation

A Channel Dial error should look conceptually like this:

**Cowardly failed.**

`tar: Cowardly refusing to create an empty archive`

The first line gives Channel Dial personality.

The second line tells the user what actually happened.

Never replace diagnostic information with a joke. The joke introduces the error; it does not obscure it.

## Principle

Errors are conversations, not punishments.

Channel Dial should acknowledge failure clearly, preserve the information needed to diagnose it, and make an unpleasant moment a little less unpleasant.