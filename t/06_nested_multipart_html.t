#!/usr/bin/perl

use strict;
use Email::Simple;
use Email::StripMIME;
use Test::More tests => 1;

my $output_text = qq{w00t };

my $email_data = join '', (<DATA>);
my $email_stripped =
  Email::Simple->new(Email::StripMIME::strip_mime( $email_data ));

my $email_body = $email_stripped->body;

$email_body =~ s/\s+/ /g;
$output_text =~ s/\s+/ /g;

is( $email_body, $output_text, "Text matches" );


__DATA__
Return-path: <sheriff_p@mac.com>
Envelope-to: sheriff@localhost
Delivery-date: Wed, 28 Jan 2004 07:41:04 +0000
Received: from localhost ([127.0.0.1] ident=sheriff)
	by linuxufo.com with esmtp (Exim 3.35 #1 (Debian))
	id 1AlkJs-0001P6-00
	for <sheriff@localhost>; Wed, 28 Jan 2004 07:41:04 +0000
Received: from 212.13.198.90 [212.13.198.90]
	by localhost with POP3 (fetchmail-5.9.11)
	for sheriff@localhost (single-drop); Wed, 28 Jan 2004 07:41:04 +0000 (GMT)
Received: from smtpout.mac.com ([17.250.248.44])
	by cou.ch with esmtp (Exim 3.35 #1 (Debian))
	id 1AlkJn-0007tA-00
	for <pete@clueball.com>; Wed, 28 Jan 2004 07:41:00 +0000
Received: from mac.com (smtpin08-en2 [10.13.10.153])
	by smtpout.mac.com (Xserve/MantshX 2.0) with ESMTP id i0S7enkX001402
	for <pete@clueball.com>; Tue, 27 Jan 2004 23:40:50 -0800 (PST)
Received: from [10.10.10.1] (cpc2-oxfd4-4-0-cust71.oxfd.cable.ntl.com [80.3.246.71])
	(authenticated bits=0)
	by mac.com (Xserve/smtpin08/MantshX 3.0) with ESMTP id i0S7elIc012914
	for <pete@clueball.com>; Tue, 27 Jan 2004 23:40:48 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v609)
To: pete@clueball.com
Message-Id: <45F8DD81-5165-11D8-8703-00306547A858@mac.com>
Content-Type: multipart/mixed; boundary=Apple-Mail-1-331677379
From: Pete Sergeant <sheriff_p@mac.com>
Subject: Thai
Date: Wed, 28 Jan 2004 07:40:41 +0000
X-Mailer: Apple Mail (2.609)
X-Spam-Checker-Version: SpamAssassin 2.61 (1.212.2.1-2003-12-09-exp) on 
	linuxufo.com
X-Spam-Status: No, hits=-4.8 required=4.7 tests=BAYES_00,RCVD_IN_SORBS 
	autolearn=no version=2.61
X-Spam-Level: 
Status: RO
Content-Length: 18170
Lines: 327


--Apple-Mail-1-331677379
Content-Type: multipart/alternative;
	boundary=Apple-Mail-2-331677379


--Apple-Mail-2-331677379
Content-Transfer-Encoding: 7bit 
Content-Type: text/html;
	charset=UTF-8;
	format=flowed

<html><body>w00t</body></html>

--Apple-Mail-2-331677379
Content-Transfer-Encoding: quoted-printable
Content-Type: text/enriched;
	charset=UTF-8

<bold><fontfamily><param>Lucida =
Grande</param><x-tad-smaller>=E0=B9=81=E0=B8=A5=E0=B8=B0=E0=B9=80=E0=B8=A7=
=E0=B8=A5=E0=B8=B2=E0=B8=97=E0=B8=B5=E0=B9=88=E0=B8=95=E0=B9=89=E0=B8=AD=E0=
=B8=87=E0=B9=84=E0=B8=9B=E0=B9=80=E0=B8=A5=E0=B8=B7=E0=B8=AD=E0=B8=81=E0=B8=
=8B=E0=B8=B7=E0=B9=89=E0=B8=AD

--Apple-Mail-2-331677379--

--Apple-Mail-1-331677379--

