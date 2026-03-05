# How to use this workflow

The README covers what each skill does. This covers how to actually work with the system — the things that aren't obvious until you've used it wrong a few times.

---

## The mode sequence

The workflow moves through three stages. If you're using Cursor, these map directly to Ask, Plan, and Agent modes. If you're using any other tool — VS Code, Windsurf, Claude Code, or Claude directly — the stages still apply. They're a mental model for how to think, not a Cursor-specific feature.

```
Ask    →  /design-thinking
Plan   →  /plan
Build  →  agent mode, or equivalent in your tool
```

This is not a suggestion. It's the sequence. Each stage is for a different kind of thinking. Skipping steps doesn't save time — it creates problems you'll spend more time fixing later.

---

## Ask mode — /design-thinking

Open Cursor in Ask mode before you touch anything else.

Invoke `/design-thinking`. The skill walks you through three phases: problem space, emotional core, and solution space with brand identity. There are hard gates between them. You don't move to Phase 2 until Phase 1 is locked.

What you're doing in Ask mode is not planning. It's understanding. The difference matters.

By the end of `/design-thinking` you should be able to answer:
- What breaks, for whom, and when — in the user's words, not yours
- How the user feels before they find this product, while they're using it, and after
- What the product must never feel like
- What the aesthetic direction is and why — argued from the emotional core, not picked from a mood board

All of this gets written into `CLAUDE.md`. Every session that follows works against it.

---

## Plan mode — /plan

Switch to Plan mode after `/design-thinking` is complete.

Invoke `/plan`. The skill breaks the work into parts. A basic app has three: frontend, backend, middleware (database and API routes). The skill then breaks each part into specific tasks.

**The most important thing about Plan mode:** do not ask the agent to build everything at once. The instinct is to describe the whole product and let it figure out the rest. This produces something that looks complete but has hidden problems — wrong dependencies, disconnected layers, logic that doesn't hold under load.

Build in parts. Connect them as you go. Frontend first, then backend, then connect.

**If the plan doesn't feel right:** don't add a new prompt on top of the broken one. Edit the original. Be precise about what you're asking. Vague prompts produce vague plans. Go back, tighten the intent, run it again.

**One technique worth adding to your Plan mode process:** once you have a solid plan, paste it into Claude outside Cursor and ask it to rewrite the instructions for the agent. Specifically: make them tight, focused, and unambiguous. The agent should only do what's asked, flag ambiguity before proceeding, and not go stray.

This does two things. It saves tokens in the actual build session. And it forces you to think through the plan one more time before you commit to building it.

---

## Agent mode — build

Only switch to Agent mode when:

1. `/design-thinking` is complete and `CLAUDE.md` has the brief
2. `/plan` has produced a solid, specific implementation plan
3. The plan has been tightened (see above)

Then build one part at a time. When a part is done, stop. Review it. Only then move to the next.

Do not ask the agent to build frontend, backend, and database in a single prompt. Something comes out. It looks like progress. It isn't.

---

## Which model for which task

Not all models are equal for all tasks. This is what works:

**Reasoning, planning, architecture decisions**
Opus or Sonnet. Use these for `/design-thinking`, `/plan`, and any session where you're making decisions about structure, approach, or direction. They think better. They also have a tendency to expand scope if you're not precise — keep your prompts tight.

**First-pass UI**
Gemini gets visual layout right more reliably than the others on a first attempt. If you're starting from scratch on a new screen, or prototyping worth trying here first.

**Implementation and debugging**
Sonnet or Codex. Codex is tightly focused — it does what's asked and doesn't add unrequested things. Sonnet is more capable but needs to be kept in line. For debugging specifically, Sonnet's reasoning is useful; for pure implementation of a clear spec, Codex is cleaner.

The general principle: use the reasoning-heavy models to think, use the implementation-focused models to build.

---

## What "done" looks like at each stage

One of the hardest things when you're learning this workflow is knowing when to move to the next step. Here are the exit criteria for each mode.

**Ask mode is done when:**
- The problem is stated in the user's words, not yours
- The emotional core is written out — before, during, after, and what it must never feel like
- The aesthetic direction is derived from the emotional core and can be argued
- All of this is in `CLAUDE.md`

**Plan mode is done when:**
- The work is broken into parts (frontend, backend, middleware)
- Each part is broken into specific tasks
- Dependencies are surfaced — what needs to exist before what
- Unknowns are flagged — not ignored
- The plan has been tightened in Claude outside Cursor

**Agent mode is done (per part) when:**
- The part builds without errors
- It behaves as specified in the plan
- You've reviewed it before moving to the next part

---

## On assumptions and unknowns

`/design-thinking` asks you to surface assumptions and unknowns in Phase 1. Take this seriously.

An assumption is something you're treating as true without having verified it. An unknown is something you haven't resolved yet. Both will become problems during the build if you don't name them first.

The instinct is to skip this because it feels like it slows you down. It doesn't. Finding an unresolved assumption at hour six of a build session costs far more than naming it at hour zero.

---

## On working inside an existing codebase

This workflow is designed for new projects. If you're working inside an existing codebase — whether your own or someone else's — the sequence changes.

Before you run `/plan`, spend time in Ask mode understanding the codebase:
- What stack is it using?
- What does the folder structure look like?
- What dependencies are already installed?
- What conventions does the existing code follow?

The agent can only work with what it knows. If you give it a plan that assumes dependencies that aren't there, or ask it to write code that conflicts with existing patterns, it will produce something that breaks things.

Ask first. Understand the foundation before you build on it.

And be mindful of what you push. A broken implementation in your own project is a problem for you. A broken PR in a shared codebase is a problem for everyone on the team. The patience the workflow asks of you is not just about quality — it's about not creating work for others.

---

## The CLAUDE.md file

Every session should start with the agent reading `CLAUDE.md`. In Claude Code, this happens automatically. In Cursor, reference it explicitly at the start of a session if the context isn't picked up.

If `CLAUDE.md` doesn't exist yet, run `/new-project` first. If it's incomplete, run `/design-thinking` before building anything.

The brief is the foundation. Everything else is built on top of it.
