#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set repeat.initial_wait 512
/bin/echo -n .
$cli set repeat.wait 64
/bin/echo -n .
$cli set parameter.keyoverlaidmodifier_timeout 300
/bin/echo -n .
/bin/echo