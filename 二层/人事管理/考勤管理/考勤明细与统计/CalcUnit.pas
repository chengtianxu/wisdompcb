unit CalcUnit;

interface
uses
  Math, SysUtils, DMFrm, IniFiles, Classes, Windows;

const
  AllUpdateFieldArr: array [0..84] of string =
  ('OnDutyTime1',
  'OffDutyTime1',
  'OnDutyTime2',
  'OffDutyTime2',
  'OnDutyTime3',
  'OffDutyTime3',
  'OffDutyTime4',
  'OnDutyTime4',
  'YTNote',
  'SWT',
  'OWT',
  'RWT',
  'ROT',
  'SumCN',
  'SumCT',
  'SumZN',
  'SumZT',
  'SumKN',
  'SumKT',
  'SumWN',
  'SumWT',
  'SumJN',
  'SumJT',
  'SumEN',
  'SumET',
  'SumLN',
  'SumLT',
  'NCN',
  'CN1',
  'CT1',
  'CN2',
  'CT2',
  'CN3',
  'CT3',
  'CN4',
  'CT4',
  'ZN1',
  'ZT1',
  'ZN2',
  'ZT2',
  'ZN3',
  'ZT3',
  'ZN4',
  'ZT4',
  'KN1',
  'KT1',
  'KN2',
  'KT2',
  'KN3',
  'KT3',
  'KN4',
  'KT4',
  'WN1',
  'WT1',
  'WN2',
  'WT2',
  'WN3',
  'WT3',
  'WN4',
  'WT4',
  'JN1',
  'JT1',
  'JN2',
  'JT2',
  'JN3',
  'JT3',
  'JN4',
  'JT4',
  'LN1',
  'LT1',
  'LN2',
  'LT2',
  'LN3',
  'LT3',
  'LN4',
  'LT4',
  'EN1',
  'ET1',
  'EN2',
  'ET2',
  'EN3',
  'ET3',
  'EN4',
  'ET4',
  'YT');

type
  TTimeList = class
  private
    FList: TList;
  public
    function Count: Integer;
    function Add(Item: TDateTime): Integer;
    function Item(AIndex: Integer): TDateTime;
    procedure Delete(Index: Integer);overload;
    procedure Delete(ADate: TDateTime);overload;
    procedure Clear;
    constructor Create();
    destructor Destroy; override;
  end;

  TQJOfSector = (qsAhead, qsAll, qsTail, qsPart);
  TQJInfo = record
    RKey: Integer;//请假条的Rkey
    RKeyType: Integer; //请假类型的RKey
    QJWorkTime: Boolean;//请假是否算工时,例如出差，如果算直接以计划工时为准
    QJName: string;
    QJBegin, QJEnd: TDateTime;
    QJSecOf: TQJOfSector;
  end;

  TTimeSector = class
  public
    FTimeList: TTimeList;
    FBeginTime: TDateTime;
    FEndTime: TDateTime;
    FInTime: TDateTime;
    FOutTime: TDatetime;
    FWCOut: TDateTime;
    FWCBack: TDateTime;
    Fisextra: Boolean;

    FAvailable: Boolean;
    FOdd: Boolean; //奇数卡
    FQJ: TQJInfo; //请假

  public
    constructor Create();
    destructor Destroy; override;
  end;

  TBanCi = class
  public
    FBanCiBegin: TDateTime;
    FBanCiEnd: TDateTime;
    FClassName: string;
    FSectorList: TList;
    isoverzero: Boolean;
    cardGap: Integer;
    passsegment: Integer;
    auto_overtime: Integer;
    worktimesum: Double;
    work_rest: Double;
    classdesc: string;
    overworktime: Double;
    overwork_rest: Double;
    overtimetype: Integer;
    aheadduty: Integer;
    delayduty: Integer;

    EditD: array [1..16] of Double;
    EditB: array [17..33] of Boolean;

    FAllTimeList: TTimeList;
    FUnCalcTImeList: TTimeList;
    FClassRkey: Integer;
    FPeopleRKey: Integer;

//    function GetFirstSector: Integer;
//    function GetNextSector(n: Integer): Integer;
//    function GetPreSector(n: Integer): Integer;
//    function GEtLastSector: Integer;

  public
    procedure ClearSectorList;

    function DispatchTIme: Boolean;
    procedure AddSector(ASector: TTimeSector);

    property AllTimeList: TTimeList read FAllTimeList;
    property UnCalcTimeList: TTimeList read FUnCalcTimeList ;
    property SectorList: TList read FSectorList;

    constructor Create();
    destructor Destroy; override;
  end;

var
  gAllFieldValue: array of string;
  gCalcUpdateField: THashedStringList;

procedure ClearUpDateCach;
function GetCalcUpdateSql(ARkey: string): string;
function GetSetNullSql(ARkey: string): string;
procedure SetSqlFieldValue(AField,AValue: string);
function CalcOnOffSql: string;
function FillBanCi(var ABC: TBanCi; APeopRkey, AClassRkey: Integer; ACheckDate: TDateTime): Boolean;

implementation
uses
  DateUtils, ADODB, DB, WZ_gUnit, Variants,common;

var
  __tmpI: Integer;

const TimeValue = 15;

procedure SetSqlFieldValue(AField,AValue: string);
var
  LIndex: Integer;
begin
  LIndex := gCalcUpdateField.IndexOf(AField);
  gAllFieldValue[LIndex] := AValue;
end;

function FillBanCi(var ABC: TBanCi; APeopRkey, AClassRkey: Integer; ACheckDate: TDateTime): Boolean;
var
  LSql: string;
  LSec: TTimeSector;
  I: Integer;
  QJ: TQJInfo;
  OldTime: TDateTime;
  t,tIn,tOut: TDateTime;
