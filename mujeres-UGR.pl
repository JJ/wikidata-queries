#!/usr/bin/env perl

use strict;
use warnings;

use URI::Encode qw(uri_encode);
use LWP::Simple;

use v5.20;

my $query=<<EOC;
SELECT ?person ?personLabel WHERE {
  
    ?person wdt:P69 wd:Q1232810 . 
    ?person wdt:P21 wd:Q6581072 . 
  
    SERVICE wikibase:label { 
      bd:serviceParam wikibase:language "en" .
    }
} ORDER BY ?personLabel
EOC


my $result = get("https://query.wikidata.org/sparql?format=JSON\&query=".uri_encode($query));

say $result;
