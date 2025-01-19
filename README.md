# NAME

Crypt::Random - Cryptographically Secure, True Random Number Generator. 

# SYNOPSIS

```perl
use Crypt::Random qw( makerandom ); 
my $r = makerandom ( Size => 512, Strength => 1 ); 
```

# DESCRIPTION

Crypt::Random is an interface module to the /dev/random device found on
most modern unix systems. It also interfaces with egd, a user space
entropy gathering daemon, available for systems where /dev/random (or
similar) devices are not available. When Math::Pari is installed,
Crypt::Random can generate random integers of arbitrary size of a given
bitsize or in a specified interval.

# BLOCKING BEHAVIOUR

The /dev/random driver maintains an estimate of true randomness in the
pool and decreases it every time random strings are requested for use.
When the estimate goes down to zero, the routine blocks and waits for the
occurrence of non-deterministic events to refresh the pool.

When the routine is blocked, Crypt::Random's read() will be blocked till
desired amount of random bytes have been read off of the device. The
/dev/random kernel module also provides another interface, /dev/urandom,
that does not wait for the entropy-pool to recharge and returns as many
bytes as requested. For applications that must not block (for a
potentially long time) should use /dev/urandom. /dev/random should be
reserved for instances where very high quality randomness is desired.

# HARDWARE RNG

If there's a hardware random number generator available, for instance the
Intel i8x0 random number generator, please use it instead of /dev/random!.
It'll be high quality, a lot faster and it won't block! Usually your OS
will provide access to the RNG as a device, eg (/dev/intel\_rng).

# METHODS 

- **makerandom()**

    Generates a random number of requested bitsize in base 10. Following
    arguments can be specified.

    - **Size** 

        Bitsize of the random number. 

    - **Strength** 0 || 1 

        Value of 1 implies that /dev/random should be used
        for requesting random bits while 0 implies /dev/urandom.

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

# BIBLIOGRAPHY 

- 1 random.c by Theodore Ts'o.  Found in drivers/char directory of 
the Linux kernel sources.
- 2 Handbook of Applied Cryptography by Menezes, Paul C. van Oorschot
and Scott Vanstone.

# AUTHOR

Vipul Ved Prakash, <mail@vipul.net>
