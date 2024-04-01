
ACTION stringhandling: 

		//Inverter Model
		
		//Motor Type

		hmiCom.selectedMotorINT := STRING_TO_USINT(hmiCom.selectedMotorType);
	
		//Monitored Units
		
		
		FOR k := 0  TO 7 DO
			CASE hmiCom.Params.UnitMonitoring.Units[i].Unit OF
		
			UNDEFINED:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Undefined';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#0;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#0;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			HMIS:
				//A bunch of different HMIS in the sheet, using the first
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Device specific error code';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#202B;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#16;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			ETI:
				//A bunch of different ETI in the sheet, using the first
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Internal status word';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#202A;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#15;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			THR:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Thermal status of motor (i^2 * t)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2042;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#1F;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			THD:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Thermal status of drive [%]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#0A;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			I2TM:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Overcurrent status of motor (I^2 * t)[%]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2042;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#23;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			PTCI:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of PTC on DI6';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2066;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#04;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			ALGROUP:
				//Not sure this exists on the drive, link through IO mapping
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of user defined alarm groups';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#0;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#0;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			STOS:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of STO (safe torque off)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#0;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#0;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			SS1S:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of SS1 (safe speed 1)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#207B;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#10;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			SLSS:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of SLS (safely limit speed)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#207B;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#05;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			SMSS:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of SMS (safe maximum speed)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#207B;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#055;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			GDLS:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of GDL (guard door locking)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#207B;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#05E;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			ETAD:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Drive Status Word';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2038;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#04;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			RFR:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Frequency value [Hz] (PWM output)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#03;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Hz;
			SRFR:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Unfiltered raw value of RFR [Hz]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2038;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#04;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Hz;
			FRO:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Frequency reference after a ramp [Hz] (value for PWM control)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#203C;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#16;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Hz;
			FRH:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Frequency reference after n limitation [Hz] (value before ramp)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#203C;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#16;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Hz;
			FRHD:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Speed reference after n limitation [rpm]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2039;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#06;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= RPM;
			OTR:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Torque [%] (according to DS402)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#06;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Percent;
			SOTR:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Unfiltered incremental value of OTR';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#1B;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Percent;
			OTRN:
				//Doesn't exist on drive, link through IO mapping
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Torque in Newton-meters';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#0;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#0;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= NewtonMeter;
			UOP:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Voltage [V] (PWM output)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#09;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Volts;
			LCR:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Current [A] (PWM output)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#05;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Amps;
			SLCR:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Unfiltered raw value of LCR [A]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#19;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Amps;
			OPR:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Power [%] (PWM output)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#0C;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Percent;
			SOPR:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'unfiltered raw value of OPR [%]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#5B;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Percent;
			ULN:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Mains voltage level [V]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#08;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Volts;
			SULN:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Unfiltered raw valueof ULN [V]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2002;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#1E;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Volts;
			AI1R:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Analog Input 1';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2016;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#21;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			AI2R:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Analog Input 2';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2016;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#22;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			AI3R:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Analog Input 3';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2016;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#23;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			IL1R:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of digital inputs';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2016;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#03;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			HSC:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Edge counter on DI5 (High Speed Counter)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2067;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#09;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			PIFR:
				//Doesn't exist on Schneider Side, pull from I/O map
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Pulse input on DI5 [0 .. 8192]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#0;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#0;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			PFRC:
				//Doesn't exist on Schneider Side, pull from I/O map
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Pulse input on DI5 [Hz]';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#0;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#0;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			FQS:
				//Doesn't exist on Schneider Side, pull from I/O map
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Frequency meter on DI5 [Hz] (processed value)';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#74;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#04;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			AO1I:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of analog output 1';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2016;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#48;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			OL1I:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Status word of digital outputs';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2016;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#0D;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Undefined;
			NCRS:
				hmiCom.Params.UnitMonitoring.Units[k].String 			:= 'Nominal sync current';
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkIndex 	:= 16#2042;
				hmiCom.Params.UnitMonitoring.Units[k].PowerlinkSubindex := 16#47;
				hmiCom.Params.UnitMonitoring.MeasurementUnit 			:= Amps;
			END_CASE
	END_FOR	
	
	//I/O mapp Word Variables
	
	//Two-way bindings for data providers

CASE aststate OF
	NOCHANGE:
		IF NOT (hmiCom.selectedAstValue = oldAstVis) THEN
			aststate := VISCHANGE;
		ELSIF NOT hmiCom.ReadWriteBuffer.AST = oldAstDrive THEN
			aststate := DRIVECHANGE;
		END_IF
	oldAstVis := hmiCom.selectedAstValue;
	oldAstDrive := hmiCom.ReadWriteBuffer.AST;
	VISCHANGE:
		hmiCom.ReadWriteBuffer.AST := STRING_TO_UINT(hmiCom.selectedAstValue);		
		oldAstVis := hmiCom.selectedAstValue;
		oldAstDrive := hmiCom.ReadWriteBuffer.AST;
		aststate := NOCHANGE;
	DRIVECHANGE:	
		hmiCom.selectedAstValue := UINT_TO_STRING(hmiCom.ReadWriteBuffer.AST);
		oldAstVis := hmiCom.selectedAstValue;
		oldAstDrive := hmiCom.ReadWriteBuffer.AST;
		aststate := NOCHANGE;
END_CASE
	
	
END_ACTION
