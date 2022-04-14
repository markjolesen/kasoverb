#!/usr/bin/perl 
# 
# kaso_verb_logo_create.pl
#
#  Copyright (c) 2011-2020 Mark J.Olesen
#
#  This file is licensed under the 2-Clause BSD License
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
# 
#   1. Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#
#   2. Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#  HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
#  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
#  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
#  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
#  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
#  KasoVerb is a trademark of Mark J. Olesen.  For licensing terms, usage and
#  conditions see '${KASOVERB_HOME}/licenses/kasoverb.tm.'
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------
#  Purpose: 
#    The KasoVerb logo is algorithmically created. This Perl script
#    (kaso_verb_logo_create), generates the KaoVerb logo in SVG format, in 
#    various sizes. The logo width and height are always a power of 2.
#----------------------------------------------------------------------------

$d= 8; # width of box
$s= 1; # stroke width
$last= 1024;

  do
  {
    $f= "./kasoverb_logo_${d}x${d}.svg";

    open FH, ">$f" or die "$! --- unable to create `$f'";

    modus_operandi();

    if ($last < $d)
    {
      exit;
    }

    close FH;

    $d*= 2;
    $s*= 2;

  } while(1);

sub modus_operandi()
{

  $t= ($d / 2) - $s; # top

  print FH  <<TEXT;
<svg xmlns="http://www.w3.org/2000/svg"
     xmlns:xlink="http://www.w3.org/1999/xlink"
     width='${d}px' height='${d}px' viewBox='0 0 $d $d'>

TEXT

  print FH <<TEXT;
<!--
KasoVerb Logo ${d}x${d}

  Copyright (c) 2011-2020 Mark J.Olesen

KasoVerb and the KasoVerb logo are trademarks of Mark J. Olesen
(markjolesen@gmail.com) aka ``markjolesen''

The KasoVerb name and logo may only be used in accordance with Mark
J. Olesen Trademark Policy. Full text of the trademark policy can
be found in the KasoVerb sofware distribution package under the
following path:

  \${KASOVERB_HOME}/licenses/kasoverb.tm

This logo can be found in the KasoVerb sofware distribution package
under the following path:

  \${KASOVERB_HOME}/src/kv3_logo/kasoverb_logo_${d}x${d}.svg
-->

TEXT

  print FH <<TEXT;
  <!-- top -->
  <line x1='0' y1='$t' x2='$d' y2='$t' style='stroke-width:$s; stroke: black;'/>

TEXT

  $x0= ($d / 2) + $s;

  print FH  <<TEXT;
  <!-- slant to left -->
  <line x1='$x0' y1='$t' x2='0' y2='$d' style='stroke-width:$s; stroke: black;'/>

TEXT

  $x0= ($d / 2) - $s;

  print FH  <<TEXT;
  <!-- slant to right -->
  <line x1='$x0' y1='$t' x2='$d' y2='$d' style='stroke-width:$s; stroke: black;'/>

TEXT

  print FH  <<TEXT;
  <!-- peg left -->
  <line x1='0' y1='$t' x2='0' y2='$d' style='stroke-width:$s; stroke: black;'/>

  <!-- peg right -->
  <line x1='$d' y1='$t' x2='$d' y2='$d' style='stroke-width:$s; stroke: black;'/>

TEXT

  # $x0= int(sqrt($d))
  $x0= ($d / 5); 
  $y0= $d - $x0;

  print FH  <<TEXT;
  <!-- peg left middle -->
  <line x1='$x0' y1='$t' x2='$x0' y2='$y0' style='stroke-width:$s; stroke: black;'/>

TEXT

  $x0= ($d - $x0);

  print FH  <<TEXT;
  <!-- peg right middle -->
  <line x1='$x0' y1='$t' x2='$x0' y2='$y0' style='stroke-width:$s; stroke: black;'/>

TEXT

  print FH  "</svg>\n";
}

=END