begin
  Result := False;
  t := 0;
  OldTime := 0;
  ZeroMemory(@QJ, SizeOf(QJ));
  if not DM1.adsBanCi.Locate('rkey',AClassRkey,[loPartialKey]) then Exit;
//  {$REGION '填充班次信息'}
  with ABC, DM1.adsBanCi do
  begin
    abc.FClassName := FieldByName('className').AsString;
    abc.isoverzero := FieldByName('isoverzero').AsBoolean;
    abc.cardGap := FieldByName('cardGap').AsInteger;
    abc.passsegment := FieldByName('passsegment').AsInteger;
   abc.auto_overtime := FieldByName('auto_overtime').AsInteger;
    abc.worktimesum := FieldByName('worktimesum').AsFloat;
    abc.work_rest := FieldByName('work_rest').AsFloat;
    abc.classdesc := FieldByName('classdesc').AsString;
    abc.overworktime := FieldByName('overworktime').AsFloat;
    abc.overwork_rest := FieldByName('overwork_rest').AsFloat;
    abc.overtimetype := FieldByName('overtimetype').AsInteger;
    abc.aheadduty := FieldByName('aheadduty').AsInteger;
    abc.delayduty := FieldByName('delayduty').AsInteger;
    for I := 1 to 16 do
    begin
      EditD[I] := FieldByName('edit_'+ IntToStr(I)).AsFloat;
    end;
    for I := 17 to 33 do
      EditB[I] := FieldByName('edit_'+ IntToStr(I)).AsBoolean;
    for I := 1 to 3 do
    begin
      if (FieldByName('ontime' + IntToStr(I)).AsDateTime <> 0 )  and
        (FieldByName('outtime' + IntToStr(I)).AsDateTime <> 0) then
      begin
        if FBanCiBegin=0 then
          abc.FBanCiBegin := IncMinute(DateOf(ACheckDate) + TimeOf(DM1.adsBanCi.FieldByName('ontime' + IntToStr(I)).AsDateTime),0-abc.aheadduty);   //0-abc.aheadduty
        abc.FBanCiEnd :=  IncMinute(DateOf(ACheckDate) + TimeOf(DM1.adsBanCi.FieldByName('outtime'+IntToStr(I)).AsDateTime),abc.delayduty);      //abc.delayduty
        if abc.FBanCiEnd < abc.FBanCiBegin then
          abc.FBanCiEnd := IncDay(abc.FBanCiEnd,1)
        else
        if isoverzero then
          if Dateof(FBanCiEnd) <= DateOf(FBanCiBegin)  then
            abc.FBanCiEnd := IncDay(abc.FBanCiEnd,1);
      end;
    end;
    FClassRkey := AClassRkey;
    FPeopleRKey := APeopRkey;
  end;


//  {$REGION '查询是否有请假记录'}
  with DM1.adsMain do
  begin
    LSql := ' SELECT D1.RKey AS D1RKey, D1.leavetype, D1.starttime, D1.endtime, D2.LeaveType AS LeaveName,D2.worktime_Calculation FROM AskLeaveRegister D1 ' +
            ' INNER JOIN AskForLeave D2 ON D1.leavetype = D2.RKey ' +
            ' WHERE D1.employeeid = ' + FieldByName('employeeid').AsString +
            ' AND ( ' + QuotedStr(WZ_gUnit.gDateTimeToStr(ABC.FBanCiBegin)) + ' BETWEEN D1.starttime AND D1.endtime OR ' + QuotedStr(WZ_gUnit.gDateTimeToStr(ABC.FBanCiEnd)) + ' BETWEEN D1.starttime AND D1.endtime ' +
            ' OR D1.starttime BETWEEN ' + QuotedStr(WZ_gUnit.gDateTimeToStr(ABC.FBanCiBegin)) +' AND '+ QuotedStr(WZ_gUnit.gDateTimeToStr(ABC.FBanCiEnd)) +' OR D1.endtime BETWEEN '+ QuotedStr(WZ_gUnit.gDateTimeToStr(ABC.FBanCiBegin)) +' AND ' + QuotedStr(WZ_gUnit.gDateTimeToStr(ABC.FBanCiEnd)) +' )' +
            ' AND D1.CurStatus = 1';
  end;

  if DM1.SQLOpen(LSql) then
  begin
    if not DM1.qryTmp.IsEmpty then
    begin
      QJ.RKey := DM1.qryTmp.FieldByName('D1RKey').AsInteger;
      QJ.RKeyType := DM1.qryTmp.FieldByName('leavetype').AsInteger;
      QJ.QJBegin := DM1.qryTmp.FieldByName('starttime').AsDateTime;
      QJ.QJEnd := DM1.qryTmp.FieldByName('endtime').AsDateTime;
      QJ.QJName := DM1.qryTmp.FieldByName('LeaveName').AsString;
      QJ.QJWorkTime := DM1.qryTmp.FieldByName('worktime_Calculation').AsBoolean;
    end;
  end;
//  {$REGION '填充secotr'}
  for I := 0 to 2 do
  begin
    LSec := TTimeSector.Create;
    with DM1.adsBanCi, ABC do
    begin
      tIn := FieldByName('ontime'+IntToStr(I+1)).AsDateTime;
      tOut := FieldByName('outtime'+ IntToStr(I+1)).AsDateTime;
      if not isoverzero then
      begin
        LSec.FBeginTime := DateOf(FBanCiBegin) + TimeOf(tIn);
        LSec.FEndTime := DateOf(FBanCiEnd) + TimeOf(tOut);
      end else
      begin
        if OldTime = 0 then t := DateOf(FBanCiBegin);

        if TimeOf(OldTime) > TimeOf(tIn) then t := DateOf(FBanCiEnd);
        OldTime := tIn;
        LSec.FBeginTime := t + TimeOf(tIn);

        if TimeOf(OldTime) > TimeOf(tOut) then t := DateOf(FBanCiEnd);
        OldTime := tOut;
        LSec.FEndTime := t + TimeOf(tOut);
      end;
      if LSec.FBeginTime = LSec.FEndTime then
      begin
        LSec.FBeginTime := 0;
        LSec.FEndTime := 0;
      end;
      LSec.FAvailable := LSec.FBeginTime* LSec.FEndTime <> 0;
      LSec.Fisextra := FieldByName('isextra'+ IntToStr(I+1)).AsBoolean;
