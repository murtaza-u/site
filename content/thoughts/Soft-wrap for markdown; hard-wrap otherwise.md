---
title: Soft-wrap for markdown; hard-wrap otherwise
date: 2025-02-08T15:40:33+05:30
---

It's been a tough decision, but I think I've finally made peace with it. From now on, I will no longer hard-wrap markdown documents in my personal projects. I use a tool called [mdformat](https://github.com/hukkin/mdformat), which conveniently includes an option to convert all hard wraps into soft wraps.

```plaintext
mdformat --wrap no .
```

Now, I can finally copy a paragraph from my editor into text boxes on websites like GitHub, Hashnode, and Slack without worrying about strange formatting.
