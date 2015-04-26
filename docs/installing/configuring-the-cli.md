---
title: "Configuring the CLI"
slug: "configuring-the-cli"
category: "process"
ordinal: 5
---

First configure the command-line client:

```bash
exercism configure --key=YOUR_API_KEY
```

Note that there must be no spaces alongside `=` in the above command.
`configure --key = YOURKEY` or `configure --key= YOURKEY` will not work.

Your API key can be found in [your exercism.io account settings](http://exercism.io/account).

By default directory named `exercism` will be created for you in your home
directory the first time you fetch problems and all the subsequent problem files
will be stored in this directory.

You can also change this directory path using the command:

```bash
exercism configure --dir="~/my_awesome_exercism_submissions"
```

There are some optional configuration
flags, see `exercism help configure` for more details.

The configuration is written to `~/.exercism.json`. This can be configured
using an environment variable named `EXERCISM_CONFIG_FILE`.
You can also edit this file instead of running `exercism configure` command.
