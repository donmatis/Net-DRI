## Domain Registry Interface, EURid EPP extensions
##
## Copyright (c) 2005,2007-2012 Patrick Mevzek <netdri@dotandco.com>. All rights reserved.
##               2014 Michael Kefeder <michael.kefeder@world4you.com>.
##               2015-2016 Michael Holloway <michael@thedarkwinter.com>. All rights reserved.
##
## This file is part of Net::DRI
##
## Net::DRI is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## See the LICENSE file that comes with this distribution for more details.
####################################################################################################

package Net::DRI::Protocol::EPP::Extensions::EURid;

use strict;
use warnings;

use base qw/Net::DRI::Protocol::EPP/;

use Net::DRI::Data::Contact::EURid;

=pod

=head1 NAME

Net::DRI::Protocol::EPP::Extensions::EURid - EURid (.EU) EPP extensions (documentation 2.1.1) for Net::DRI

=head1 DESCRIPTION

Please see the README file for details.

=head1 SUPPORT

For now, support questions should be sent to:

E<lt>netdri@dotandco.comE<gt>

Please also see the SUPPORT file in the distribution.

=head1 SEE ALSO

E<lt>http://www.dotandco.com/services/software/Net-DRI/E<gt>

=head1 AUTHOR

Patrick Mevzek, E<lt>netdri@dotandco.comE<gt>

=head1 COPYRIGHT

Copyright (c) 2005,2007-2012 Patrick Mevzek <netdri@dotandco.com>.
              2014 Michael Kefeder <michael.kefeder@world4you.com>.
              2015-2016 Michael Holloway <michael@thedarkwinter.com>.
All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

See the LICENSE file that comes with this distribution for more details.

=cut

####################################################################################################

sub setup
{
 my ($self,$rp)=@_;
 my $version=$self->version();

 $self->ns({ map { $_ => ['http://www.eurid.eu/xml/epp/'.$_.'-1.1',$_.'-1.1.xsd'] } qw/nsgroup keygroup/ });
 $self->capabilities('contact_update','status',undef); ## No changes in status possible for .EU domains/contacts
 $self->capabilities('domain_update','status',undef);
 $self->capabilities('domain_update','nsgroup',[ 'add','del']);
 $self->factories('contact',sub { return Net::DRI::Data::Contact::EURid->new(); });
 $self->default_parameters({domain_create => { auth => { pw => '' } } });
 return;
}

sub default_extensions { return qw/EURid::Domain EURid::Contact EURid::Notifications EURid::IDN EURid::Registrar EURid::DNSQuality NSgroup Keygroup SecDNS/; }

####################################################################################################
1;
