/*
 * divsufsort.h for libdivsufsort
 * Copyright (c) 2003-2008 Yuta Mori All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

#ifndef _DIVSUFSORT_H
#define _DIVSUFSORT_H 1

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

@INCFILE@

#ifndef DIVSUFSORT_API
# ifdef DIVSUFSORT_BUILD_DLL
#  define DIVSUFSORT_API @DIVSUFSORT_EXPORT@
# else
#  define DIVSUFSORT_API @DIVSUFSORT_IMPORT@
# endif
#endif

/*- Datatypes -*/
#ifndef SAUCHAR_T
#define SAUCHAR_T
typedef @SAUCHAR_TYPE@ sauchar_t;
#endif /* SAUCHAR_T */
#ifndef SAINT_T
#define SAINT_T
typedef @SAINT32_TYPE@ saint_t;
#endif /* SAINT_T */
#ifndef SAIDX_T
#define SAIDX_T
typedef @SAINDEX_TYPE@ saidx_t;
#endif /* SAIDX_T */
#ifndef PRIdSAINT_T
#define PRIdSAINT_T @SAINT_PRId@
#endif /* PRIdSAINT_T */
#ifndef PRIdSAIDX_T
#define PRIdSAIDX_T @SAINDEX_PRId@
#endif /* PRIdSAIDX_T */


/*- Prototypes -*/

/**
 * Constructs the suffix array of a given string.
 * @param T[0..n-1] The input string.
 * @param SA[0..n-1] The output array of suffixes.
 * @param n The length of the given string.
 * @return 0 if no error occurred, -1 or -2 otherwise.
 */
DIVSUFSORT_API
saint_t
divsufsort(const sauchar_t *T, saidx_t *SA, saidx_t n);

/**
 * Constructs the burrows-wheeler transformed string of a given string.
 * @param T[0..n-1] The input string.
 * @param U[0..n-1] The output string. (can be T)
 * @param A[0..n-1] The temporary array. (can be NULL)
 * @param n The length of the given string.
 * @return The primary index if no error occurred, -1 or -2 otherwise.
 */
DIVSUFSORT_API
saidx_t
divbwt(const sauchar_t *T, sauchar_t *U, saidx_t *A, saidx_t n);

/**
 * Returns the version of the divsufsort library.
 * @return The version number string.
 */
DIVSUFSORT_API
const char *
divsufsort_version(void);


/* Burrows-Wheeler transform. */
DIVSUFSORT_API
saint_t
bw_transform(const sauchar_t *T, sauchar_t *U,
             saidx_t *SA /* can NULL */,
             saidx_t n, saidx_t *idx);

/* Inverse Burrows-Wheeler transform. */
DIVSUFSORT_API
saint_t
inverse_bw_transform(const sauchar_t *T, sauchar_t *U,
                     saidx_t *A /* can NULL */,
                     saidx_t n, saidx_t idx);

/**
 * Checks the correctness of a given suffix array.
 * @param T[0..n-1] The input string.
 * @param SA[0..n-1] The input suffix array.
 * @param n The length of the given string.
 * @param verbose The verbose mode.
 * @return 0 if no error occurred.
 */
DIVSUFSORT_API
saint_t
sufcheck(const sauchar_t *T, const saidx_t *SA, saidx_t n, saint_t verbose);


/* Search for the pattern P in the string T. */
DIVSUFSORT_API
saidx_t
sa_search(const sauchar_t *T, saidx_t Tsize,
          const sauchar_t *P, saidx_t Psize,
          const saidx_t *SA, saidx_t SAsize,
          saidx_t *left);

/* Search for the character c in the string T. */
DIVSUFSORT_API
saidx_t
sa_simplesearch(const sauchar_t *T, saidx_t Tsize,
                const saidx_t *SA, saidx_t SAsize,
                saint_t c, saidx_t *left);


#ifdef __cplusplus
} /* extern "C" */
#endif /* __cplusplus */

#endif /* _DIVSUFSORT_H */