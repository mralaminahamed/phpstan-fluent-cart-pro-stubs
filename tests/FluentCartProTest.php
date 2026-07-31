<?php

declare(strict_types=1);

namespace FluentCartProStubs\Tests;

use PHPUnit\Framework\TestCase;

/**
 * A smoke test over the generated stubs: the file exists and is not truncated. The point is to
 * catch a regeneration that silently produced an empty file — which, for a package whose source
 * cannot be downloaded automatically, is the likely failure.
 */
class FluentCartProTest extends TestCase
{
    public function testStubsParse(): void
    {
        $stub = __DIR__ . '/../fluent-cart-pro-stubs.stub';

        $this->assertFileExists($stub);
        $this->assertGreaterThan(1000, (int) filesize($stub), 'The stubs file is suspiciously small.');
    }

    public function testProDeclarationsArePresent(): void
    {
        $contents = (string) file_get_contents(__DIR__ . '/../fluent-cart-pro-stubs.stub');

        $this->assertStringContainsString('namespace FluentCartPro', $contents);
    }
}
