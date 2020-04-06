-- 
Use dentalpractice;
START TRANSACTION;
LOCK TABLES patient Write, appointment READ;

    select ppsn, firstname, surname, treatment from patient;

    update patient set treatment="Wisdom tooth taken out" where ppsn=1; -- success
	
	INSERT INTO patient ( ppsn, firstname, surname, dob, address, phoneno, email, treatment) VALUES
	( 004, 'Anne', 'Jones', '1990-04-04', 'Cork City, Cork', '0874234234', 'anne@gmail.com', 'Filling'); -- success

    select * from appointment; -- success as table locked for read  
	 
    commit; -- will not release table
	
    select * from appointment; -- success 

	Show Open Tables IN dentalpractice Where In_Use>0;
	  
UNLOCK TABLES; 
