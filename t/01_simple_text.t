#!/usr/bin/perl

use Email::StripMIME;
use Email::Simple;
use Test::More tests => 1;

my $output_text = qq{Aren't you a lucky boy! This email is going to be a FAMOUS TEST!!

Love

+Pete

--
Do not be too moral. You may cheat yourself out of much life. Aim above
morality. Be not simply good; be good for something.
 -- Henry David Thoreau

};

my $email_data = join '', (<DATA>);
my $email_stripped = 
	Email::Simple->new(Email::StripMIME::strip_mime( $email_data ));

$email_body = $email_stripped->body;

$email_body =~ s/\s+/ /g;
$output_text =~ s/\s+/ /g;

is( $email_body, $output_text, "Text matches" );


__DATA__
Return-path: <sheriff@linuxufo.com>
Envelope-to: pete@clueball.com
Received: from sheriff by linuxufo.com with local (Exim 3.35 #1 (Debian))
	id 1AloFb-0002ki-00
	for <pete@clueball.com>; Wed, 28 Jan 2004 11:52:55 +0000
Date: Wed, 28 Jan 2004 11:52:55 +0000
From: Peter Sergeant <pete@clueball.com>
To: pete@clueball.com
Subject: Hi
Message-ID: <20040128115255.GA10362@linuxufo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.3.28i
Status: RO
Content-Length: 233
Lines: 10

Aren't you a lucky boy! This email is going to be a FAMOUS TEST!!

Love

+Pete

-- 
Do not be too moral. You may cheat yourself out of much life. Aim above
morality. Be not simply good; be good for something.
 -- Henry David Thoreau

