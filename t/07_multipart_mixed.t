#!/usr/bin/perl

use strict;
use Email::Simple;
use Email::StripMIME;
use Test::More tests => 1;

my $output_text = q'Quick brown etc ';

my $email_data = join '', (<DATA>);
my $email_stripped =
  Email::Simple->new(Email::StripMIME::strip_mime( $email_data ));

my $email_body = $email_stripped->body;

$email_body =~ s/\s+/ /g;
$output_text =~ s/\s+/ /g;

# Email::MIME is broken, work-around
#diag("Working around Email::MIME bug...");
#$email_body =~ s/--.+? //;

is( $email_body, $output_text, "Text matches" );

__DATA__
Return-path: <l@att.net>
Envelope-to: sheriff@localhost
Delivery-date: Wed, 28 Jan 2004 10:43:28 +0000
Received: from localhost ([127.0.0.1] ident=sheriff)
	by linuxufo.com with esmtp (Exim 3.35 #1 (Debian))
	id 1AlnAO-0002KN-00
	for <sheriff@localhost>; Wed, 28 Jan 2004 10:43:28 +0000
Received: from 212.13.198.90 [212.13.198.90]
	by localhost with POP3 (fetchmail-5.9.11)
	for sheriff@localhost (single-drop); Wed, 28 Jan 2004 10:43:28 +0000 (GMT)
Received: from [206.186.186.109] (helo=vickesh01-2709.tbaytel.net)
	by cou.ch with smtp (Exim 3.35 #1 (Debian))
	id 1AlnA5-00089X-00
	for <pete@clueball.com>; Wed, 28 Jan 2004 10:43:13 +0000
Received: from 96.233.56.226 by 206.186.186.109; Wed, 28 Jan 2004 19:03:55 -0600
Message-ID: <VOHFJOGXUXAOCIBFHTQWXQEW@yahoo.com>
From: "Martin Colvin" <a@kih.net>
Reply-To: "Martin Colvin" <h@cfl.rr.com>
To: pete@clueball.com
Subject: lower the payment   intervene roil any brennan springboard robbery remand carcinogen rightmost confine benight cautionary andover cupboard conflagrate 
Date: Thu, 29 Jan 2004 06:07:55 +0500
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="66448332511598748"
X-Priority: 3
X-IP: 110.16.70.204
Status: RO

--66448332511598748
Content-Type: text/plain;

Quick brown etc

--66448332511598748
Content-Type: text/html;

<html><body>Jump jump</body></html>

--66448332511598748
