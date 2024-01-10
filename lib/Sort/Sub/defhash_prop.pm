package Sort::Sub::defhash_prop;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub meta {
    return {
        v => 1,
        summary => 'Sort DefHash properties and attributes',
        description => <<'MARKDOWN',

Known (standard) properties and attributes are put first, in order of mention in the spec.
Then unknown properties/attributes are sorted asciibetically.

MARKDOWN
    };
}

sub gen_sorter {
    require Sort::BySpec;

    my ($is_reverse, $is_ci) = @_;

    Sort::BySpec::cmp_by_spec(
        spec => [
            'v',

            'defhash_v',

            'name',
            qr/\Aname\./,

            'caption',
            qr/\Acaption\./,

            # not in spec, but very common
            'summary',
            qr/\Asummary\./,

            'description',
            qr/\Adescription\./,

            'tags',

            'default_lang',

            'x',
            qr/\Ax\./ => sub { $_[0] cmp $_[1] },

            qr// => sub { $_[0] cmp $_[1] },
        ],
        reverse => $is_reverse,
    );
}

1;
# ABSTRACT:

=for Pod::Coverage ^(gen_sorter|meta)$

=cut
