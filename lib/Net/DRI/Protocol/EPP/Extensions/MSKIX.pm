package Net::DRI::Protocol::EPP::Extensions::MSKIX;

use strict;

use base qw(Net::DRI::Protocol::EPP::Extensions::TCI);
our $VERSION=do { my @r=(q$Revision: 1.3 $=~/\d+/g); sprintf("%d".".%02d" x $#r, @r); };

sub set_epp_version
{
 my ($self,$rp)=@_;
 my $version=Net::DRI::Util::check_equal($rp->{version},['1.2'],'1.2');
 $self->version($version);
}

####################################################################################################

sub default_extensions { return qw(TCI::Contact TCI::Domain TCI::Registrar TCI::Billing SecDNS); }

####################################################################################################
1;
