<?php

declare(strict_types=1);

namespace FluentCartProStubs\Tests;

use PHPUnit\Framework\TestCase;

/**
 * The constants stubs are a separate file because PHPStan scans them rather than analysing
 * them; this checks the generator actually captured them.
 */
class ConstantsTest extends TestCase
{
    public function testConstantsAreDefined(): void
    {
        $this->assertTrue(defined('FLUENTCART_PRO_PLUGIN_VERSION'), 'FLUENTCART_PRO_PLUGIN_VERSION is missing from the constants stubs.');
        $this->assertTrue(defined('FLUENTCART_PRO_PLUGIN_DIR'), 'FLUENTCART_PRO_PLUGIN_DIR is missing from the constants stubs.');
        $this->assertTrue(defined('FLUENTCART_MIN_CORE_VERSION'), 'FLUENTCART_MIN_CORE_VERSION is missing from the constants stubs.');
    }
}
