---
title: "Troubleshooting"
slug: "troubleshooting"
category: "topics"
ordinal: 2
---

If you're having trouble fetching or submitting exercises, you may not have the most recent version of the command-line client.

To determine which version of the CLI you're using, run:

```bash
exercism -v
```

The most recent version of the CLI can be found [on GitHub](https://github.com/exercism/cli/releases/latest).

Next verify that the CLI is configured. Run:

```bash
exercism debug
```

Look at the API key, and compare it to the one in [your account](http://exercism.io/account). It will look something like this:

```plain
API Key: 91a1cc34b03dbcc93d81603454087da526fcc6c5
```

If the API key is incorrect, then re-run the `configure` command:

```bash
exercism configure --key=YOUR_API_KEY
```

Next look at the `Exercises Directory`. This should be the absolute path to the root directory for all the exercism problems. On a Mac, this might look like this:

```plain
Exercises Directory: /Users/you/exercism
```

On windows, it might look like this:

```plain
Exercises Directory: C:\Users\you\exercism
```

## "No DNS Server" Error

If you get an error that says "TCP Dial: No DNS Server", then you may have an invalid `/etc/resolve.conf` file.

If you're not sure what to put there, try this:

```
nameserver 127.0.0.1
```

## Firewall

If you live behind a firewall, you can configure exercism to go through your proxy.

In linux and on mac, it will look like so:

```bash
set http_proxy=http://[user]:[pass]@[proxy host/port]
# or
export http_proxy=http://[user]:[pass]@[proxy host/port]
```

The following command will work inside PowerShell (tested on V3.0/Win7).

```bash
[Environment]::SetEnvironmentVariable("http_proxy","http://[user]:[pass]@[proxy]:[port]")
```
