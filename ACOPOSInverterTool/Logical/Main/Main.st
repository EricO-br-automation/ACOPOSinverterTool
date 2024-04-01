//
PROGRAM _INIT
//	
//	(*Enable FB Blocks*) // ???
//	eplWriteBlock.enable 	:= TRUE;
//	eplReadBlock.enable 	:= TRUE;
//	
END_PROGRAM
//
PROGRAM _CYCLIC
//	
//	//Mappview String Handling Task
	stringhandling;
//	
//	//By Default Remove Ability to Control Axis
//	//controlEnable := FALSE;
//	
//	//Assign pDevice
//	
//	IF hmiCom.PowerLinkPathDefault THEN
//		//If a null pointer is specified, the function block uses the first POWERLINK interface 
//		eplReadBlock.pDevice 	:= 0;
//		eplWriteBlock.pDevice 	:= 0;
//	ELSIF NOT hmiCom.PowerLinkPathDefault THEN
//		
//		pDevice := 
//		eplReadBlock.pDevice 	:= ADR(pDevice);
//		eplWriteBlock.pDevice 	:= ADR(pDevice);
	//Assign NodeNumber from Vis
	eplReadBlock.node		:= hmiCom.NodeNumber;
	eplWriteBlock.node		:= hmiCom.NodeNumber;
//	
//	
	CASE state OF
		
		WAIT:
		
			//Run Startup Routine
			IF startupRoutine AND hmiCom.NodeNumber <> 0 THEN
				startup;
			END_IF
			
			//Run Main Routine
			IF startupDone THEN
				j := 0;
				i := 0;
				startupRoutine := FALSE;
				state := RUN;
			END_IF
	
		RUN:

			CASE runstate OF
		
				WAITING:	
					
					hmiCom.Reading := FALSE;
					hmiCom.Writing := FALSE;

					IF hmiCom.cmd.loadParams = 1 THEN
						hmiCom.status.readInpr := TRUE;
						hmiCom.status.ReadDone := FALSE;
						runstate := READING;
					END_IF

					IF hmiCom.cmd.saveParams = 1 THEN
						hmiCom.status.writeInpr := TRUE;
						hmiCom.status.WriteDone := FALSE;
						runstate := WRITING;
					END_IF

				READING:	  
					hmiCom.Reading := TRUE;
					CASE readstate OF
						READPARAMS:
							IF readBools[i] THEN 		// readBools[i] should all be 1. Added for future use
								eplReadBlock.enable			:= TRUE;										
								eplReadBlock.index 			:= eplReadBuffer[i].index;
								eplReadBlock.subindex 		:= eplReadBuffer[i].subindex;
								eplReadBlock.datalen 		:= 2;	//2 bytes
								eplReadBlock.pData 		:= eplReadBuffer[i].pData;
								eplReadBuffer[i].status 	:= eplReadBlock.status;
								eplReadBuffer[i].errorinfo	:= eplReadBlock.errorinfo;									
							END_IF
						
							//Check For Error, then move to iterate counter
							IF eplReadBlock.status = 0 THEN
								readstate 					:= ITERATEREADCOUNT;
							ELSIF NOT (eplReadBlock.status = 0 OR eplReadBlock.status = 65535 OR eplReadBlock.status = 65534) THEN
								readstate := READERROR;
								state := GLOBALERROR;
							END_IF
					
						ITERATEREADCOUNT:
					
							//Turn off enable
							eplReadBlock.enable	:= FALSE;
					
							//Iterate Counter
							IF i = MAXINDEX THEN
//								hmiCom.status.readInpr := FALSE;
//								hmiCom.status.ReadDone := TRUE;
								i := 0;
								readstate := READPARAMS;
								runstate := WAITING;
								hmiCom.status.readInpr := FALSE;
								hmiCom.status.ReadDone := TRUE;
							ELSE
								i := i + 1;
							END_IF
							//Send Back to Reading State
							readstate 	:= READPARAMS;
					
						READERROR:	
							
							IF hmiCom.cmd.Reset = TRUE THEN
								
							END_IF
				
					END_CASE

				WRITING:
					hmiCom.Writing := FALSE;
					CASE writestate OF
				
						WRITEPARAMS:
					
							IF writeBools[j] THEN
								eplWriteBlock.index				:= eplReadBuffer[j].index;
								eplWriteBlock.subindex			:= eplReadBuffer[j].subindex;
								eplWriteBlock.datalen 			:= SIZEOF(readData.ADC);	//Any will do since the max is 2 bytes
								eplWriteBlock.pData 			:= eplReadBuffer[i].pData;
								eplWriteBuffer[j].status 		:= eplWriteBlock.status;
								eplWriteBuffer[j].errorinfo		:= eplWriteBlock.errorinfo;
								
								eplReadBlock.enable			:= TRUE;
							END_IF
					
							IF eplWriteBlock.status = 65535 THEN
								writestate 					:= ITERATEWRITECOUNT;
							END_IF

						ITERATEWRITECOUNT:
							//Turn off enable
							eplWriteBlock.enable	:= FALSE;
					
							//Iterate Counter
							IF j = MAXINDEX THEN
								j := 0;
								hmiCom.status.writeInpr := FALSE;
								hmiCom.status.WriteDone := TRUE;
								writestate := WRITEPARAMS;
								runstate := WAITING;
							ELSE
								j := j + 1;
							END_IF
					
							//Send Back to writing state
							writestate 	:= WRITEPARAMS;
		
						WRITEERROR:
				
					END_CASE

	
			END_CASE

		GLOBALERROR:
		
	END_CASE
//	
//	
//	
	eplWriteBlock();

IF startupDone THEN
	eplReadBlock();
END_IF
	 
END_PROGRAM
//
PROGRAM _EXIT
//	(* Insert code here *)
//	 
END_PROGRAM
//
