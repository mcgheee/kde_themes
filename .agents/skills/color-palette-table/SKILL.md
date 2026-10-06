---
name: color-palette-table
description: Renders a color palette the user provides (background, foreground, ANSI palette 0-15) as a Markdown table of color swatches built with placehold.co. Supports layout variants (two-column, single-row, grid) and custom swatch dimensions. Use when the user gives a list of hex colors and wants a visual palette table, e.g. for a theme README.
---

# Color Palette Table

When the user provides a set of colors (a palette), output a Markdown table where each color is shown as a swatch image labeled with its hex value, using the `placehold.co` service.

## Expected input

The user will provide some or all of these, usually as `name = #HEX` or `palette = N=#HEX` lines:
- `background`
- `foreground`
- `palette 0`-`palette 7` (normal ANSI colors)
- `palette 8`-`palette 15` (bright ANSI colors)

## Options

These have defaults; the user can override either.

| Option | Default | Notes |
|--------|---------|-------|
| swatch dimensions `WIDTH x HEIGHT` | `200 x 15` | Any pair, e.g. `120x30`, `40x40`. |
| `variant` (layout) | `two-column` | `two-column`, `single-row`, or `grid`. |
| `columns` (grid only) | `4` | Number of swatches per row. |

## Cell template

Each color cell uses this exact pattern. `WIDTH`/`HEIGHT` come from the options (default `200`/`15`). The hex is UPPERCASE in the alt text; the hex in the URL and `text` parameter has NO `#`:

    ![#HEX](https://placehold.co/WIDTHxHEIGHT/HEX/png?text=HEX)

## Variants

### two-column (default)
- Row 1: `background` left, `foreground` right.
- Then the `|---|---|` separator.
- Then palette colors in ascending index order, two per row (even index left, odd index right): (0,1), (2,3), ... (14,15).
- If the palette count is odd, pad the final row's right cell with a single space.

### single-row
- One data row containing ALL colors across, in this order: background, foreground, then palette 0..15.
- One `|---|` separator per color (i.e. N columns).
- Best for a horizontal "strip" of swatches.

### grid
- `columns` swatches per row (default 4).
- Order: background, foreground, then palette 0..15.
- Fill left-to-right, top-to-bottom; pad the final row's trailing cells with a single space to keep the column count consistent.
- Separator row has one `|---|` per column.

## Rules

- UPPERCASE every hex value (alt text and URL).
- Use the configured `WIDTHxHEIGHT` in every cell; keep it consistent across the table.
- Only include colors the user actually provided. Skip missing ones — never invent placeholder hex values.
- If the user gives only palette colors (no background/foreground), start the ordering with the palette colors.
- If the user names a target file or heading (e.g. "under `## Stellar Bloom` in README.md"), insert the table there; otherwise just output the table.

## Examples

### two-column (default, 200x15)

Input:

    background = #030B0F
    foreground = #C7E0F0
    palette = 0=#07141C
    palette = 1=#C95D86
    palette = 2=#4EB7A5
    palette = 3=#C9AD72

Output:

    | ![#030B0F](https://placehold.co/200x15/030B0F/png?text=030B0F) | ![#C7E0F0](https://placehold.co/200x15/C7E0F0/png?text=C7E0F0) |
    |---|---|
    | ![#07141C](https://placehold.co/200x15/07141C/png?text=07141C) | ![#C95D86](https://placehold.co/200x15/C95D86/png?text=C95D86) |
    | ![#4EB7A5](https://placehold.co/200x15/4EB7A5/png?text=4EB7A5) | ![#C9AD72](https://placehold.co/200x15/C9AD72/png?text=C9AD72) |

### single-row (200x15)

Same input as above. Output (one row, six columns):

    | ![#030B0F](https://placehold.co/200x15/030B0F/png?text=030B0F) | ![#C7E0F0](https://placehold.co/200x15/C7E0F0/png?text=C7E0F0) | ![#07141C](https://placehold.co/200x15/07141C/png?text=07141C) | ![#C95D86](https://placehold.co/200x15/C95D86/png?text=C95D86) | ![#4EB7A5](https://placehold.co/200x15/4EB7A5/png?text=4EB7A5) | ![#C9AD72](https://placehold.co/200x15/C9AD72/png?text=C9AD72) |
    |---|---|---|---|---|---|

### grid (4 columns, 120x30)

Same input as above, plus "use a 4-column grid at 120x30". Output:

    | ![#030B0F](https://placehold.co/120x30/030B0F/png?text=030B0F) | ![#C7E0F0](https://placehold.co/120x30/C7E0F0/png?text=C7E0F0) | ![#07141C](https://placehold.co/120x30/07141C/png?text=07141C) | ![#C95D86](https://placehold.co/120x30/C95D86/png?text=C95D86) |
    |---|---|---|---|
    | ![#4EB7A5](https://placehold.co/120x30/4EB7A5/png?text=4EB7A5) | ![#C9AD72](https://placehold.co/120x30/C9AD72/png?text=C9AD72) |  |  |