//      {$REGION '填充请假数据'}
      if LSec.FAvailable then
      begin
        if not ((LSec.FBeginTime > QJ.QJEnd) or (LSec.FEndTime < QJ.QJBegin)) then
        begin
          if (QJ.QJBegin <= LSec.FBeginTime) and (LSec.FEndTime <= QJ.QJEnd) then
          begin//全部在请假中
            LSec.FQJ := QJ;
            LSec.FQJ.QJBegin := LSec.FBeginTime;
            LSec.FQJ.QJEnd := LSec.FEndTime;
            LSec.FQJ.QJSecOf := qsAll;
          end else
          if (QJ.QJBegin <= LSec.FBeginTime) and (LSec.FEndTime > QJ.QJEnd) then
          begin//前半部在请假中
            LSec.FQJ := QJ;
            LSec.FQJ.QJBegin := LSec.FBeginTime;
            LSec.FQJ.QJSecOf := qsAhead;
          end else
          if (QJ.QJBegin > LSec.FBeginTime) and (LSec.FEndTime <= qj.QJEnd) then
          begin//后半部在请假中
            LSec.FQJ := QJ;
            LSec.FQJ.QJEnd := LSec.FEndTime;
            LSec.FQJ.QJSecOf := qsTail;
          end else
          if (QJ.QJBegin > lsec.FBeginTime) and (QJ.QJEnd < LSec.FEndTime) then
          begin//时间段包含请假
            LSec.FQJ := QJ;
            LSec.FQJ.QJSecOf := qsPart;
          end;
        end;
      end;
    end;
    ABC.SectorList.Add(LSec);
  end;

//  {$REGION '填充卡到班次列表'}
  LSql := ' SELECT card_time FROM OriginalCheckData WHERE employeeid = ' + IntToStr(APeopRkey) +
          ' AND (card_time BETWEEN ' + QuotedStr(WZ_gUnit.gDateTimeToStr(ABC.FBanCiBegin)) +
          ' AND ' + QuotedStr(WZ_gUnit.gDateTimeToStr(ABC.FBanCiEnd)) +
          ' ) ORDER BY card_time ASC';
      // ShowMsg(LSql,0);
  if not DM1.SQLOpen(LSql) then Exit;
  DM1.qryTmp.First;
  while not dm1.qryTmp.Eof do
  begin
    ABC.AllTimeList.Add(DM1.qryTmp.FieldByName('card_time').AsDateTime);
    DM1.qryTmp.Next;
  end;

  Result := True;
end;


function CalcRetSql(ABC: TBanCi): Boolean;
type
  TDealType = (dlQJ, dlRest, dlDisPlayOnOffTime ,dlEnOver,dlZB, dlCD, dlZT, dlKG);

  TSumCount = record
    SumCN: Integer; SumCT: Double;
    SumZN: Integer; SumZT: Double;
    SumKN: Integer; SumKT: Double;
    SumWN: Integer; SumWT: Double;
    SumJN: Integer; SumJT: Double;
    SumEN: Integer; SumET: Double;
    SumLN: Integer; SumLT: Double;
  end;
var
  I: Integer;
  LSql: string;
  //LS: TStringList;
  LSec, tmpSec: TTimeSector;
  NeedDealType: set of TDealType;
//  {$REGION '假日'}
  RestName: string;
  BHasRest: Boolean;

  YC: TStringList;
  SumCount: TSumCount;
  J: Integer;
  SumRealZB,SumRealJB: Double; //实际正班，加班
  StrYC: string;
  CDTime: Integer;
  ZTTime: Integer;
  KGTime: Integer;
  tmp: Integer;
  ZLAdd: Double; //直落班补出勤时间
  BQJGiveTime: Boolean;
  label lbl1, lbl2;

  procedure AddToYC(AStr: string);
  begin
    if YC.IndexOf(AStr) = -1 then YC.Add(AStr);
  end;
