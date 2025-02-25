C*****************************************************************
C NAME: Oscar Aguilar
C ASGT: Activity 2
C ORGN: CSUB - CMPS 3500
C FILE: Neat.f
C DATE: 02/25/2025
C*****************************************************************

      PROGRAM prime_number_generator

      INTEGER :: i, j, n
      REAL :: array(100), temp

C     Read input size
      READ *, n

C     Read input values into array
      DO i = 1, n
         READ *, array(i)
      END DO

C     Sort array using bubble sort
      DO i = 1, n - 1
         DO j = 1, n - i
            IF (array(j) > array(j + 1)) THEN
               temp = array(j)
               array(j) = array(j + 1)
               array(j + 1) = temp
            END IF
         END DO
      END DO

C     Replace negative values with zero
      DO i = 1, n
         IF (array(i) < 0) THEN
            array(i) = 0
         END IF
      END DO

C     Print sorted array
      PRINT *, "Sorted numbers:"
      DO i = 1, n
         PRINT *, array(i)
      END DO

      END PROGRAM prime_number_generator

