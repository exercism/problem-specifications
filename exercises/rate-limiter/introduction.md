# Introduction

You're building a public API and need to prevent abuse.
To do that, you'll implement a fixed-window rate limiter: for each client (identified by a key, e.g. username or API token), only a limited number of requests should be allowed within a fixed time window.
Requests beyond that limit are rejected until the next window starts.