begin
  ZeroMemory(@SumCount, SizeOf(TSumCount));
  BHasRest := False;
  ZLAdd := 0;
  SumRealZB := 0;
  SumRealJB := 0;
  BQJGiveTime := False;
  YC := TStringList.Create;
  try
    //忘记打卡
    //if (ABC.AllTimeList.Count mod 2) <> 0 then AddToYC('奇数卡');
    //if ABC.UnCalcTimeList.Count <> 0 then AddToYC('卡数异常');
    //{$REGION '是否放假'}
    if not VarIsNull(DM1.adsMain.FieldByName('resttype').Value) then
    begin
      if DM1.adsMain.FieldByName('resttype').AsInteger <> 0 then
      begin
        LSql := ' SELECT resttype_name FROM resttypemsg WHERE RKey= ' + DM1.adsMain.FieldByName('resttype').AsString;
        if DM1.SQLOpen(LSql) then
        begin
          if not dm1.qryTmp.IsEmpty then
          begin
            RestName := DM1.qryTmp.FieldByName('resttype_name').AsString;
            BHasRest := True;
          end else
            AddToYC('假日失效');
        end;
      end;
    end;

    //{$REGION '时间段 主循环'}
    //LS.Add('select ');
    for I := 0 to ABC.SectorList.Count - 1 do
    begin
      NeedDealType := [dlQJ..dlKG];
      LSec := ABC.SectorList.Items[I];
      //KGTime := 0;
      if not LSec.FAvailable then Continue;
      //{$REGION '1-节假日,处理'}
      if dlRest in NeedDealType then
      begin
        if BHasRest then
        begin
          AddToYC(RestName);
          //NeedDealType := [];
        end;
      end;
      

      //{$REGION '2-请假处理,调休算请假'}
      if dlQJ in NeedDealType then
      begin
        if LSec.FQJ.RKey <> 0 then
        begin
          SetSqlFieldValue('LN'+ IntToStr(I+1),IntToStr(LSec.FQJ.RKeyType));
          SetSqlFieldValue('LT'+ IntToStr(I+1),IntToStr(MinutesBetween(LSec.FQJ.QJBegin,IncMilliSecond(LSec.FQJ.QJEnd,1))));

          SumCount.SumLT := SumCount.SumLT + MinutesBetween(LSec.FQJ.QJBegin,IncMilliSecond(LSec.FQJ.QJEnd,1));
          SumCount.SumLN := SumCount.SumLN + 1;
          AddToYC(LSec.FQJ.QJName);
          //如果是出差，直接给计划工时
          if LSec.FQJ.QJWorkTime then
          begin
            BQJGiveTime := True;
            NeedDealType := [];
          end;
          //如果整段都请假，那么直接跳过
          if LSec.FQJ.QJSecOf = qsAll then NeedDealType := [];
        end;
      end;

      //{$REGION '3-打卡时间'}
      if dlDisPlayOnOffTime in NeedDealType then
      begin
        if LSec.FInTime <> 0 then
          SetSqlFieldValue('OnDutyTime' + IntToStr(I+1),QuotedStr(WZ_gUnit.gDateTimeToStr(LSec.FInTime)));
        if LSec.FOutTime <> 0 then
          SetSqlFieldValue('OffDutyTime' + IntToStr(I+1),QuotedStr(WZ_gUnit.gDateTimeToStr(LSec.FOutTime)));
      end;

      //{$REGION '4-直落补出勤时间'}
      if dlZB in NeedDealType then
      begin
        with LSec do
        begin
          case ABC.passsegment of
            0:;
            1:
              begin
                if I=0 then
                begin
                  tmpSec := ABC.SectorList.Items[I+1];
                  if tmpSec.FAvailable then
                  begin
                    if tmpSec.FInTime* tmpSec.FOutTime <> 0 then
                    begin
                      if MinutesBetween(tmpSec.FInTime, IncMilliSecond(FOutTime,1)) <= ABC.EditD[9] then
                        ZLAdd := ZLAdd + ABC.EditD[15];
                    end;
                  end;
                end;
              end;
            2:
              begin
                if I=1 then
                begin
                  tmpSec := ABC.SectorList.Items[I+1];
                  if tmpSec.FAvailable then
                  begin
                    if tmpSec.FInTime* tmpSec.FOutTime <> 0 then
                    begin
                      if MinutesBetween(tmpSec.FInTime, IncMilliSecond(FOutTime,1)) <= ABC.EditD[10] then
                        ZLAdd := ZLAdd + ABC.EditD[16];
                    end;
                  end;
                end;
              end;
            3:
              begin
                begin
                  if I=0 then
                  begin
                    tmpSec := ABC.SectorList.Items[I+1];
                    if tmpSec.FAvailable then
                    begin
                      if tmpSec.FInTime* tmpSec.FOutTime <> 0 then
                      begin
                        if MinutesBetween(tmpSec.FInTime, IncMilliSecond(FOutTime,1)) <= ABC.EditD[9] then
                          ZLAdd := ZLAdd + ABC.EditD[15];
                      end;
                    end;
                  end;
                end;
                if I=1 then
                begin
                  tmpSec := ABC.SectorList.Items[I+1];
                  if tmpSec.FAvailable then
                  begin
                    if tmpSec.FInTime* tmpSec.FOutTime <> 0 then
                    begin
                      if MinutesBetween(tmpSec.FInTime, IncMilliSecond(FOutTime,1)) <= ABC.EditD[10] then
                        ZLAdd := ZLAdd + ABC.EditD[16];
                    end;
                  end;
                end;
              end;
          else
              ;
          end;
        end;
      end;

      //{$REGION '5-是否奇数卡'}
      if (LSec.FInTime* LSec.FOutTime=0) and (LSec.FInTime+ LSec.FOutTime <> 0) then
      begin
        NeedDealType := NeedDealType - [dlCD, dlZT, dlEnOver];
        LSec.FOdd := True;
        AddToYC('缺卡');
      end;
    

      //{$REGION '6-旷工'}
      if dlKG in NeedDealType then
      begin
        if ((LSec.FInTime = 0) and (LSec.FOutTime = 0)) or LSec.FOdd then
        begin
          NeedDealType := [];
          KGTime := MinutesBetween(LSec.FBeginTime, IncMilliSecond(LSec.FEndTime,1)) - MinutesBetween(LSec.FQJ.QJBegin, IncMilliSecond(LSec.FQJ.QJEnd,1));
          //{$REGION '不计矿工'}
          if ((I=0) and ABC.EditB[19]) or ((I=1) and ABC.EditB[24]) or ((I=2) and ABC.EditB[29]) then
          begin
            KGTime := 0;
           // ShowMsg('test','test',0);
          end;
          if KGTime <> 0 then
          begin
            AddToYC('旷工');;
            SetSqlFieldValue('KN' + IntToStr(I+1),'1');
            SetSqlFieldValue('KT' + IntToStr(I+1),IntToStr(KGTime));
            SumCount.SumKT := SumCount.SumKT + KGTime;
            SumCount.SumKN := SumCount.SumKN + 1;
          end;
        end
      end;

      //{$REGION '7-迟到'}
      CDTime := 0;
      if dlCD in NeedDealType then
      begin
        with LSec do
        begin
          if (FInTime<>0) and (FOutTime <> 0) then
          begin
            if FQJ.RKey = 0 then
            begin
            lbl1:
              if FInTime > FBeginTime then
              begin
                CDTime := MinutesBetween(LSec.FBeginTime, IncMilliSecond(LSec.FInTime,1));
               // if  CDTime=0  then  CDTime:=1;
                //{$REGION '不计迟到处理'}
                if (CDTime <= ABC.EditD[1]) or ((I=0) and ABC.EditB[17])
                  or ((I=1) and ABC.EditB[22]) or ((I=2) and ABC.EditB[27]) then
                begin
                  LSec.FInTime := LSec.FBeginTime;
                  CDTime := 0;
                end;
                //{$REGION '超过计旷工'}
                if (CDTime > ABC.EditD[4]) and (ABC.EditD[11]<>0) then
                begin
                  LSec.FInTime := IncMinute(LSec.FBeginTime, Round(ABC.EditD[11]*60));
                  if LSec.FInTime > LSec.FEndTime then
                    LSec.FInTime := LSec.FEndTime;
                  CDTime := 0;
                  AddToYC('旷工');
                  SumCount.SumKN := SumCount.SumKN + 1;
                  SumCount.SumKT := SumCount.SumKT + ABC.EditD[11]*60;
                  SetSqlFieldValue('KT'+ IntToStr(I+1),IntToStr(Round(ABC.EditD[11]*60)));
                  SetSqlFieldValue('KN'+ IntToStr(I+1),'1');
                end;
                if CDTime <> 0 then
                begin
                  AddToYC('迟到');
                  SetSqlFieldValue('CT'+ IntToStr(I+1),IntToStr(CDTime));
                  SetSqlFieldValue('CN'+ IntToStr(I+1),'1');
                  SumCount.SumCN := SumCount.SumCN + 1;
                  SumCount.SumCT := SumCount.SumCT + CDTime;
                end;
              end;
            end else
            begin
              case LSec.FQJ.QJSecOf of
                qsAhead:
                  begin
                    if LSec.FInTime > LSec.FQJ.QJEnd then
                    begin
                      CDTime := MinutesBetween(LSec.FQJ.QJEnd, IncMilliSecond(LSec.FInTime,1));
                     // if  CDTime=0  then  CDTime:=1;
                      //{$REGION '不计迟到处理'}
                      if (CDTime <= ABC.EditD[1]) or ((I=0) and ABC.EditB[17])
                        or ((I=1) and ABC.EditB[22]) or ((I=2) and ABC.EditB[27]) then
                      begin
                        LSec.FInTime := LSec.FQJ.QJEnd;
                        CDTime := 0;
                      end;
                      //{$REGION '超过计旷工'}
                      if (CDTime > ABC.EditD[4]) and (ABC.EditD[11]<>0) then
                      begin
                        LSec.FInTime := IncMinute(LSec.FQJ.QJEnd, Round(ABC.EditD[11]*60));
                        if LSec.FInTime > LSec.FEndTime then
                          LSec.FInTime := LSec.FEndTime;
                        CDTime := 0;
                        AddToYC('旷工');
                        SumCount.SumKN := SumCount.SumKN + 1;
                        SumCount.SumKT := SumCount.SumKT + ABC.EditD[11]*60;
                        SetSqlFieldValue('KT'+ IntToStr(I+1),IntToStr(Round(ABC.EditD[11]*60)));
                        SetSqlFieldValue('KN'+ IntToStr(I+1),'1');
                      end;
                      if CDTime <> 0 then
                      begin
                        AddToYC('迟到');
                        SetSqlFieldValue('CT'+ IntToStr(I+1),IntToStr(CDTime));
                        SetSqlFieldValue('CN'+ IntToStr(I+1),'1');
                        SumCount.SumCN := SumCount.SumCN + 1;
                        SumCount.SumCT := SumCount.SumCT + CDTime;
                      end;
                    end;
                  end;
                qsAll: ;
                qsTail: goto lbl1;
                qsPart: goto lbl1;
              end;
            end;
          end;
        end;
      end;

      //{$REGION '8-早退'}
      ZTTime := 0;
      if dlZT in NeedDealType then
      begin
        with LSec do
        begin
          if (LSec.FInTime <>0) and (LSec.FOutTime <> 0) then
          begin
            if FQJ.RKey = 0 then
            begin
            lbl2:
              if LSec.FOutTime < LSec.FEndTime then
              begin
                ZTTime := MinutesBetween(LSec.FOutTime, IncMilliSecond(LSec.FEndTime,1));
               // if  ZTTime=0  then  ZTTime:=1;    //20171110
                //{$REGION '不计早退处理'}
                if (ZTTime < ABC.EditD[2]) or ((I=0) and (ABC.EditB[18]))
                  or ((I=1) and (ABC.EditB[23])) or ((I=2) and (ABC.EditB[28])) then
                begin
                if Pos('_hr',common.db_ptr)>0 then

                else
                  LSec.FOutTime := LSec.FEndTime;

                  ZTTime := 0;
                end;
                //{$REGION '超过计旷工'}
                if (ZTTime>ABC.EditD[5]) and (ABC.EditD[12] <> 0) then
                begin
                  LSec.FOutTime := IncMinute(LSec.FOutTime, Round(0-ABC.EditD[12]*60));
                  if LSec.FInTime > LSec.FOutTime then
                    LSec.FOutTime := LSec.FInTime;
                  AddToYC('旷工');
                  SumCount.SumKN := SumCount.SumKN + 1;
                  SumCount.SumKT := SumCount.SumKT + ABC.EditD[12]*60;
                  SetSqlFieldValue('KT'+ IntToStr(I+1),IntToStr(Round(ABC.EditD[12]*60)));
                  SetSqlFieldValue('KN'+ IntToStr(I+1),'1');
                  ZTTime := 0;
                end;
                if ZTTime <> 0 then
                begin
                  AddToYC('早退');
                  SetSqlFieldValue('ZT'+ IntToStr(I+1),IntToStr(ZTTime));
                  SetSqlFieldValue('ZN'+ IntToStr(I+1),'1');
                  SumCount.SumZN := SumCount.SumZN + 1;
                  SumCount.SumZT := SumCount.SumZT + ZTTime;
                end;
              end;
            end else
            begin
              case LSec.FQJ.QJSecOf of
                qsAhead: goto lbl2;
                qsAll: ;
                qsTail:
                  begin
                    if FOutTime < FQJ.QJBegin then
                    begin
                      ZTTime := MinutesBetween(FOutTime, IncMilliSecond(FQJ.QJBegin,1));
                     // if   ZTTime=0  then  ZTTime:=1;
                      //{$REGION '不计早退处理'}
                      if (ZTTime < ABC.EditD[2]) or ((I=0) and (ABC.EditB[18]))
                        or ((I=1) and (ABC.EditB[23])) or ((I=2) and (ABC.EditB[28])) then
                      begin
                         if Pos('_hr',common.db_ptr)>0 then
                
                         else 
                        LSec.FOutTime := LSec.FQJ.QJBegin;
                        ZTTime := 0;
                      end;
                      //{$REGION '超过计旷工'}
                      if (ZTTime>ABC.EditD[5]) and (ABC.EditD[12] <> 0) then
                      begin
                        LSec.FOutTime := IncMinute(LSec.FOutTime, Round(0-ABC.EditD[12]*60));
                        if LSec.FInTime > LSec.FOutTime then
                          LSec.FOutTime := LSec.FInTime;
                        AddToYC('旷工');
                        SumCount.SumKN := SumCount.SumKN + 1;
                        SumCount.SumKT := SumCount.SumKT + ABC.EditD[12]*60;
                        SetSqlFieldValue('KT'+ IntToStr(I+1),IntToStr(Round(ABC.EditD[12]*60)));
                        SetSqlFieldValue('KN'+ IntToStr(I+1),'1');
                        ZTTime := 0;
                      end;
                      if ZTTime <> 0 then
                      begin
                        AddToYC('早退');
                        SetSqlFieldValue('ZT'+ IntToStr(I+1),IntToStr(ZTTime));
                        SetSqlFieldValue('ZN'+ IntToStr(I+1),'1');
                        SumCount.SumZN := SumCount.SumZN + 1;
                        SumCount.SumZT := SumCount.SumZT + ZTTime;
                      end;
                    end;
                  end;
                qsPart: goto lbl2;
              end;
            end;
          end;
        end;
      end;

      //{$REGION '10-提早计时'}
      if dlEnOver in NeedDealType then
      begin
        if LSec.FInTime* LSec.FOutTime <> 0 then
        begin
          //提早计时
          if LSec.FInTime < LSec.FBeginTime then
          begin
            tmp := MinutesBetween(LSec.FInTime, IncMilliSecond(LSec.FBeginTime,1));
            if (ABC.EditB[20] and (I=0)) or (ABC.EditB[25] and (I=1)) or (ABC.EditB[30] and (I=2)) then
            begin
              //{$REGION '超过出勤精度计时'}
              if ABC.EditB[32] then
              begin
                if tmp > TimeValue then
                  tmp := tmp - (tmp mod TimeValue)
                else
                  tmp := 0;
                LSec.FInTime := IncMinute(LSec.FBeginTime, 0-tmp);
              end;
            end else
            begin
              //是否有请假
              if LSec.FQJ.RKey = 0 then
                LSec.FInTime := LSec.FBeginTime
              else
              begin
                case LSec.FQJ.QJSecOf of
                  qsAhead: LSec.FInTime := LSec.FQJ.QJEnd;
                  qsAll: ;
                  qsTail: LSec.FInTime := LSec.FBeginTime;
                  qsPart: LSec.FInTime := LSec.FBeginTime;
                end;
              end;
            end;

          end;

          //{$REGION '延时计时'}
          if LSec.FOutTime > LSec.FEndTime then
          begin
            tmp := MinutesBetween(LSec.FEndTime, IncMilliSecond(LSec.FOutTime,1));
            if (ABC.EditB[21] and (I=0)) or (ABC.EditB[26] and (I=1)) or (ABC.EditB[31] and (I=2)) then
            begin
              if ABC.EditB[33] then
              begin
                if tmp > TimeValue then
                  tmp := tmp - (tmp mod TimeValue)
                else
                  tmp := 0;
                LSec.FOutTime := IncMinute(LSec.FEndTime,tmp);
              end;
            end else
            begin
              if LSec.FQJ.RKey = 0 then
                LSec.FOutTime := LSec.FEndTime
              else
              begin
                case LSec.FQJ.QJSecOf of
                  qsAhead: LSec.FOutTime := LSec.FEndTime;
                  qsAll: ;
                  qsTail: LSec.FOutTime := LSec.FQJ.QJBegin;
                  qsPart: LSec.FOutTime := LSec.FEndTime;
                end;
              end;
            end;
          end;
        end;
      end;

      //{$REGION '汇总3个段的工时'}
      if LSec.FInTime* LSec.FOutTime <> 0 then
      begin
        if LSec.Fisextra then
        begin
          SumRealJB := SumRealJB + MinutesBetween(LSec.FInTime, IncMilliSecond(LSec.FOutTime,1));
          if (LSec.FQJ.RKey <> 0) and (LSec.FQJ.QJSecOf = qsPart) then
            SumRealJB := SumRealJB - MinutesBetween(LSec.FQJ.QJBegin, IncMilliSecond(LSec.FQJ.QJEnd,1));
          //迟到和早退将工时补给正班，工资计算时候，直接按知道1分钟1块钱扣。
          SumRealJB := SumRealJB + CDTime + ZTTime;
        end else
        begin
          SumRealZB := SumRealZB + MinutesBetween(LSec.FInTime, IncMilliSecond(lsec.FOutTime,1));
          if (LSec.FQJ.RKey <> 0) and (LSec.FQJ.QJSecOf = qsPart) then
            SumRealZB := SumRealZB - MinutesBetween(LSec.FQJ.QJBegin, IncMilliSecond(LSec.FQJ.QJEnd,1));
          //迟到和早退将工时补给正班，工资计算时候，直接按知道1分钟1块钱扣。
           if Pos('_hr',common.db_ptr)>0 then
           else
          SumRealZB := SumRealZB + CDTime + ZTTime;
        end;
      end;
    end;

    //直落补出勤
    SumRealZB := SumRealZB + ZLAdd + 1;

    //{$REGION '正班休息，加班休息'}
    if ABC.work_rest <> 0 then
       SumRealZB := Max(0,SumRealZB- ABC.work_rest);
    if ABC.overwork_rest <> 0 then
      SumRealJB := Max(0, SumRealJB- ABC.overwork_rest);

    //{$REGION '超过正班计算为加班'}
    if ABC.auto_overtime = 1 then
    begin
      if SumRealZB > ABC.worktimesum*60 then
      begin
        SumRealJB := SumRealJB + SumRealZB - ABC.worktimesum*60;
        SumRealZB := ABC.worktimesum*60;
      end;
    end;

    //{$REGION '加班的精度为0.5小时'}
    SumRealJB := (Trunc(SumRealJB) div 30) * 30;

    //{$REGION '如果请假算工时，则直接给计划工时'}
    if BQJGiveTime then
    begin
      SumRealZB := ABC.worktimesum*60;
      SumRealJB := ABC.overworktime*60;
    end;
    //{$ENDREGION}

    //{$REGION '正班时间不能超过计划时间'}
    SumRealZB := Min(SumRealZB, ABC.worktimesum*60);

    //{$REGION '总时间'}
    SetSqlFieldValue('SWT',FormatFloat('0.0',ABC.worktimesum));
    SetSqlFieldValue('OWT',FormatFloat('0.0',ABC.overworktime));
    SetSqlFieldValue('RWT',FormatFloat('0.0',SumRealZB/60));
    SetSqlFieldValue('ROT',FormatFloat('0.0',SumRealJB/60));

    for J := 0 to YC.Count - 1 do StrYC := StrYC + YC[J] + ',';
    SetSqlFieldValue('YTNote',QuotedStr(StrYC));
    if YC.Count <> 0 then SetSqlFieldValue('YT','1') else SetSqlFieldValue('YT','0');


    SetSqlFieldValue('SumCN',IntToStr(SumCount.SumCN));
    SetSqlFieldValue('SumCT',FormatFloat('0.0',SumCount.SumCT));
    SetSqlFieldValue('SumZN',IntToStr(SumCount.SumZN));
    SetSqlFieldValue('SumZT',FormatFloat('0.0',SumCount.SumZT));
    SetSqlFieldValue('SumKN',IntToStr(SumCount.SumKN));
    SetSqlFieldValue('SumKT',FormatFloat('0.0',SumCount.SumKT));
    SetSqlFieldValue('SumWN',IntToStr(SumCount.SumWN));
    SetSqlFieldValue('SumWT',FormatFloat('0.0',SumCount.SumWT));
    SetSqlFieldValue('SumJN',IntToStr(SumCount.SumJN));
    SetSqlFieldValue('SumJT',FormatFloat('0.0',SumCount.SumJT));
    SetSqlFieldValue('SumEN',IntToStr(SumCount.SumEN));
    SetSqlFieldValue('SumET',FormatFloat('0.0',SumCount.SumET));
    SetSqlFieldValue('SumLN',IntToStr(SumCount.SumLN));
    SetSqlFieldValue('SumLT',FormatFloat('0.0',SumCount.SumLT));

    Result := True;
  finally
    YC.Free;
  end;
