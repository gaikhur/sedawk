#!/usr/bin/perl 
use warnings; 
open (my $fh, "<", "emp.names") || die "cannot open datebook: $! \n"; 
=pp
while (<$fh>) { 
 print if /stewart/ ;  
 } 
while ( my $line = <$fh> ) {
 print "$line" if $ =~/kishor/i; 
  @kishors = $lines;  

 }
 print " Kishor appears ", scalar @kishors, " times ";  


@lines = <$fh> ; 
print @lines ; 

print "\nThe datebook file contains ", scalar @lines, " lines of text \n " ;  
 
close $fh ; 
=cut 
while(<$fh>) {

my $_=~ /kishor/i ; 
 tr/a-z/A-Z/;
print ; 
}
 
close $fh ;
