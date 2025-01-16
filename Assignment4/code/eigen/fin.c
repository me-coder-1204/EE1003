#include <stdio.h>
#include <string.h>
#include <math.h>
#include <omp.h>
#include <time.h>
#include <complex.h>
#include <stdlib.h>
#include "matcals.h"
#include "QR.h"

int main(int argc, char* argv[]){
    // clock_t start, end;
    // double cpu_time_used;
    // start = clock();
    // if(argc<=1) return -1;

    // srand(5678);
    // int m = atoi(argv[1]);
    // double complex** A = createMat(m, m);
    // for(int i=0;i<m;i++){
    //     for(int j=0;j<m;j++){
    //         A[i][j] = (double complex) ((rand()/(double)RAND_MAX)-0.5);
    //     }
    // }
    // // double complex*** Hq = malloc(2 * sizeof(double complex**));
    // // // hessenberg(A, m,Hq);

    // // Hq[0] = createMat(m , m); Hq[1] = createMat(m , m);
    // double complex* eig;
    // // hessenberg(A, m, Hq);

    // double complex** Ak = QReig(A, m);
    // printMat(Ak, m,m);printf("\n");
    // eig = eigs(Ak, m);
    // for(int i=0;i<m;i++) printf("%lf + i%lf\n",creal(eig[i]),cimag(eig[i]));

    // end = clock();
    // printf("%lf\n", (double) (end-start)/CLOCKS_PER_SEC);
    // freeMat(A, m);
    // freeMat(Ak,m);
    // free(eig);
    // // freeMat(Hq[0], m);
    // // freeMat(Hq[1],m);
    // // free(Hq);

    double complex** A = createMat(2, 2);
    A[0][0] = 0; A[0][1] = 2700;
    A[1][0] = 1; A[1][1] = 60;

    double complex** Ak = QReig(A, 2);
    double complex* eig = eigs(Ak ,2);
    printf("%lf, %lf",creal(eig[0]), creal(eig[1]));

    return 0;
}