end;

procedure ClearUpDateCach;
var
  I: Integer;
begin
  for I := 0 to Length(gAllFieldValue) - 1 do
  begin
    gAllFieldValue[I] := 'NULL';
  end;
end;

function GetCalcUpdateSql(ARkey: string): string;
var
  I: Integer;
begin
  Result := 'update onoffdutydata set modiMan='+rkey73+',';      //
  for I := 0 to Length(AllUpdateFieldArr) - 1 do
  begin
    Result := Result + AllUpdateFieldArr[I] + ' = ' + gAllFieldValue[I];
    if I <> High(AllUpdateFieldArr) then Result := Result + ',';
  end;
  Result := Result + ' WHERE rkey = ' + ARkey +
            ' AND (locked = 0 or locked is null)';
end;

function GetSetNullSql(ARkey: string): string;
begin
  ClearUpDateCach;
  Result := GetCalcUpdateSql(ARkey);
end;


{ TBanCi }


procedure TBanCi.AddSector(ASector: TTimeSector);
begin
  SectorList.Add(ASector);
end;

procedure TBanCi.ClearSectorList;
var
  I: Integer;
begin
  for I := 0 to SectorList.Count - 1 do
    TTimeSector(SectorList.Items[I]).Free;
  SectorList.Clear;
end;

