//
//  MsgHeaders.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-31.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#ifndef GSMAlarmSystem_MsgHeaders_h
#define GSMAlarmSystem_MsgHeaders_h


#define kGSM_MC_ABANDON                 @"2"
#define kGSM_MC_DEPLOYMENT              @"1"
#define kGSM_MC_TAKE_MSG                @"61"
#define kGSM_MC_HOME                    @"0"
#define kGSM_MC_SOS                     @"62"
#define kGSM_MC_MSG_ON                  @"7"
#define kGSM_MC_MSG_OFF                 @"8"
#define kGSM_MC_QUERY                   @"9"
#define kGSM_MC_SPEAKER_ON              @"5"
#define kGSM_MC_SPEAKER_OFF             @"6"
#define kGSM_MC_TALK                    @"4"
#define kGSM_MC_MONITOR                 @"3"

#define kGSM_MC_PHONE_NUM_SETTINGS      @"Phone numbers:\n"
#define kGSM_MC_SMS_NUM_SETTINGS        @"SMS numbers:\n"
#define kGSM_MC_CHANGE_PWD              @"Disarm password(4 digits):"
#define kGSM_MC_RENAME_ZONE             @"Sensors names:\n"
#define kGSM_MC_CHANGE_RFID_NAME        @"Rename RFID tags:\n"
#define kGSM_MC_RINGING_TIMES           @"Ringing time:"
#define kGSM_MC_DELAYED_ENTRY           @"Entry delay time(0-255sec):"
#define kGSM_MC_DELAYED_EXIT            @"Exit delay time(0-255sec):"
#define kGSM_MC_ARM_DISARM_TIME         @"Arm time and disarm time:"

#define kGSM_MC_VOLUME                  @"Siren volume(0=Mute,1=High):"
#define kGSM_MC_RINGING_TIME            @"Siren ringing time(1-9min):"

#define kGSM_MC_LANGUAGE_CN             @"0086"
#define kGSM_MC_LANGUAGE_EN             @"0001"
#define kGSM_MC_LANGUAGE_FR             @"0033"
#define kGSM_MC_LANGUAGE_ES             @"0004"
#define kGSM_MC_LANGUAGE_DE             @"0049"
#define kGSM_MC_LANGUAGE_AE             @"0966"
#define kGSM_MC_LANGUAGE_RU             @"0007"
#define kGSM_MC_LANGUAGE_PT             @"0351"

#define kGSM_MC_N1                      @"1."
#define kGSM_MC_N2                      @"2."
#define kGSM_MC_N3                      @"3."
#define kGSM_MC_N4                      @"4."
#define kGSM_MC_N5                      @"5."
#define kGSM_MC_N6                      @"6."
#define kGSM_MC_N7                      @"7."
#define kGSM_MC_N8                      @"8."
#define kGSM_MC_N9                      @"9."
#define kGSM_MC_N10                     @"10."

#define kGSM_MC_LINE                    @"\n"


#define kGSM_KEY_NAME                   @"name"
#define kGSM_KEY_NUM                    @"number"
#define kGSM_KEY_SPLITER                @","

#endif
