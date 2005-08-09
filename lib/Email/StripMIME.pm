
=head1 NAME

Email::StripMIME - Turn 'enhanced' emails back to plain text

=head1 DESCRIPTION

Provides a sensible text representation of an email's content

=head1 SYNOPSIS

 use Email::StripMIME;

 my $email = join '', (<>);

 print Email::StripMIME::strip_mime( $email );

=cut

package Email::StripMIME;

use strict;
use vars qw($VERSION);
use Email::MIME;
use HTML::FormatText;
use HTML::TreeBuilder;

$VERSION = '1.01';

=head1 METHODS

=head2 strip_mime ( $email_as_string )

Returns the email you passed it, with all plain
text attachments folded into the message body,
and non-text attachments removed. Fiddles the
MIME headers to reflects this.

If no plain text attachments were found, but
there were HTML ones, it'll convert them to
plain text and use those for the message body.

=cut

sub strip_mime {
	
	# Create a new Email::MIME object
		my $parsed = Email::MIME->new( shift() );

	# Holds the new message body we're building
		my $message_body;
	
	# Holds any HTML parts of the message, in case
	# we've not found any usable text parts
		my @html_parts;

	# Go through the different parts of the email (unless
	# it only has one part, in which case, this'll return
	# that part anyway). If there's no content-type, there's
	# no attachments, we assume, see.

		if ( !$parsed->content_type ) {
	
			$message_body = $parsed->body();

		} else {

			for my $entity ( $parsed->parts ) {
	
				_extract_text( $entity, \$message_body, \@html_parts );
	
			}

		}

	# If we didn't get any 'plain' text, but we did
	# get HTML, use that...
		if ( !$message_body && @html_parts ) {
		
		# Cycle through the bits we got...
			for ( @html_parts ) {
		
			# Convert the HTML to text
				my $tree = HTML::TreeBuilder->new->parse( $_->body );		
				my $formatter = HTML::FormatText->new(leftmargin => 0, rightmargin => 72);
 	
 			# Add a small delimiter if needed		
				$message_body .= "\n\n" if $message_body;
 			
 			# Add it to our message body		
 				$message_body .= $formatter->format($tree);			
		
			}
	
		}
	
	# Reset our content header to something sane...
		$parsed->header_set( "Content-type" => 'text/plain; charset=US-ASCII' );
	
	# Delete now erroneous headers (THIS NEEDS WORK)
		$parsed->header_set( "Content-length" => undef );
		$parsed->header_set( "Lines" => undef );
	
	
	# Replace the Email::MIME object's body...
		$parsed->body_set( $message_body );
	# Working around an Email::MIME bug...
		if ( $parsed->{body_raw} ) {
			$parsed->{body_raw} = $message_body;
		}
	
	# Return the email as text
		return $parsed->as_string;

}

sub _extract_text {

	# Read in stuff

		my $parent_entity = shift;
		my $message_body_ref = shift;
		my $html_parts_ref = shift;
		
	# Loop through the parts...
		
		for my $entity ( $parent_entity->parts ) {
		
		# Get the type of MIME entity...
			my $content_type = lc($entity->content_type);
		
		# Clean out extra info
			$content_type =~ s/;.*//;

		# See if we need to extract more parts
			if ( $content_type =~ m/^multipart/ ) {
				
				_extract_text( $entity, $message_body_ref, $html_parts_ref );
		
		# Grab any 'plain text' parts		
			} elsif (
				$content_type eq 'text/plain' ||
				$content_type eq 'text/base64' ||
				$content_type eq 'text/uuencode' ||
				$content_type eq 'text/quoted-printable'
			) {
			
			# Add a small delimiter if needed		
				$$message_body_ref .= "\n\n" if $$message_body_ref;
		
			# Add the decoded text to our interim body
				$$message_body_ref .= $entity->body;
		
		# Grab any HTML, just in case...
			} elsif ( $content_type eq 'text/html' ) {
		
				push( @{$html_parts_ref}, $entity ) unless $$message_body_ref;
		
			}

		}

}

=head1 AUTHOR

Pete Sergeant -- C<pete@clueball.com>

=head1 COPYRIGHT

Copyright 2005 B<Pete Sergeant>.

This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut



1;

