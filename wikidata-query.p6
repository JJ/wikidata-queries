#!/usr/bin/env perl6

use URI::Encode;
use HTTP::Client;

sub MAIN( Str $sparql-file!) {
    my $file = slurp $sparql-file;
    my $encoded = uri_encode $file;
    my $client = HTTP::Client.new;
    say "https://query.wikidata.org/sparql?format=JSON\&query=" ~ $encoded;
    my $response = $client.get("https://query.wikidata.org/sparql?format=JSON\&query=" ~ $encoded );
    say $response.content;
}
