# NAME

Crypt::Random - Cryptographically Secure, True Random Number Generator. 

# SYNOPSIS

```perl
use Crypt::Random qw( makerandom ); 
my $r = makerandom ( Size => 512, Strength => 1 ); 
```

# DESCRIPTION

Crypt::Random is an interface module to the /dev/random and /dev/urandom
device found on most modern unix systems. It also interfaces with egd,
a user space entropy gathering daemon, available for systems where
/dev/random (or similar) devices are not available. When Math::Pari is
installed, Crypt::Random can generate random integers of arbitrary size
of a given bitsize or in a specified interval.

# BLOCKING BEHAVIOUR

Since kernel version 5.6 in 2020, /dev/random is no longer blocking and
there is effectively no difference between /dev/random and /dev/urandom.
Indeed there has been no difference in the quality of randomness from
either in many years.  /dev/random now only blocks on startup of the
system and only for a very short time.

# HARDWARE RNG

If there's a hardware random number generator available, for instance
the Intel i8x0 random number generator, you can use it instead of
/dev/random or /dev/urandom.  Usually your OS will provide access to the
RNG as a device, eg (/dev/intel\_rng).

# METHODS 

- **makerandom()**

    Generates a random number of requested bitsize in base 10. Following
    arguments can be specified.

    - **Size** 

        Bitsize of the random number. 

    - **Provider** 

        Specifies the name of the Provider to be used. **Specifying a Provider overrides Strength**.

        Options are:

        - devrandom

            Uses /dev/random to generate randomness.

        - devurandom

            Uses /dev/urandom to generate randomness.

        - egd (INSECURE)

            An Entropy Gathering Daemon (egd) daemon is read to obtain randomness.
            As egd has not been updated since 2002 it has been moved to the low
            strength provider list.

        - rand (INSECURE)

            Generates randomness based on Perl's internal rand function.  This
            provider is not secure for any Cryptographic uses or anywhere the
            randomness is important for security.

            **DEPRECATION NOTICE**: rand will be completely removed as a provider
            in a subsequent release.  It does not meet the criteria of being a
            Cryptographically Secure, True Random Number Generator.

    - **Strength** 0 || 1 

        Value of 1 implies that /dev/random or /dev/urandom should be used
        for requesting random bits while 0 implies insecure including rand.

        As of release 1.55 Strength defaults to 1 (/dev/random or
        /dev/urandom)

    - **Device** 

        Alternate device to request random bits from. 

    - **Uniform** 0 || 1

        Value of 0 (default) implies that the high bit of the generated random
        number is always set, ensuring the bitsize of the generated random will be
        exactly Size bits. For uniformly distributed random numbers, Uniform
        should be set to 1.

- **makerandom\_itv()** 

    Generates a random number in the specified interval.  In addition 
    to the arguments to makerandom() following attributes can be 
    specified. 

    - **Lower** 

        Inclusive Lower limit.  

    - **Upper** 

        Exclusive Upper limit. 

- **makerandom\_octet()**

    Generates a random octet string of specified length. In addition to
    **Strength**, **Device** and **Verbosity**, following arguments can be
    specified.

    - **Length**

        Length of the desired octet string. 

    - **Skip**

        An octet string consisting of characters to be skipped while reading from
        the random device.

# DEPENDENCIES

Crypt::Random needs Math::Pari 2.001802 or higher. 

# SEE ALSO

Crypt::URandom should be considered as simpler module for obtaining
cryptographically secure source of Randomness.

The CPANSec group has developed the [CPAN Author's Guide to Random Data for Security](https://security.metacpan.org/docs/guides/random-data-for-security.html) that should be reviewed before dealing with randomness. 

# BIBLIOGRAPHY 

- 1 random.c by Theodore Ts'o.  Found in drivers/char directory of 
the Linux kernel sources.
- 2 Handbook of Applied Cryptography by Menezes, Paul C. van Oorschot
and Scott Vanstone.

# AUTHOR

Vipul Ved Prakash, <mail@vipul.net>
