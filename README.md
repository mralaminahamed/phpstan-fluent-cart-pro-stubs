# Fluent Cart Pro Stubs

[![Latest Version](https://img.shields.io/packagist/v/mralaminahamed/fluent-cart-pro-stubs.svg?color=4CC61E&style=flat-square)](https://packagist.org/packages/mralaminahamed/fluent-cart-pro-stubs)
[![Downloads](https://img.shields.io/packagist/dt/mralaminahamed/fluent-cart-pro-stubs.svg?style=flat-square)](https://packagist.org/packages/mralaminahamed/fluent-cart-pro-stubs/stats)
[![License](https://img.shields.io/packagist/l/mralaminahamed/fluent-cart-pro-stubs.svg?style=flat-square)](./LICENSE)
[![PHP Version](https://img.shields.io/packagist/php-v/mralaminahamed/fluent-cart-pro-stubs.svg?style=flat-square)](./composer.json)

PHP stub declarations for [Fluent Cart Pro](https://fluentcart.com/), for IDE completion and static
analysis. Generated with [php-stubs/generator](https://github.com/php-stubs/generator) from the
plugin source.

Generated from **Fluent Cart Pro 1.5.3** — 200 classes · 2 interfaces · 4 traits · 7 constants.

## 📋 Requirements

- PHP >= 7.4
- [`mralaminahamed/fluent-cart-stubs`](https://github.com/mralaminahamed/phpstan-fluent-cart-stubs),
  installed automatically: Pro extends the free plugin, so its declarations only resolve
  alongside them.

## 📦 Installation

```bash
composer require --dev mralaminahamed/fluent-cart-pro-stubs
```

## 🔧 Configuration

```neon
parameters:
    scanFiles:
        # The free plugin first — Pro's classes extend it.
        - vendor/mralaminahamed/fluent-cart-stubs/fluent-cart-stubs.stub
        - vendor/mralaminahamed/fluent-cart-stubs/fluent-cart-constants-stubs.stub
        - vendor/mralaminahamed/fluent-cart-pro-stubs/fluent-cart-pro-stubs.stub
        - vendor/mralaminahamed/fluent-cart-pro-stubs/fluent-cart-pro-constants-stubs.stub
```

## ⚠️ Notes specific to a paid plugin

**No source is redistributed here, and regeneration needs a licence.** Fluent Cart Pro is commercial and
has no WordPress.org endpoint, so this repository carries only generated declarations — empty
method bodies and signatures. There are no release scripts that poll for new versions, because
there is nothing public to poll; to regenerate, unpack a licensed copy at `source/fluent-cart-pro` and run
`composer generate`.

That also means the stubs lag behind Pro releases until someone with a licence regenerates them.
Pin the version you tested against rather than tracking a range loosely.

## ⚠️ General limitations

- **Stubs are a snapshot** of Fluent Cart Pro 1.5.3. Regenerate when a signature changes.
- **Method bodies are empty by design.** Never load these files at runtime.
- **Only top-level constants are captured.** All seven of Pro's are. A constant defined inside a
  function or method is invisible to any stub generator — declare those in your own
  `bootstrapFiles` or under PHPStan's `dynamicConstantNames`.
- **The WPFluent framework is not duplicated here.** It ships inside the free plugin, namespaced
  as `FluentCart\Framework`, and comes from `fluent-cart-stubs`. Declaring it twice would have
  PHPStan reporting redeclarations.

## 🔄 Regenerating

```bash
composer install
# unpack a licensed copy of Fluent Cart Pro at source/fluent-cart-pro
composer generate
```

## 📁 Package structure

```
phpstan-fluent-cart-pro-stubs/
├── bin/generate.sh                     # regeneration, from a locally supplied source
├── configs/                            # finder.php (what to read), bootstrap.php (WP constants)
├── source/                             # licensed plugin source, gitignored
├── tests/                              # smoke tests over the generated stubs
├── fluent-cart-pro-stubs.stub              # classes, interfaces, traits
├── fluent-cart-pro-constants-stubs.stub    # constants only
└── phpstan.neon                        # analyses the stubs themselves
```

## 📝 License

The tooling here is MIT. The generated declarations derive from Fluent Cart Pro, which is commercial
software: they exist so static analysis can resolve its API, and they are not a substitute for a
licence or a means of redistributing it. See [LICENSE](./LICENSE).
