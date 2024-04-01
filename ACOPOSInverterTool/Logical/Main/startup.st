
ACTION startup: 

	
	CASE startupstate OF
		
		INITIALIZE:
			
			//Initialize values for the plk adresses, etc.
			//Asynchronous Parameters from AS config:
			
			eplReadBuffer[0].name  	 			:= 'NSP'; //UNSIGNED
			eplReadBuffer[0].index 	 			:= 16#2042; 
			eplReadBuffer[0].subindex 			:= 16#05;
			eplReadBuffer[0].measurementUnit	:= RPM;
			eplReadBuffer[0].pData				:= ADR(readData.NSP);
			
			eplReadBuffer[1].name  	 			:= 'FRS'; //UNSIGNED
			eplReadBuffer[1].index 	 			:= 16#2042; 
			eplReadBuffer[1].subindex 			:= 16#03;
			eplReadBuffer[1].measurementUnit	:= Hz;
			eplReadBuffer[1].pData				:= ADR(readData.FRS);
			
			eplReadBuffer[2].name  	 			:= 'UNS'; //UNSIGNED
			eplReadBuffer[2].index 	 			:= 16#2042;
			eplReadBuffer[2].subindex 			:= 16#02;
			eplReadBuffer[2].measurementUnit	:= Volts;
			eplReadBuffer[2].pData				:= ADR(readData.UNS);
			
			eplReadBuffer[3].name  	 			:= 'NCR'; //UNSIGNED
			eplReadBuffer[3].index 	 			:= 16#2042; 
			eplReadBuffer[3].subindex 			:= 16#04;
			eplReadBuffer[3].measurementUnit	:= Amps;
			eplReadBuffer[3].pData				:= ADR(readData.NCR);
			
			eplReadBuffer[4].name  	 			:= 'COS'; //UNSIGNED
			eplReadBuffer[4].index 	 			:= 16#2042; 
			eplReadBuffer[4].subindex 			:= 16#07;
			eplReadBuffer[4].measurementUnit	:= Percent;
			eplReadBuffer[4].pData				:= ADR(readData.COSINE);
			
			eplReadBuffer[5].name  				:= 'NPR'; //UNSIGNED
			eplReadBuffer[5].index 	 			:= 16#2042; 
			eplReadBuffer[5].subindex 			:= 16#0E;
			eplReadBuffer[5].pData				:= ADR(readData.NPR);
			
			eplReadBuffer[6].name  	 			:= 'TUN'; //0 - no action, 1- tune, 2 - delete tuning
			eplReadBuffer[6].index 	 			:= 16#2042; 
			eplReadBuffer[6].subindex 			:= 16#09;
			eplReadBuffer[6].pData				:= ADR(readData.TUN);
			
			eplReadBuffer[7].name  	 			:= 'RSA'; //UNSIGNED
			eplReadBuffer[7].index 	 			:= 16#2042; 
			eplReadBuffer[7].subindex 			:= 16#2B;
			eplReadBuffer[7].pData				:= ADR(readData.RSA);
			
			eplReadBuffer[8].name  	 			:= 'LFA'; //UNSIGNED
			eplReadBuffer[8].index 	 			:= 16#2042; 
			eplReadBuffer[8].subindex 			:= 16#3F;
			eplReadBuffer[8].pData				:= ADR(readData.LFA);
			
			eplReadBuffer[9].name  	 			:= 'IDA'; //UNSIGNED
			eplReadBuffer[9].index 	 			:= 16#2042; 
			eplReadBuffer[9].subindex 			:= 16#35;
			eplReadBuffer[9].pData				:= ADR(readData.IDA);
			
			eplReadBuffer[10].name  	 		:= 'TRA'; //UNSIGNED
			eplReadBuffer[10].index 	 		:= 16#2042; 
			eplReadBuffer[10].subindex 			:= 16#44;
			eplReadBuffer[10].pData				:= ADR(readData.TRA);
			
			eplReadBuffer[11].name  	 		:= 'SFR'; //UNSIGNED
			eplReadBuffer[11].index 	 		:= 16#2001; 
			eplReadBuffer[11].subindex 			:= 16#03;
			eplReadBuffer[11].pData				:= ADR(readData.SFR);
			
			eplReadBuffer[12].name  	 		:= 'SFT'; //Enumeration - Heat Optimized (1), Noise Optimized (2)
			eplReadBuffer[12].index 	 		:= 16#2001; 
			eplReadBuffer[12].subindex 			:= 16#02;
			eplReadBuffer[12].pData				:= ADR(readData.SFT);
			
			eplReadBuffer[13].name  	 		:= 'NRD'; //Vary PWM period for Noise reduction- No (0), Yes (1)
			eplReadBuffer[13].index 	 		:= 16#2001; 
			eplReadBuffer[13].subindex 			:= 16#08;
			eplReadBuffer[13].pData				:= ADR(readData.NRD);
			
			(* Enumeration - (UUC)/Sensorless Flux Vector 	(0) 
							 (STD)/Standard 			  	(3)
							 (UF5)/ (V/F 5pts) 				(4)
							 (SYN)/ Synchronous motor		(5)
							 (UFQ)/ (V/F QUAD.) 			(6)
							 (NLD)/Energy Saving			(7)
			*)

			eplReadBuffer[14].name  	 		:= 'CTT';  //Enum see above
			eplReadBuffer[14].index 			:= 16#2042; 
			eplReadBuffer[14].subindex 			:= 16#08;
			eplReadBuffer[14].measurementUnit	:= Undefined;
			eplReadBuffer[14].pData				:= ADR(readData.CTT);
			
			//For STD
			eplReadBuffer[15].name  	 		:= 'SPGU'; //UNSIGNED
			eplReadBuffer[15].index 	 		:= 16#2042; 
			eplReadBuffer[15].subindex 			:= 16#1E;
			eplReadBuffer[15].datalen  			:= 16;
			eplReadBuffer[15].measurementUnit	:= Undefined;
			eplReadBuffer[15].pData				:= ADR(readData.SPGU);
			
			//For vector control
			eplReadBuffer[16].name  	 		:= 'SPG'; //UNSIGNED
			eplReadBuffer[16].index 	 		:= 16#203D; 
			eplReadBuffer[16].subindex 			:= 16#04;
			eplReadBuffer[16].pData				:= ADR(readData.SPG);
			
			eplReadBuffer[17].name  	 		:= 'FFH'; //UNSIGNED
			eplReadBuffer[17].index 	 		:= 16#203D; 
			eplReadBuffer[17].subindex 			:= 16#10;
			eplReadBuffer[17].pData				:= ADR(readData.FFH);
			
			
			eplReadBuffer[18].name  	 		:= 'CRTF'; //UNSIGNED
			eplReadBuffer[18].index 	 		:= 16#203D; 
			eplReadBuffer[18].subindex 			:= 16#11;
			eplReadBuffer[18].measurementUnit 	:= Seconds;
			eplReadBuffer[18].pData				:= ADR(readData.CRTF);
			
			eplReadBuffer[19].name  	 		:= 'SLP'; //UNSIGNED
			eplReadBuffer[19].index 	 		:= 16#2042; 
			eplReadBuffer[19].subindex 			:= 16#1A;
			eplReadBuffer[19].pData				:= ADR(readData.SLP);
			
			eplReadBuffer[20].name  	 		:= 'UFR'; //UNSIGNED
			eplReadBuffer[20].index 	 		:= 16#2042; 
			eplReadBuffer[20].subindex 			:= 16#18;
			eplReadBuffer[20].pData				:= ADR(readData.UFR);
			
			eplReadBuffer[21].name  	 		:= 'BOA'; //Boost Enum, 0 Boost inactive, 1 boost dynamic, 2 boost static
			eplReadBuffer[21].index 	 		:= 16#206D; 
			eplReadBuffer[21].subindex 			:= 16#B;
			eplReadBuffer[21].pData				:= ADR(readData.BOA);
			
			eplReadBuffer[22].name  	 		:= 'FAB'; //UNSIGNED
			eplReadBuffer[22].index 	 		:= 16#206D; 
			eplReadBuffer[22].subindex 			:= 16#0C;
			eplReadBuffer[22].pData				:= ADR(readData.FAB);
		
			eplReadBuffer[23].name  	 		:= 'BOO'; //SIGNED
			eplReadBuffer[23].index 	 		:= 16#206D; 
			eplReadBuffer[23].subindex 			:= 16#D;
			eplReadBuffer[23].pData				:= ADR(readData.BOO);
			
			//For Quadratic V/f
			eplReadBuffer[24].name  	 		:= 'PFL'; //UNSIGNED
			eplReadBuffer[24].index 	 		:= 16#2042; 
			eplReadBuffer[24].subindex			:= 16#19;
			eplReadBuffer[24].pData				:= ADR(readData.PFL);
			
			//For 5pts mode
			eplReadBuffer[25].name  	 		:= 'F1'; //UNSIGNED
			eplReadBuffer[25].index 	 		:= 16#205E; 
			eplReadBuffer[25].subindex 			:= 16#05;
			eplReadBuffer[25].pData				:= ADR(readData.F1);
			
			eplReadBuffer[26].name  	 		:= 'U1'; //UNSIGNED
			eplReadBuffer[26].index 	 		:= 16#205E; 
			eplReadBuffer[26].subindex 			:= 16#04;
			eplReadBuffer[26].pData				:= ADR(readData.U1);
			
			eplReadBuffer[27].name  			:= 'F2'; //UNSIGNED
			eplReadBuffer[27].index 	 		:= 16#205E; 
			eplReadBuffer[27].subindex 			:= 16#7;
			eplReadBuffer[27].pData				:= ADR(readData.F2);
			
			eplReadBuffer[28].name  	 		:= 'U2'; //UNSIGNED
			eplReadBuffer[28].index 	 		:= 16#205E; 
			eplReadBuffer[28].subindex 			:= 16#6;
			eplReadBuffer[28].pData				:= ADR(readData.U2);
			
			eplReadBuffer[29].name  	 		:= 'F3'; //UNSIGNED
			eplReadBuffer[29].index	 			:= 16#205E; 
			eplReadBuffer[29].subindex 			:= 16#09;
			eplReadBuffer[29].pData				:= ADR(readData.F3);
			
			eplReadBuffer[30].name  	 		:= 'U3'; //UNSIGNED
			eplReadBuffer[30].index 	 		:= 16#205E; 
			eplReadBuffer[30].subindex 			:= 16#08;
			eplReadBuffer[30].pData				:= ADR(readData.U3);
			
			eplReadBuffer[31].name  	 		:= 'F4'; //UNSIGNED
			eplReadBuffer[31].index 	 		:= 16#205E; 
			eplReadBuffer[31].subindex 			:= 16#0B;
			eplReadBuffer[31].pData				:= ADR(readData.F4);
			
			eplReadBuffer[32].name  	 		:= 'U4'; //UNSIGNED
			eplReadBuffer[32].index 	 		:= 16#205E; 
			eplReadBuffer[32].subindex 			:= 16#0A;
			eplReadBuffer[32].pData				:= ADR(readData.U4);
			
			eplReadBuffer[33].name  	 		:= 'F5'; //UNSIGNED
			eplReadBuffer[33].index 	 		:= 16#205E; 
			eplReadBuffer[33].subindex 			:= 16#D;
			eplReadBuffer[33].pData				:= ADR(readData.F5);
			
			eplReadBuffer[34].name  	 		:= 'U5'; //UNSIGNED
			eplReadBuffer[34].index 	 		:= 16#205E; 
			eplReadBuffer[34].subindex 			:= 16#C;
			eplReadBuffer[34].pData				:= ADR(readData.U5);
			
			//End 5pts mode params
			
			//For vector control
			eplReadBuffer[35].name  	 		:= 'SIT'; //UNSIGNED
			eplReadBuffer[35].index 	 		:= 16#203D; 
			eplReadBuffer[35].subindex 			:= 16#05;
			eplReadBuffer[35].pData				:= ADR(readData.SIT);
			
			eplReadBuffer[36].name  	 		:= 'SFC'; //UNSIGNED
			eplReadBuffer[36].index 	 		:= 16#203D; 
			eplReadBuffer[36].subindex 			:= 16#06;
			eplReadBuffer[36].pData				:= ADR(readData.SFC);
			// End for vec control
			
			//Hysteresis & skip freq.
			eplReadBuffer[37].name  	 		:= ' JFH'; //UNSIGNED
			eplReadBuffer[37].index 	 		:= 16#2053; 
			eplReadBuffer[37].subindex 			:= 16#0C;
			eplReadBuffer[37].pData				:= ADR(readData.JFH);
			
			eplReadBuffer[38].name  	 		:= 'JPF'; //UNSIGNED
			eplReadBuffer[38].index 	 		:= 16#2053; 
			eplReadBuffer[38].subindex 			:= 16#02;
			eplReadBuffer[38].pData				:= ADR(readData.JPF);
			
			eplReadBuffer[39].name  	 		:= 'JF2'; //UNSIGNED
			eplReadBuffer[39].index 	 		:= 16#2053; 
			eplReadBuffer[39].subindex 			:= 16#03;
			eplReadBuffer[39].pData				:= ADR(readData.JF2);
			
			eplReadBuffer[40].name  	 		:= 'JF3'; //UNSIGNED
			eplReadBuffer[40].index 	 		:= 16#2053; 
			eplReadBuffer[40].subindex 			:= 16#04;
			eplReadBuffer[40].pData				:= ADR(readData.JF3);
			//End hyst. & skip freq.
			
			//Acceleration values
			eplReadBuffer[41].name  	 		:= 'SPA'; //UNSIGNED
			eplReadBuffer[41].index 	 		:= 16#2038; 
			eplReadBuffer[41].subindex 			:= 16#0C;
			eplReadBuffer[41].pData				:= ADR(readData.SPA);
			
			eplReadBuffer[42].name  	 		:= 'SPAT'; //UNSIGNED
			eplReadBuffer[42].index 	 		:= 16#2038; 
			eplReadBuffer[42].subindex 			:= 16#03;
			eplReadBuffer[42].pData				:= ADR(readData.SPAT);
			
			eplReadBuffer[43].name  	 		:= 'SPD'; //UNSIGNED
			eplReadBuffer[43].index 	 		:= 16#2038; 
			eplReadBuffer[43].subindex 			:= 16#0F;
			eplReadBuffer[43].pData				:= ADR(readData.SPD);
			
			eplReadBuffer[44].name  	 		:= 'SPDT'; //UNSIGNED
			eplReadBuffer[44].index 	 		:= 16#2038; 
			eplReadBuffer[44].subindex 			:= 16#11;
			eplReadBuffer[44].pData				:= ADR(readData.SPDT);
			
			eplReadBuffer[45].name  	 		:= 'RPT'; //Enum - Linear Ramp (0), S-ramp (1), U-Ramp (2), Customized (3)
			eplReadBuffer[45].index 	 		:= 16#203C; 
			eplReadBuffer[45].subindex 			:= 16#05;
			eplReadBuffer[45].pData				:= ADR(readData.RPT);
			//End accel values
			
			//DC injection braking
			eplReadBuffer[46].name  	 		:= 'ADC'; //Enum - No DC inject(0), Yes (1), Continuous DC inj brake (2)
			eplReadBuffer[46].index 	 		:= 16#204A; 
			eplReadBuffer[46].subindex 			:= 16#02;
			eplReadBuffer[46].pData				:= ADR(readData.ADC);
			
			eplReadBuffer[47].name  	 		:= 'FLR'; //Enum - catch spinning loads No(0), yes(1)
			eplReadBuffer[47].index 	 		:= 16#2001; 
			eplReadBuffer[47].subindex 			:= 16#0B;
			eplReadBuffer[47].pData				:= ADR(readData.FLR);
			
			eplReadBuffer[48].name  	 		:= 'SDC1'; //UNSIGNED
			eplReadBuffer[48].index 	 		:= 16#204A; 
			eplReadBuffer[48].subindex 			:= 16#04;
			eplReadBuffer[48].pData				:= ADR(readData.SDC1);
			
			eplReadBuffer[49].name  	 		:= 'TDC1'; //UNSIGNED
			eplReadBuffer[49].index 	 		:= 16#204A; 
			eplReadBuffer[49].subindex 			:= 16#03;
			eplReadBuffer[49].pData				:= ADR(readData.TDC1);
			
			eplReadBuffer[50].name  	 		:= 'SDC2'; //UNSIGNED
			eplReadBuffer[50].index 	 		:= 16#204A; 
			eplReadBuffer[50].subindex 			:= 16#06;
			eplReadBuffer[50].pData				:= ADR(readData.SDC2);
			
			eplReadBuffer[51].name  	 		:= 'TDC2'; //UNSIGNED
			eplReadBuffer[51].index 	 		:= 16#204A; 
			eplReadBuffer[51].subindex 			:= 16#05;
			eplReadBuffer[51].pData				:= ADR(readData.TDC2);
			
			eplReadBuffer[52].name  	 		:= 'BRA'; //Enum - Braking cmd transistor(No) (0), Dec ramp adapt assinged (YES) (1), Dynamic high torque (2)
			eplReadBuffer[52].index 	 		:= 16#203C; 
			eplReadBuffer[52].subindex 			:= 16#04;
			eplReadBuffer[52].pData				:= ADR(readData.BRA);
			
			eplReadBuffer[53].name  	 		:= 'DCF'; //UNSIGNED
			eplReadBuffer[53].index 	 		:= 16#2052; 
			eplReadBuffer[53].subindex 			:= 16#1F;
			eplReadBuffer[53].pData				:= ADR(readData.DCF);
			
			eplReadBuffer[54].name  	 		:= 'IDC'; //UNSIGNED
			eplReadBuffer[54].index 	 		:= 16#2052; 
			eplReadBuffer[54].subindex 			:= 16#0B;
			eplReadBuffer[54].pData				:= ADR(readData.IDC);
			
			eplReadBuffer[55].name  	 		:= 'TDI'; //UNSIGNED
			eplReadBuffer[55].index 	 		:= 16#2052; 
			eplReadBuffer[55].subindex 			:= 16#0E;
			eplReadBuffer[55].pData				:= ADR(readData.TDI);
			
			eplReadBuffer[56].name  	 		:= 'IDC2'; //UNSIGNED
			eplReadBuffer[56].index 	 		:= 16#2052; 
			eplReadBuffer[56].subindex 			:= 16#0D;
			eplReadBuffer[56].pData				:= ADR(readData.IDC2);
			
			eplReadBuffer[57].name  	 		:= 'TDC'; //UNSIGNED
			eplReadBuffer[57].index 	 		:= 16#2052; 
			eplReadBuffer[57].subindex 			:= 16#0C;
			eplReadBuffer[57].pData				:= ADR(readData.TDC);
			
			//Load management
			eplReadBuffer[58].name  	 		:= 'ULT';	//UNSIGNED
			eplReadBuffer[58].index 	 		:= 16#2072; 
			eplReadBuffer[58].subindex 			:= 16#0C;
			eplReadBuffer[58].pData				:= ADR(readData.ULT);
			
			eplReadBuffer[59].name  	 		:= 'LUL';  //UNSIGNED
			eplReadBuffer[59].index 	 		:= 16#2072; 
			eplReadBuffer[59].subindex 			:= 16#10;
			eplReadBuffer[59].pData				:= ADR(readData.LUL);
			
			eplReadBuffer[60].name  	 		:= 'RMUD';
			eplReadBuffer[60].index 	 		:= 16#2072; 
			eplReadBuffer[60].subindex 			:= 16#0F;
			eplReadBuffer[60].pData				:= ADR(readData.RMUD);
			
			eplReadBuffer[61].name  	 		:= 'LUN';
			eplReadBuffer[61].index 	 		:= 16#2072; 
			eplReadBuffer[61].subindex 			:= 16#11;
			eplReadBuffer[61].pData				:= ADR(readData.LUN);
			
			eplReadBuffer[62].name  	 		:= 'FTU';
			eplReadBuffer[62].index 	 		:= 16#2072; 
			eplReadBuffer[62].subindex 			:= 16#0E;
			eplReadBuffer[62].pData				:= ADR(readData.FTU);
			
			eplReadBuffer[63].name  	 		:= 'TOL';
			eplReadBuffer[63].index 	 		:= 16#2072; 
			eplReadBuffer[63].subindex 			:= 16#16;
			eplReadBuffer[63].pData				:= ADR(readData.U3);
			
			eplReadBuffer[64].name  	 		:= 'LOC'; //UNSIGNED
			eplReadBuffer[64].index 	 		:= 16#2072; 
			eplReadBuffer[64].subindex 			:= 16#1A;
			eplReadBuffer[64].pData				:= ADR(readData.LOC);
			
			eplReadBuffer[65].name  	 		:= 'FTO'; //UNSIGNED
			eplReadBuffer[65].index 			:= 16#2072; 
			eplReadBuffer[65].subindex 			:= 16#18;
			eplReadBuffer[65].pData				:= ADR(readData.FTO);
			//end load management
			
			//Thermals
			
			eplReadBuffer[66].name  	 		:= 'ITH'; //UNSIGNED
			eplReadBuffer[66].index 	 		:= 16#2042; 
			eplReadBuffer[66].subindex 			:= 16#17;
			eplReadBuffer[66].pData				:= ADR(readData.ITH);
			
			eplReadBuffer[67].name  	 		:= 'I2TA'; //Enumeration - 0 (no), 1 (yes)
			eplReadBuffer[67].index 	 		:= 16#2042; 
			eplReadBuffer[67].subindex 			:= 16#20;
			eplReadBuffer[67].pData				:= ADR(readData.I2TA);
			//end thermals
		
			//Mains voltage monitoring
			
			eplReadBuffer[68].name  	 		:= 'MAINS'; //UNSIGNED 0.0V..6553.5V
			eplReadBuffer[68].index 	 		:= 16#2002; 
			eplReadBuffer[68].subindex 			:= 16#08;
			eplReadBuffer[68].pData				:= ADR(readData.MAINS);
			
			startupstate := COPY;
			
			//Additional monitoring
			
			eplReadBuffer[69].name  	 		:= 'OTR'; //Motor Torque % -3276.7% .. 3276.7%
			eplReadBuffer[69].index 	 		:= 16#2042; 
			eplReadBuffer[69].subindex 			:= 16#20;
			eplReadBuffer[69].measurementUnit	:= Percent;	
			eplReadBuffer[69].pData				:= ADR(readData.OTR);

			(* Synchronous Motor Parameters *)

			//Pole pairs

			eplReadBuffer[70].name  	 		:= 'AST'; //Enum - Braking cmd transistor(No) (0), Dec ramp adapt assinged (YES) (1), Dynamic high torque (2)
			eplReadBuffer[70].index 	 		:= 16#2042; 
			eplReadBuffer[70].subindex 			:= 16#49;
			eplReadBuffer[70].measurementUnit	:= Undefined;	
			eplReadBuffer[70].pData				:= ADR(readData.PPNS);

			//Sync speed

			eplReadBuffer[71].name  	 		:= 'NSPS'; //Synchronous nominal speed
			eplReadBuffer[71].index 	 		:= 16#2042; 
			eplReadBuffer[71].subindex 			:= 16#48;
			eplReadBuffer[71].measurementUnit	:= RPM;	
			eplReadBuffer[71].pData				:= ADR(readData.NSPS);

			//Sync speed

			eplReadBuffer[72].name  	 		:= 'NCRS'; //Synchronous nominal current
			eplReadBuffer[72].index 	 		:= 16#2042; 
			eplReadBuffer[72].subindex 			:= 16#47;
			eplReadBuffer[72].measurementUnit	:= Amps;	
			eplReadBuffer[72].pData				:= ADR(readData.NCRS);
		
			eplReadBuffer[73].name  	 		:= 'TQS'; //Synchronous motor torque
			eplReadBuffer[73].index 	 		:= 16#2042; 
			eplReadBuffer[73].subindex 			:= 16#55;
			eplReadBuffer[73].measurementUnit	:= NewtonMeter;	
			eplReadBuffer[73].pData				:= ADR(readData.TQS);

			eplReadBuffer[74].name  	 		:= 'RSAS'; //Synchronous motor stator resistance
			eplReadBuffer[74].index 	 		:= 16#2042; 
			eplReadBuffer[74].subindex 			:= 16#53;
			eplReadBuffer[74].measurementUnit	:= Ohm;	
			eplReadBuffer[74].pData				:= ADR(readData.RSAS);

			eplReadBuffer[75].name  	 		:= 'LDS'; //Synchronous motor stator resistance
			eplReadBuffer[75].index 	 		:= 16#2042; 
			eplReadBuffer[75].subindex 			:= 16#4B;
			eplReadBuffer[75].measurementUnit	:= Millihenry;	
			eplReadBuffer[75].pData				:= ADR(readData.LDS);

			eplReadBuffer[76].name  	 		:= 'LQS'; //Synchronous motor stator resistance
			eplReadBuffer[76].index 	 		:= 16#2042; 
			eplReadBuffer[76].subindex 			:= 16#4C;
			eplReadBuffer[76].measurementUnit	:= Millihenry;	
			eplReadBuffer[76].pData				:= ADR(readData.LQS);

			eplReadBuffer[77].name  	 		:= 'PHS'; //Synchronous motor stator resistance
			eplReadBuffer[77].index 	 		:= 16#2042; 
			eplReadBuffer[77].subindex 			:= 16#4A;
			eplReadBuffer[77].measurementUnit	:= Undefined; 		// mV/rpm or V/1000rpm	
			eplReadBuffer[77].pData				:= ADR(readData.PHS);

		COPY:
			//Assign the same addresses to the write buffer
		
			FOR i := 0  TO MAXINDEX DO
				eplWriteBuffer[i].name  		:= eplReadBuffer[i].name;
				eplWriteBuffer[i].index 		:= eplReadBuffer[i].index;
				eplWriteBuffer[i].subindex		:= eplReadBuffer[i].subindex;
				
				//Read and write all parameters by default
				readBools[i] := TRUE;
				writeBools[i] := TRUE;
			END_FOR
			
			//Assign links to writeBuffer
			
			eplWriteBuffer[0].pData				:= ADR(writeData.NSP);
			eplWriteBuffer[1].pData				:= ADR(writeData.FRS);
			eplWriteBuffer[2].pData				:= ADR(writeData.UNS);
			eplWriteBuffer[3].pData				:= ADR(writeData.NCR);
			eplWriteBuffer[4].pData				:= ADR(writeData.COSINE);
			eplWriteBuffer[5].pData				:= ADR(writeData.NPR);
			eplWriteBuffer[6].pData				:= ADR(writeData.TUN);
			eplWriteBuffer[7].pData				:= ADR(writeData.RSA);
			eplWriteBuffer[8].pData				:= ADR(writeData.LFA);
			eplWriteBuffer[9].pData				:= ADR(writeData.IDA);
			eplWriteBuffer[10].pData			:= ADR(writeData.TRA);
			eplWriteBuffer[11].pData			:= ADR(writeData.SFR);
			eplWriteBuffer[12].pData			:= ADR(writeData.SFT);
			eplWriteBuffer[13].pData			:= ADR(writeData.NRD);
			eplWriteBuffer[14].pData			:= ADR(writeData.CTT);
			eplWriteBuffer[15].pData			:= ADR(writeData.SPGU);
			eplWriteBuffer[16].pData			:= ADR(writeData.SPG);
			eplWriteBuffer[17].pData			:= ADR(writeData.FFH);
			eplWriteBuffer[18].pData			:= ADR(writeData.CRTF);
			eplWriteBuffer[19].pData			:= ADR(writeData.SLP);
			eplWriteBuffer[20].pData			:= ADR(writeData.UFR);
			eplWriteBuffer[21].pData			:= ADR(writeData.BOA);
			eplWriteBuffer[22].pData			:= ADR(writeData.FAB);
			eplWriteBuffer[23].pData			:= ADR(writeData.BOO);
			eplWriteBuffer[24].pData			:= ADR(writeData.PFL);
			eplWriteBuffer[25].pData			:= ADR(writeData.F1);
			eplWriteBuffer[26].pData			:= ADR(writeData.U1);
			eplWriteBuffer[27].pData			:= ADR(writeData.F2);
			eplWriteBuffer[28].pData			:= ADR(writeData.U2);
			eplWriteBuffer[29].pData			:= ADR(writeData.F3);
			eplWriteBuffer[30].pData			:= ADR(writeData.U3);
			eplWriteBuffer[31].pData			:= ADR(writeData.F4);
			eplWriteBuffer[32].pData			:= ADR(writeData.U4);
			eplWriteBuffer[33].pData			:= ADR(writeData.F5);
			eplWriteBuffer[34].pData			:= ADR(writeData.U5);
			eplWriteBuffer[35].pData			:= ADR(writeData.SIT);
			eplWriteBuffer[36].pData			:= ADR(writeData.SFC);
			eplWriteBuffer[37].pData			:= ADR(writeData.JFH);
			eplWriteBuffer[38].pData			:= ADR(writeData.JPF);
			eplWriteBuffer[39].pData			:= ADR(writeData.JF2);
			eplWriteBuffer[40].pData			:= ADR(writeData.JF3);
			eplWriteBuffer[41].pData			:= ADR(writeData.SPA);
			eplWriteBuffer[42].pData			:= ADR(writeData.SPAT);
			eplWriteBuffer[43].pData			:= ADR(writeData.SPD);
			eplWriteBuffer[44].pData			:= ADR(writeData.SPDT);
			eplWriteBuffer[45].pData			:= ADR(writeData.RPT);
			eplWriteBuffer[46].pData			:= ADR(writeData.ADC);
			eplWriteBuffer[47].pData			:= ADR(writeData.FLR);
			eplWriteBuffer[48].pData			:= ADR(writeData.SDC1);
			eplWriteBuffer[49].pData			:= ADR(writeData.TDC1);
			eplWriteBuffer[50].pData			:= ADR(writeData.SDC2);
			eplWriteBuffer[51].pData			:= ADR(writeData.TDC2);
			eplWriteBuffer[52].pData			:= ADR(writeData.BRA);
			eplWriteBuffer[53].pData			:= ADR(writeData.DCF);
			eplWriteBuffer[54].pData			:= ADR(writeData.IDC);
			eplWriteBuffer[55].pData			:= ADR(writeData.TDI);
			eplWriteBuffer[56].pData			:= ADR(writeData.IDC2);
			eplWriteBuffer[57].pData			:= ADR(writeData.TDC);
			eplWriteBuffer[58].pData			:= ADR(writeData.ULT);
			eplWriteBuffer[59].pData			:= ADR(writeData.LUL);
			eplWriteBuffer[60].pData			:= ADR(writeData.RMUD);
			eplWriteBuffer[61].pData			:= ADR(writeData.LUN);
			eplWriteBuffer[61].pData			:= ADR(writeData.FTU);
			eplWriteBuffer[63].pData			:= ADR(writeData.TOL);
			eplWriteBuffer[64].pData			:= ADR(writeData.LOC);
			eplWriteBuffer[65].pData			:= ADR(writeData.FTO);
			eplWriteBuffer[66].pData			:= ADR(writeData.ITH);
			eplWriteBuffer[67].pData			:= ADR(writeData.I2TA);
			eplWriteBuffer[68].pData			:= ADR(writeData.OTR);
			eplWriteBuffer[69].pData			:= ADR(writeData.MAINS);
			eplWriteBuffer[70].pData			:= ADR(writeData.PPNS);
			eplWriteBuffer[71].pData			:= ADR(writeData.NSPS);
			eplWriteBuffer[72].pData			:= ADR(writeData.NCRS);
			eplWriteBuffer[73].pData			:= ADR(writeData.TQS);
			eplWriteBuffer[74].pData			:= ADR(writeData.RSAS);
			eplWriteBuffer[75].pData			:= ADR(writeData.LDS);
			eplWriteBuffer[76].pData			:= ADR(writeData.LQS);
			eplWriteBuffer[77].pData			:= ADR(writeData.PHS);


			
			i := 0;
			startupstate := FIRSTREAD;
			
		FIRSTREAD:

		eplReadBlock.enable 	:= TRUE;
		eplReadBlock.index 		:= eplReadBuffer[i].index;
		eplReadBlock.subindex 	:= eplReadBuffer[i].subindex;
		eplReadBlock.node  		:= hmiCom.NodeNumber;
		eplReadBlock.pData 		:= eplReadBuffer[i].pData;
		eplReadBlock.datalen 	:= SIZEOF(readData.ADC);	//Any will do since the max is 2 bytes

		IF eplReadBlock.status = 0 THEN
			eplReadBlock.enable := 0;
			i := i + 1;
		END_IF

		IF i = MAXINDEX THEN
			eplReadBlock.enable := FALSE;
			hmiCom.ReadWriteBuffer := readData;
			startupstate := DONE;
		END_IF

		eplReadBlock();

		DONE:

			startupDone := TRUE;
		
	END_CASE
	
	
	
	
	
END_ACTION