constructor TBanCi.Create;
begin
  FSectorList := TList.Create;
  FAllTimeList := TTimeList.Create;
  FUnCalcTImeList := TTimeList.Create;
end;

destructor TBanCi.Destroy;
begin
  ClearSectorList;
  FSectorList.Free;
  FAllTimeList.Free;
  FUnCalcTImeList.Free;
  inherited;
end;

function TBanCi.DispatchTIme: Boolean;
var
  LSec: TTimeSector;
  I: Integer;
  t: TDateTime;
  J: Integer;
  BAdd: Boolean;
begin
  for I := 0 to AllTimeList.Count - 1 do
  begin
     t := AllTimeList.Item(I);
    BAdd := True;
    for J := 0 to SectorList.Count - 1 do
    begin
      LSec := SectorList.Items[J];
      if LSec.FAvailable then
      begin
        if (LSec.FQJ.RKey <> 0) and (LSec.FQJ.QJSecOf = qsAll) then
          Continue;
        if LSec.FInTime = 0 then
        begin
          LSec.FInTime := t;
          BAdd := False;
          Break;
        end;
        if (LSec.FBeginTime<LSec.FQJ.QJBegin) and (LSec.FQJ.QJEnd < LSec.FEndTime) then
        begin
          if LSec.FWCOut = 0 then
          begin
            LSec.FWCOut := t;
            BAdd := False;
            Break;
          end;
          if LSec.FWCBack = 0 then
          begin
            LSec.FWCBack := t;
            BAdd := False;
            Break;
          end;
        end;
        if LSec.FOutTime = 0 then
        begin
          LSec.FOutTime := t;
          BAdd := False;
          Break;
        end;
      end;
    end;
    if BAdd then UnCalcTimeList.Add(t);
  end;
  Result := True;
