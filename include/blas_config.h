#ifndef BLAS_CONFIG_H
#define BLAS_CONFIG_H

#ifndef blas_int
    #if defined(BLAS_ILP64)
        #define blas_int              long long  /* or int64_t */
    #else
        #define blas_int              int
    #endif
#endif

/* f2c, hence MacOS Accelerate, returns double instead of float
 * for sdot, slange, clange, etc. */
#if defined(HAVE_F2C)
    typedef double blas_float_return;
#else
    typedef float blas_float_return;
#endif

#if defined(BLAS_COMPLEX_CPP) || defined(LAPACK_COMPLEX_CPP)
    /* user has to specifically request std::complex,
     * as it isn't compatible as a return type from extern C functions. */
    #include <complex>
    typedef std::complex<float>  blas_complex_float;
    typedef std::complex<double> blas_complex_double;
#else
    /* otherwise, by default use C99 _Complex */
    #include <complex.h>
    typedef float _Complex  blas_complex_float;
    typedef double _Complex blas_complex_double;
#endif

/* define so we can check later with ifdef */
#define blas_complex_float  blas_complex_float
#define blas_complex_double blas_complex_double

#endif /* BLAS_CONFIG_H */
