# Purpose of this directory

To make use of third party services and make sure the correct usernames, URLs,
or IDs are used, populate this directory with files named after the service, 
and type the name of your username, ID, or URL in the file. Do not type 
anything else in it.

In order for this to work, a parent template must point to files here.

## Example

The contents of `twitter.hbs` will be simply "danemacmillan," in my case.
Similarly, to embed Disqus comments, I would create a file called `disqus.hbs`
with my username.

The Handlerbars template must first exist for the service's username to get
pulled in and used. The `partials` directory contains an example of how this
works. There is also a `disqus.hbs` file, but it contains the `Disqus` embed
code. The important line to notice is the one with `{{> ids/disqus}}`, as
that is where the username is pulled in.

**Currently, the Daner theme will search for these files in the `ids` directory:**

- `addthis.hbs`
- `disqus.hbs`
- `twitter.hbs`
- `piwik.hbs` (set a domain, no protocol, leading slash)