end;

//function TBanCi.GetFirstSector: Integer;
//var
//  I: Integer;
//  LSector: TTimeSector;
//begin
//  Result := -1;
//  for I := 0 to SectorList.Count - 1 do
//  begin
//    LSector := SectorList.Items[I];
//    with LSector do
//    begin
//      if (FBeginTime <> 0) and (FEndTime <> 0) then
//      begin
//        Result := I;
//        Exit;
//      end;
//    end;
//  end;
//end;
//
//function TBanCi.GEtLastSector: Integer;
//var
//  I: Integer;
//  LSector: TTimeSector;
//begin
//  Result := -1;
//  for I := SectorList.Count - 1 downto 0 do
//  begin
//    LSector := SectorList.Items[I];
//    with LSector do
//    begin
//      if (FBeginTime <> 0) and (FEndTime <> 0) then
//      begin
//        Result := I;
//        Exit;
//      end;
//    end;
//  end;
//end;
//
//function TBanCi.GetNextSector(n: Integer): Integer;
//var
//  I: Integer;
//  LSector: TTimeSector;
//begin
//  Result := -1;
//  if (n+1) > (SectorList.Count -1) then Exit;
//
//  for I := n+1 to SectorList.Count - 1 do
//  begin
//    LSector := SectorList.Items[I];
//    with LSector do
//    begin
//      if (FBeginTime <> 0) and (FEndTime <> 0) then
//      begin
//        Result := I;
//        Exit;
//      end;
//    end;
//  end;
//end;
//
//function TBanCi.GetPreSector(n: Integer): Integer;
//var
//  I: Integer;
//  LSector: TTimeSector;
//begin
//  Result := -1;
//  for I := n - 1 downto 0 do
//  begin
//    LSector := SectorList.Items[I];
//    with LSector do
//    begin
//      if (FBeginTime <> 0) and (FEndTime <> 0) then
//      begin
//        Result := I;
//        Exit;
//      end;
//    end;
//  end;
//end;


