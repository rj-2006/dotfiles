# Codeforces theme

Dark, focused (Zen-mode) theme for [Codeforces](https://codeforces.com),
built on the *Codeforces Zen* userstyle base and recolored in Tokyo Night.

- `codeforces-tokyonight.css` — the full userstyle (Tokyo Night),
  matches the `emilia.conf` kitty theme in this repo.
- `palettes/nord.css` / `palettes/dracula.css` — alternate palettes;
  replace the `:root { … }` block in the main file with either of these.

## Features (from Zen base)

- Focus mode: centered layout, sidebar/footer dimmed to 10% until hovered.
- Inverted datatables/standings so the light tables read as dark.
- Compatibility with Carrot, Codeforces Enhancer, and Codeforces Better
  extensions (their colored widgets get re-inverted correctly).

## Install (Stylus)

1. Install the [Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us/)
   browser extension.
2. Open Codeforces → Stylus's new style → paste the whole contents of
   `codeforces-tokyonight.css`.
3. Save.

The stylesheet uses `@-moz-document url-prefix("https://codeforces.com")`,
so it applies to every Codeforces page automatically.

## Notes

- All colors are CSS custom properties in the `:root` block — tweak there;
  `--fg`, `--border`, `--blue`, `--purple`, etc. drive the whole theme.
- The Zen template relies on `invert()` filters for a few areas (datatable,
  code blocks, catalog). If a block looks washed-out, it's likely an inline
  color fighting a filter — tell me the page and I'll add an override.