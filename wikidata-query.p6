#!/usr/bin/env perl6

# Use SPARQL endpoint for obtaining wikidata

use URI::Encode;
use HTTP::Client;

sub MAIN( Str $sparql-file!) {
    my $file = slurp $sparql-file;
    my $encoded = uri_encode $file;
    my $client = HTTP::Client.new;
    my $response = $client.get("https://query.wikidata.org/sparql?format=JSON\&query=" ~ $encoded );
    say $response.content;
}
