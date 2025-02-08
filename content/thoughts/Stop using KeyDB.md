---
title: Stop using KeyDB
date: 2025-02-08T18:10:03+05:30
---

The last commit to the [KeyDB](https://github.com/Snapchat/KeyDB) repository was 11 months ago (April 5, 2024), and the last release was over a year ago (October 31, 2023). There hasn't even been a patch release since then. It's fair to say the project is no longer maintained and should not be considered a viable Redis alternative.

We recently learned this the hard way when KeyDB in one of our production environments crashed every time it attempted to save its state to the RDB dump. The issue was caused by a long-standing assertion bug in the latest version of KeyDB (v6.3.4): [https://github.com/Snapchat/KeyDB/issues/743](https://github.com/Snapchat/KeyDB/issues/743). As a temporary fix, we immediately downgraded to v6.3.3.

We initially adopted KeyDB for its support of flash storage - a feature that allows falling back to disk when the maximum memory threshold is reached.

It's been about two months now, and we have migrated to Redis with the eviction policy set to LRU (Least Recently Used).

Last week, one of KeyDB's maintainers created this GitHub issue:

![KeyDB GitHub issue - Goodbye](/keydb-goodbye-github-issue.webp)
