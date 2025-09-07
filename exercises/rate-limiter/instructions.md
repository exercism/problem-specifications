# Instructions

Implement a fixed-window, per-key rate limiter.

- Each key has its own independent window and counter.
- At most `limit` requests are allowed within a single window.
- When the window duration passes, the counter resets for that key.
- Use an injected, controllable time source for determining the current time so tests don't require sleeping.

Suggested public API (example):

```
interface RateLimiter {
    // Returns true if the request for this key is allowed in the current window.
    boolean allow(String key);

    static RateLimiter fixedWindow(int limit, Duration window, TimeSource timeSource) {
        return new FixedWindowRateLimiter(limit, window, timeSource);
    }
}

/**
 * Abstraction over a monotonic time source used by the rate limiter.
 * Units: nanoseconds.
 */
interface TimeSource {
    /**
     * Returns the current monotonic time in nanoseconds.
     * Implementations should use a monotonic source (e.g., System.nanoTime()).
     */
    long nowNanos();

    final class Fake implements TimeSource {
        private long currentNanos;
        public Fake(long initialNanos) { this.currentNanos = initialNanos; }
        public long nowNanos() { return currentNanos; }
        public void advanceMillis(long millis) { this.currentNanos += millis * 1_000_000L; }
        public void advanceSeconds(long seconds) { this.currentNanos += seconds * 1_000_000_000L; }
    }
}
```

Notes:

- The exact language and types may differ per track; the key idea is a function that, given a `key`, answers whether it is allowed right now, based on a per-key counter and a fixed-size time window.
- Prefer a monotonic time source when available (e.g., `System.nanoTime`), or a provided/injected clock/time source in tracks that support it.
- Handle window boundaries carefully: if the current time is at or beyond the start of the next window, reset the counter for that key and start the next window.

Example timeline (limit = 3, window = 200 ms):

- t=0: allow("alice") → true
- t=0: allow("alice") → true
- t=0: allow("alice") → true
- t=0: allow("alice") → false (limit reached)
- advance time by 200 ms
- t=200 ms: allow("alice") → true (counter reset)
