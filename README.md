# carrot 🥕

Lightweight & efficient semver parsing & range matching for LuaU.
All syntax and comparison ideology is derived from NPM semver syntax. Specifics are listed in [the cheatsheet](#cheatsheet).

## API


## Cheatsheet

### Range parsing syntax

| Range | Comparison | Notes |
| :---: | :---: | --- |
| `~1.2.3` | is >=1.2.3 <1.3.0 | |
| `^1.2.3` | is >=1.2.3 <2.0.0 | |
| `^0.2.3` | is >=0.2.3 <0.3.0 | (0.x.x is special) |
| `^0.0.1` | is ==0.0.1 | (0.0.x is special) |
| `^1.2` | is >=1.2.0 <2.0.0 | (like ^1.2.0) |
| `~1.2` | is >=1.2.0 <1.3.0 | (like ~1.2.0) |
| `^1` | is >1.0.0 <2.0.0 | |
| `1.x` | same | |
| `1` | same | |
| `*` | any version | |
| `x` | same | |

### Wildcard Explanation

| Wildcard | Description |
| --- | --- |
| `^` | means "compatible with" |
| `~` | means "reasonably close to" |
| `0.x.x` | is for "initial development" |
| `0.0.x` | means public API is defined |

## License

This framework (carrot) is licensed under [MIT](https://opensource.org/license/mit), meaning you can implement this into your project in any way that you see fit, but attributions to me within any files must be kept.
