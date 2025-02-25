C ********************************************************************
C ORGN: CSUB - CMPS 3500
C FILE: spaghetti.f
C DATE: 01/15/2025
C ********************************************************************
C     PRIME NUMBER GENERATOR
      INTEGER :: I, J, K, N
      REAL :: ARRAY(100)

C Read input data
      READ *, N
      DO I = 1, N
         READ *, ARRAY(I)
      END DO

C Complex calculation with many jumps and unclear logic 
   10 DO J = 1, N - 1
         IF (ARRAY(J) > ARRAY(J + 1)) THEN
               K = ARRAY(J)
               ARRAY(J) = ARRAY(J + 1)
               ARRAY(J + 1) = K
               GOTO  10 
         END IF
      END DO

      IF (N .GT. 10) THEN
         GOTO 20
      END IF
      
   20 DO K = 1, N
         IF (ARRAY(K) < 0) THEN
               ARRAY(K) = 0
               GOTO 10
         END IF
      END DO

C Print results
      PRINT *, "Sorted numbers:"
      DO I = 1, N
         PRINT *, ARRAY(I)
      END DO
      END