{ TTimeList }

function TTimeList.Add(Item: TDateTime): Integer;
var
  P: PDateTime;
begin
  P := GetMemory(SizeOf(TDateTime));
  P^ := Item;
  Result := FList.Add(P);
end;

procedure TTimeList.Clear;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    FreeMem(FList.Items[I],SizeOf(TDatetime));
  FList.Clear;
end;

function TTimeList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TTimeList.Create;
begin
  FList := TList.Create;
end;

procedure TTimeList.Delete(Index: Integer);
begin
  FreeMem(FList.Items[Index],SizeOf(TDateTime));
  FList.Delete(Index);
end;

procedure TTimeList.Delete(ADate: TDateTime);
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    if Item(I) = ADate then
    begin
      Delete(I);
      Exit;
    end;
end;

destructor TTimeList.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TTimeList.Item(AIndex: Integer): TDateTime;
begin
  Result := PDateTime(FList.Items[AIndex])^;
end;

{ TTimeSector }

constructor TTimeSector.Create;
begin
  FTimeList := TTimeList.Create;
end;

destructor TTimeSector.Destroy;
begin
  FTimeList.Clear;
  FTimeList.Free;
  inherited;
end;

function CalcOnOffSql: string;
var
  LBC: TBanCi;
begin
  LBC := TBanCi.Create;
  ClearUpDateCach;
  try
    if FillBanCi(LBC,DM1.adsMain.fieldbyname('EmployeeID').AsInteger,DM1.adsMain.fieldbyname('ClassID').AsInteger,DM1.adsMain.fieldbyname('CheckDate').AsDateTime) then
    begin
      if LBC.DispatchTIme then
      begin
        CalcRetSql(LBC);
      end;
    end;
    Result := GetCalcUpdateSql(DM1.adsMain.fieldbyname('rkey').AsString);     
  finally
    LBC.Free;
  end;
end;

initialization
  SetLength(gAllFieldValue,Length(AllUpdateFieldArr));
  gCalcUpdateField := THashedStringList.Create;
  for __tmpI := 0 to Length(AllUpdateFieldArr) - 1 do
  begin
    gCalcUpdateField.Add(AllUpdateFieldArr[__tmpI]);
  end;

finalization
  gCalcUpdateField.Clear;
  gCalcUpdateField.Free;

end.
