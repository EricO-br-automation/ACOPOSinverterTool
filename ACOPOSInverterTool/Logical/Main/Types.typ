(**********************************HMI VARIABLES***********************************************************)

TYPE
	hmiCommTyp : 	STRUCT  (*HMI communication structure*)
		ReadWriteBuffer : DataBufferTyp; (*Command to write*)
		InverterModel : invertermodel_enum;
		InverterModelInt : USINT;
		InverterModelString : STRING[20];
		MotorType : motortype_enum;
		PowerLinkPathDefault : BOOL; (*Set to true if there's only 1 powerlink interface on the PC*)
		PowerLinkPath : powerlinkPathTyp;
		NodeNumber : USINT; (*Node number of ACOPOS Inverter*)
		Params : paramsTyp; (*Data used in ParamsContent*)
		cmd : hmiCmdTyp;
		status : hmiStatusTyp;
		unitMonitoring : unitMonitoringTyp;
		Writing : BOOL;
		Reading : BOOL;
		selectedNRDIndex : USINT;
		selectedSFTValue : STRING[3];
		selectedSTFInt : USINT;
		selectedCFTValue : STRING[3];
		selectedCFTInt : USINT;
		selectedCTTValue : STRING[3];
		selectedCTTint : USINT;
		selectedAstValue : STRING[3];
		selectedInverter : STRING[80];
		selectedInverterINT : USINT;
		selectedMotorType : STRING[3];
		selectedMotorINT : USINT;
	END_STRUCT;
	invertermodel_enum : 
		( (*ACOPOS Inverter Model enumeration*)
		P66 := 66,
		P76 := 76,
		P86 := 86
		);
	motortype_enum : 
		(
		Asynchronous := 0,
		Synchronous := 1
		);
	powerlinkPathTyp : 	STRUCT  (*Carries path strings to build "SL<x>.SS<y>.IF<Z>"*)
		SLnumber : STRING[8]; (*SLx*)
		SSnumber : STRING[8]; (*SSy*)
		IFnumber : STRING[8]; (*IFz*)
	END_STRUCT;
	hmiCmdTyp : 	STRUCT 
		Speed : INT;
		ActualSpeed : INT;
		Freq : INT;
		ActualFreq : INT;
		CMDD : UINT;
		loadParams : BOOL;
		saveParams : BOOL;
		Reset : BOOL;
	END_STRUCT;
	hmiStatusTyp : 	STRUCT 
		ERRD : STRING[20];
		ETAD : STRING[20];
		FirmwareVersion : STRING[20];
		readInpr : BOOL;
		writeInpr : BOOL;
		ReadDone : USINT;
		WriteDone : USINT;
	END_STRUCT;
END_TYPE

(**********************************State Enumerations*********************************************************)

TYPE
	state_enum : 
		(
		WAIT,
		RUN,
		GLOBALERROR
		);
	runstate_enum : 
		(
		WAITING,
		READING,
		WRITING
		);
	startupstate_enum : 
		(
		INITIALIZE,
		COPY,
		FIRSTREAD,
		DONE
		);
	readstate_enum : 
		(
		READPARAMS,
		ITERATEREADCOUNT,
		READERROR
		);
	writestate_enum : 
		(
		WRITEPARAMS,
		ITERATEWRITECOUNT,
		WRITEERROR,
		ALGR (*Status word of user defined alarm groups*)
		);
END_TYPE

(**********************************Parameter Structures******************************************************)

TYPE
	eplParTyp : 	STRUCT 
		index : UINT; (*Number of the index entry to be written.
*)
		subindex : USINT; (*Number of the subindex entry to be written.
*)
		pData : UDINT; (*Pointer to the data to be written. This data must remain constant as long as the function block returns ERR_BUSY.
*)
		datalen : UDINT; (*Length of the data to be written.
*)
		status : UINT; (*Error number (0 = no error). 
*)
		errorinfo : UDINT; (*SDO Abort Code (if status = ERR_ASEPL_ACCESS_FAILED)
*)
		name : STRING[50]; (*Name of Parameter*)
		measurementUnit : measurementunit_enum; (*Unit of measurement for the data*)
		conversionFactor : REAL; (*Conversion factor from data to measurement unit*)
	END_STRUCT;
	DataBufferTyp : 	STRUCT 
		NSP : UINT;
		FRS : UINT;
		UNS : UINT;
		NCR : UINT;
		COSINE : UINT;
		NPR : UINT;
		TUN : WORD; (*0 - no action, 1- tune, 2 - delete tuning*)
		RSA : UINT;
		LFA : UINT;
		IDA : UINT;
		TRA : UINT;
		SFR : UINT;
		SFT : WORD; (*Heat Optimized (1), Noise Optimized (2)*)
		NRD : USINT; (*Vary PWM period for Noise reduction- No (0), Yes (1)*)
		CTT : WORD; (*(UUC)/Sensorless Flux Vector 	(0) 
							 (STD)/Standard 			  	(3)
							 (UF5)/ (V/F 5pts) 				(4)
							 (SYN)/ Synchronous motor		(5)
							 (UFQ)/ (V/F QUAD.) 			(6)
							 (NLD)/Energy Saving			(7)*)
		SPGU : UINT; (*For Standard mode: *)
		SPG : UINT; (*For Vector control:*)
		FFH : UINT;
		CRTF : UINT;
		SLP : UINT;
		UFR : UINT;
		BOA : WORD; (*Boost Enum, 0 Boost inactive, 1 boost dynamic, 2 boost static*)
		FAB : UINT;
		BOO : INT;
		PFL : UINT;
		F1 : UINT;
		U1 : UINT;
		F2 : UINT;
		U2 : UINT;
		F3 : UINT;
		U3 : UINT;
		F4 : UINT;
		U4 : UINT;
		F5 : UINT;
		U5 : UINT;
		SIT : UINT;
		SFC : UINT;
		JFH : UINT;
		JPF : UINT;
		JF2 : UINT;
		JF3 : UINT;
		SPA : UINT;
		SPAT : UINT;
		SPD : UINT;
		SPDT : UINT;
		RPT : WORD; (*Enum - Linear Ramp (0), S-ramp (1), U-Ramp (2), Customized (3)*)
		ADC : WORD; (*Enum - No DC inject(0), Yes (1), Continuous DC inj brake (2)*)
		FLR : WORD; (*Enum - catch spinning loads No(0), yes(1)*)
		SDC1 : UINT;
		TDC1 : UINT;
		SDC2 : UINT;
		TDC2 : UINT;
		BRA : WORD; (*Enum - Braking cmd transistor(No) (0), Dec ramp adapt assinged (YES) (1), Dynamic high torque (2)*)
		DCF : UINT;
		IDC : UINT;
		TDI : USINT;
		IDC2 : UINT;
		TDC : UINT;
		ULT : UINT;
		LUL : UINT;
		RMUD : UINT;
		LUN : UINT;
		FTU : UINT;
		TOL : UINT;
		LOC : UINT;
		FTO : UINT;
		ITH : UINT;
		I2TA : UINT; (*Enumeration - 0 (no), 1 (yes)*)
		OTR : USINT; (*Monitored Value for Torque*)
		MAINS : UINT;
		PPNS : UINT; (*Synchronous Motor Pole Pair*)
		NSPS : UINT; (*Sync motor speed*)
		NCRS : UINT; (*Sync motor current*)
		TQS : UINT; (*Sync motor torque*)
		RSAS : UINT; (*Stator resistance (Sync)*)
		LDS : UINT; (*Direct inductance (Sync)*)
		LQS : UINT; (*Quadrature Inductance (Sync)*)
		PHS : UINT; (*Sync EMF (Voltage) constant*)
		AST : UINT; (*Synchronous Motor Construction Type*)
	END_STRUCT;
	paramsTyp : 	STRUCT 
		UnitMonitoring : unitMonitoringTyp; (*Datapoints used in Units/Monitoring tab*)
	END_STRUCT;
	unitMonitoringTyp : 	STRUCT 
		MeasurementUnit : measurementunit_enum;
		Units : ARRAY[0..7]OF unitTyp;
	END_STRUCT;
	unitTyp : 	STRUCT 
		Unit : unit_enum; (*Unit being monitored*)
		String : STRING[80]; (*String of Description*)
		PowerlinkIndex : UINT; (*Powerlink Index*)
		PowerlinkSubindex : UINT; (*Powerlink Subindex*)
	END_STRUCT;
	measurementunit_enum : 
		(
		Undefined := 0,
		Hz := 1, (*Hertz*)
		RPM := 2, (*RPM*)
		Volts := 3, (*Volts*)
		Amps := 4, (*Amperes*)
		Percent := 5, (*%*)
		NewtonMeter := 6, (*Newton-Meter*)
		Seconds := 7, (*Seconds*)
		Ohm := 8, (*Ohm*)
		Millihenry := 9 (*mH*)
		);
	unit_enum : 
		( (*Enumeration containing the units that can be monitored on the inverter*)
		UNDEFINED, (*undefined*)
		HMIS, (*Device specific error code*)
		ETI, (*Internal status word*)
		THR, (*Thermal status of motor (i^2 * t)*)
		THD, (*Thermal status of drive [%]*)
		I2TM, (*Overcurrent status of motor (I^2 * t)[%]*)
		PTCI, (*Status word of PTC on DI6*)
		ALGROUP, (*Status word of user defined alarm groups*)
		STOS, (*Status word of STO (safe torque off)*)
		SS1S, (*Status word of SS1 (safe speed 1)*)
		SLSS, (*Status word of SLS (safely limit speed)*)
		SMSS, (*Status word of SMS (safe maximum speed)*)
		GDLS, (*Status word of GDL (guard door locking)*)
		ETAD, (*Status word (as BOOL)*)
		RFR, (*Frequency value [Hz] (PWM output)*)
		SRFR, (*unfiltered raw value of RFR [Hz]*)
		FRO, (*Frequency reference after a ramp [Hz] (value for PWM control)*)
		FRH, (*Frequency reference after n limitation [Hz] (value before ramp)*)
		FRHD, (*Speed reference after n limitation [rpm]*)
		OTR, (*Torque [%] (according to DS402)*)
		SOTR, (*unfiltered incremental value of OTR*)
		OTRN, (*Torque [Nm]*)
		UOP, (*Voltage [V] (PWM output) *)
		LCR, (*Current [A] (PWM output)*)
		SLCR, (*unfiltered raw value of LCR [A]*)
		OPR, (*Power [%] (PWM output)*)
		SOPR, (*unfiltered raw value of OPR [%]*)
		ULN, (*Mains voltage level [V]*)
		SULN, (*unfiltered raw valueof ULN [V]*)
		AI1R, (*Status word of analog input 1*)
		AI1RUINT, (*Status word (as UINT)*)
		AI2R, (*Status word of analog input 2*)
		AI2RUINT, (*Status word (as UINT)*)
		AI3R, (*Status word of analog input 3*)
		AI3RUINT, (*Status word (as UINT)*)
		IL1R, (*Status word of digital inputs*)
		IL1RBOOL, (*Status word (as BOOL)*)
		HSC, (*Edge counter on DI5*)
		PIFR, (*Pulse input on DI5 [0 .. 8192]*)
		PFRC, (*Pulse input on DI5 [Hz] *)
		FQS, (*Frequency meter on DI5 [Hz] (processed value)*)
		AO1I, (*Status word of analog output 1*)
		OL1I, (*Status word of digital outputs*)
		OL1IBOOL, (*Status word (as BOOL)*)
		NCRS (*Set to NCR(S) (motor nominal current)*)
		);
	ast_change_enum : 
		(
		NOCHANGE,
		VISCHANGE,
		DRIVECHANGE
		);
END_TYPE

(***********************************Parameter enumerations************************************************)
