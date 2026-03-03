# Build Workflow

A complete system for going from idea to working product — alone, fast, without skipping the thinking.

Built for Cursor and Claude Code. Works for engineers, designers, PMs, or anyone with an idea to ship.

---

## What's inside

```
build-workflow/
├── .claude/
│   └── commands/               ← Claude Code skills (global)
│       ├── design-thinking.md  ← Problem space + emotional core + brand identity
│       ├── new-project.md      ← Full project scaffolding in one command
│       ├── plan.md             ← Structured planning before building
│       └── test-debug.md       ← Structured debugging when things break
├── .cursor/
│   └── rules/                  ← Cursor rules (global)
│       ├── ui-design.mdc       ← Visual systems, spacing, typography, components
│       ├── ux-design.mdc       ← UX principles, psychology laws, honest design
│       ├── motion-design.mdc   ← Animation, Framer Motion, reduced motion
│       ├── stack.mdc           ← Opinionated defaults and conventions
│       └── git.mdc             ← Commit conventions, branch strategy
└── install.sh                  ← One-command install
```

---

## Install

Clone the repo and run the install script:

```bash
git clone https://github.com/yourusername/build-workflow.git
cd build-workflow
chmod +x install.sh
./install.sh
```

The script copies Claude Code skills to `~/.claude/commands/` so they work in every project. Then follow the prompts to add the Cursor rules globally.

---

## Manual install

**Claude Code skills:**
```bash
mkdir -p ~/.claude/commands
cp .claude/commands/*.md ~/.claude/commands/
```

**Cursor rules:**
Open Cursor → Settings → Rules for AI. Paste the contents of each `.mdc` file from `.cursor/rules/` into the global rules field. They apply to every project automatically.

---

## How to use it

### Starting a new project

```
/new-project
```

Scaffolds everything in one go: Next.js, TypeScript, Tailwind, shadcn/ui, Bun, Git, GitHub repo, and Vercel — plus a `CLAUDE.md` brief in the project root. Asks three questions first, then handles the rest.

### Before writing any code

```
/design-thinking
```

Three phases with hard gates between them. Do not skip this.

**Phase 1 — Problem Space**
What breaks, for whom, and when. One sentence, user's words. Locked before moving on.

**Phase 2 — Emotional Core**
How the user feels before, during, and after using the product. This is where brand identity comes from — not a mood board, but the emotional promise the product makes. Four questions: before, during, after, and what it must never feel like.

**Phase 3 — Solution Space + Brand Identity**
The aesthetic direction is derived from the emotional core, not chosen arbitrarily. Every visual decision must be argued, not named. Output: a complete brief written into `CLAUDE.md` and a project-specific Cursor rule for the visual system.

Every build session that follows works against this brief.

### When you're ready to build

```
/plan
```

Structured planning before implementation. Breaks the work into phases, surfaces dependencies, flags unknowns before they become blockers.

### When something breaks

```
/test-debug
```

Structured debugging. Reproduces the problem, isolates the cause, fixes it without breaking anything else.

---

## The CLAUDE.md file

Every project gets a `CLAUDE.md` in the root. It carries the problem space, emotional core, brand identity, stack decisions, and known patterns for that specific product.

Every Claude Code session opens by reading it. Every Cursor session references it for visual and UX decisions. It's not a README — it's the brief the agent works from.

Created by `/new-project`. Filled in by `/design-thinking`. Grows as the project evolves.

---

## The Cursor rules

The craft layer — runs on every file, every project, automatically.

**ui-design.mdc** — 8pt grid, 60-30-10 colour rule, typography scale, component states, motion patterns, and a self-verification checklist the agent runs before presenting any UI work.

**ux-design.mdc** — Peter Ramsey / Built for Mars principles, Hick's Law, Peak-end rule, decision architecture, honest design, and structured patterns for empty states, errors, and forms.

**motion-design.mdc** — what to animate (opacity, transform), what never to animate (width, height, padding), Framer Motion recipes, reduced motion handling.

**stack.mdc** — Bun over npm always, shadcn/ui before building from scratch, when to add a dependency and when not to.

**git.mdc** — commit message format, branch naming, what never to commit.

The rules are opinionated. That's the point. They encode decisions so you don't have to make them again.

---

## The philosophy

Most people treat AI tools like a faster version of themselves — throwing screenshots and voice memos at the agent and hoping something comes out.

This workflow is built on a different assumption: **the agent is only as good as the context you give it.**

The design thinking skill ensures the problem is understood before anything is built. `CLAUDE.md` gives every session the full brief. The Cursor rules give the agent a craft foundation it carries into every file. Together, the system builds like someone who has done this before — not vibe-coding, but deliberate product development.

You don't need to be an engineer to use this. You need to be someone who cares about building the right thing well.

---

## Contributing

This is a living system. If you find something missing, wrong, or improvable — open a PR or an issue. The whole point of sharing it is to make it better.

---

## Acknowledgements

Carmen for sharing her UX/UI skills publicly — looking at them, I spotted what was missing in mine.
Kyle for his motion design repo — building on it made my work meaningfully better.

That's the point of open source.
