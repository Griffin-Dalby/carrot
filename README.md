# carrot 🥕

[![Pipeline](https://github.com/griffin-dalby/carrot/actions/workflows/build-flow.yml/badge.svg?branch=main)](https://github.com/griffin-dalby/carrot/actions/workflows/build-flow.yml)
[![Release](https://img.shields.io/github/v/release/griffin-dalby/carrot)](https://github.com/griffin-dalby/carrot/releases)
[![License](https://img.shields.io/github/license/griffin-dalby/carrot)](LICENSE)

Lightweight & efficient semver parsing & range matching for LuaU.
All syntax and comparison ideology is derived from NPM semver syntax. Specifics are listed in [the cheatsheet](#cheatsheet).

## API


## Cheatsheet

### Range parsing syntax

| Range | Comparison | Notes |
| :---: | :---: | --- |
| `~1.2.3` | is `>=1.2.3` `<1.3.0` | |
| `^1.2.3` | is `>=1.2.3` `<2.0.0` | |
| `^0.2.3` | is `>=0.2.3` `<0.3.0` | |
| `^0.0.1` | is `==0.0.1` | |
| `^1.2` | is `>=1.2.0` `<2.0.0` | (like ^1.2.0) |
| `~1.2` | is `>=1.2.0` `<1.3.0` | (like ~1.2.0) |
| `^1` | is `>1.0.0` `<2.0.0` | |
| `1.x` | same | |
| `1` | same | |
| `*` | any version | |
| `x` | same | |

### Wildcard Explanation

Wildcards act as placeholders in version strings, any place that has a wildcard will be replaced with a zero.

| Wildcard | Example | Final |
| --- | --- | --- |
| `x` | 1.x.x | 1.0.0 |
| `X` | 3.2.X | 3.2.0 |
| `*` | 2.* | 2.0.0 |

### Partial Explanation

When a version is "partial", is does not have all three places. The missing places will be replaced with zeros.

| Partial | Final |
| --- | --- |
| 1.2 | 1.2.0 |
| 2.5 | 2.5.0 |

### Operator Explanation

Operators are used specifically when defining what ranges are needed. It acts as a shorthand for defining a specific range.

| Operator | Description |
| --- | --- |
| `^` | means "compatible with" |
| `~` | means "reasonably close to" |

## License

This framework (carrot) is licensed under [MIT](https://opensource.org/license/mit), meaning you can implement this into your project in any way that you see fit, but attributions to me within any files must be kept.
