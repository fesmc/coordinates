# coordinates documentation

Quarto website documenting the `coordinates` library: the API, supported
projections, on-disk map formats, and a focused proposal for replacing the
brute-force neighbor search and subgrid-sampling conservative weights with a
KD-tree and analytic polygon clipping.

## Build locally

```sh
cd docs
quarto preview      # live-reloading local server
quarto render       # build static site into docs/_site/
```

Requires [Quarto](https://quarto.org) (tested with 1.9). No other dependencies;
Mermaid diagrams render natively.

## Publish to GitHub Pages

```sh
cd docs
quarto publish gh-pages
```

This renders and pushes the site to the `gh-pages` branch, served at
<https://fesmc.github.io/coordinates>.

## Source layout

| File | Contents |
|---|---|
| `index.qmd` | overview + three-step example |
| `concepts.qmd` | points / grid / map data model |
| `api/*.qmd` | per-module API reference |
| `reference/*.qmd` | projections, planets, map file formats |
| `improvements.qmd` | the improvement design document |
