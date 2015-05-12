#!/usr/bin/perl

use Term::ReadKey;
ReadMode 'noecho';
ReadMode 'cbreak';

$wait = -1;
$key = ReadKey($wait);

print $key if $key;
