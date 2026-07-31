<?php
/**
 * Which Fluent Cart Pro files to read.
 *
 * `app/` and `boot/` are Pro's own code. Its `vendor/` is only Composer's autoloader — the
 * WPFluent framework lives in the free plugin, so its declarations come from
 * mralaminahamed/fluent-cart-stubs, which this package requires. Duplicating them here would
 * put the same classes in two stub files and make PHPStan complain about redeclaration.
 */

use StubsGenerator\Finder;

return Finder::create()
    ->in( array(
        'source/fluent-cart-pro/app',
        'source/fluent-cart-pro/boot',
    ) )
    ->append(
        Finder::create()
            ->in( array( 'source/fluent-cart-pro' ) )
            ->files()
            ->depth( '< 1' )
            ->path( 'fluent-cart-pro.php' )
    )
    ->sortByName( true )
;
