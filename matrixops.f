C*****************************************************************
C NAME: Oscar Aguilar 
C ASGT: Activity 2 
C ORGN: CSUB - CMPS 3500
C FILE: Matrixops 
C DATE: 2/24/2025  
C*****************************************************************

C     Define matrices and vectors
      REAL matrix1(6,6), matrix2(6,6)
      REAL mat_sum(6,6), mat_subs(6,6), mat_prod1(6,6)
      REAL vector1(6), mat_prod2(6)
      REAL dot_prod
      REAL mat5(5,5), transposed(5,5), powered(5,5)
      INTEGER SIZE1, SIZE2, SIZE3, I, J, P
      REAL, ALLOCATABLE :: mtemp1(:), mtemp2(:), mtemp3(:)

C     ****************************************
C     Reading m1.in (6x6 matrix)
C     ****************************************
      OPEN(1, FILE='m1.in', STATUS='OLD', ERR=2002)
      SIZE1 = 0
  10  READ(1,*,END=20)
      SIZE1 = SIZE1 + 1
      GO TO 10

  20  CONTINUE
      IF(SIZE1 .EQ. 0) GO TO 2002

C     Rewind and allocate memory
      REWIND(1)
      ALLOCATE(mtemp1(1:SIZE1))

C     Read data into a temporary 1D array
      DO I=1, SIZE1
         READ(1,*) mtemp1(I)
      END DO

C     Convert to 6x6 matrix
      matrix1 = RESHAPE(mtemp1, (/6,6/))
      DEALLOCATE(mtemp1)
      CLOSE(1)

C     ****************************************
C     Reading m2.in (6x6 matrix)
C     ****************************************
      OPEN(2, FILE='m2.in', STATUS='OLD', ERR=2002)
      SIZE2 = 0
  40  READ(2,*,END=50)
      SIZE2 = SIZE2 + 1
      GO TO 40

  50  CONTINUE
      IF(SIZE2 .EQ. 0) GO TO 2002

      REWIND(2)
      ALLOCATE(mtemp2(1:SIZE2))

      DO I=1, SIZE2
         READ(2,*) mtemp2(I)
      END DO

      matrix2 = RESHAPE(mtemp2, (/6,6/))
      DEALLOCATE(mtemp2)
      CLOSE(2)

C     ****************************************
C     Reading v1.in (6x1 vector)
C     ****************************************
      OPEN(3, FILE='v1.in', STATUS='OLD', ERR=2002)
      SIZE3 = 0
  70  READ(3,*,END=80)
      SIZE3 = SIZE3 + 1
      GO TO 70

  80  CONTINUE
      IF(SIZE3 .EQ. 0) GO TO 2002

      REWIND(3)
      ALLOCATE(mtemp3(1:SIZE3))

      DO I=1, SIZE3
         READ(3,*) mtemp3(I)
      END DO

      vector1 = mtemp3
      DEALLOCATE(mtemp3)
      CLOSE(3)

C     ****************************************
C     Performing Matrix Operations
C     ****************************************
      mat_sum  = matrix1 + matrix2
      mat_subs = matrix1 - matrix2
      mat_prod1 = MATMUL(matrix1, matrix2)
      mat_prod2 = MATMUL(matrix1, vector1)
      dot_prod = DOT_PRODUCT(vector1, mat_prod2)

C     ****************************************
C     Reading mat5.in (5x5 matrix for Transpose and Power)
C     ****************************************
      OPEN(4, FILE='mat5.in', STATUS='OLD', ERR=2002)
      DO I = 1, 5
         READ(4, *) mat5(I, :)
      END DO
      CLOSE(4)

C     Compute transpose and power (Example: Power of 3)
      transposed = transpose5x5(mat5)
      P = 3
      powered = power5x5(mat5, P)

C     ****************************************
C     Printing Outputs
C     ****************************************
      PRINT *, 'Program to show some matrix and vector operations'
      PRINT *, '*************************************************'

      PRINT *, 'Matrix 1:'
      CALL print_matrix(matrix1, 6)
      PRINT *, 'Matrix 2:'
      CALL print_matrix(matrix2, 6)
      PRINT *, 'Vector 1:'
      CALL print_vector(vector1, 6)

      PRINT *, 'Matrix Sum (m1 + m2):'
      CALL print_matrix(mat_sum, 6)
      PRINT *, 'Matrix Difference (m1 - m2):'
      CALL print_matrix(mat_subs, 6)
      PRINT *, 'Matrix-Vector Multiplication (m1 * v1):'
      CALL print_vector(mat_prod2, 6)
      PRINT *, 'Dot Product: ', dot_prod

      PRINT *, 'Transpose of 5x5 matrix:'
      CALL print_matrix(transposed, 5)
      PRINT *, 'Power of 5x5 matrix (p =', P, '):'
      CALL print_matrix(powered, 5)

      STOP

C     ****************************************
C     Error Handling for Missing Files
C     ****************************************
 2002 PRINT *, 'Error: Missing or empty input file.'
      STOP

C     ****************************************
C     Functions and Subroutines
C     ****************************************
      CONTAINS

C     Function to compute the transpose of a 5x5 matrix
      FUNCTION transpose5x5(A) RESULT(T)
          REAL, INTENT(IN) :: A(5,5)
          REAL :: T(5,5)
          INTEGER :: i, j

          DO i = 1, 5
              DO j = 1, 5
                  T(j, i) = A(i, j)
              END DO
          END DO
      END FUNCTION transpose5x5

C     Function to compute matrix power of a 5x5 matrix
      FUNCTION power5x5(A, p) RESULT(P)
          REAL, INTENT(IN) :: A(5,5)
          INTEGER, INTENT(IN) :: p
          REAL :: P(5,5)
          INTEGER :: i

          P = 0.0
          DO i = 1, 5
              P(i, i) = 1.0
          END DO

          DO i = 1, p
              P = MATMUL(P, A)
          END DO
      END FUNCTION power5x5

C     Subroutine to print a matrix
      SUBROUTINE print_matrix(A, size)
          INTEGER, INTENT(IN) :: size
          REAL, INTENT(IN) :: A(size, size)
          INTEGER :: i, j

          DO i = 1, size
              PRINT *, (A(i, j), j = 1, size)
          END DO
      END SUBROUTINE print_matrix

C     Subroutine to print a vector
      SUBROUTINE print_vector(v, size)
          INTEGER, INTENT(IN) :: size
          REAL, INTENT(IN) :: v(size)
          INTEGER :: i

          DO i = 1, size
              PRINT *, v(i)
          END DO
      END SUBROUTINE print_vector

      END PROGRAM matrix_operations

