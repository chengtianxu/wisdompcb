{*******************************************************}
{                                                       }
{       ERP_HR人力考勤核心                              }
{                                                       }
{       版权所有 (C) 2012 锌智泉                        }
{       作者 程天旭                                     }
{       用途 人力考勤枢纽                               }
{                                                       }
{*******************************************************}


unit NatureCardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CalcUnit, DMFrm, ComCtrls,
  DBGridEh, DBCtrls, DB, ADODB, Grids;

type
  TfrmNatureCard = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl1: TPanel;
    grp1: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    mmo1: TMemo;
    btn1: TButton;
    mmo2: TMemo;
    mmo3: TMemo;
    dbgrdh1: TDBGridEh;
    pnl3: TPanel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    btnSearch: TButton;
    lbl8: TLabel;
    edtFilter: TEdit;
    lbl9: TLabel;
    dbnvgr1: TDBNavigator;
    ds1: TDataSource;
    adsNatureCard: TADODataSet;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edtFilterChange(Sender: TObject);
    procedure dbgrdh1CellClick(Column: TColumnEh);
  private
    { Private declarations }
    FPeopRkey: Integer;
    FTime: TDateTime;
    FClassID: Integer;
    FBanCi: TBanCi;
    FFilterIndex: Integer;
  public
    { Public declarations }
  end;

function ShowNatureFrm(AOwner: TComponent; APeopRkey,AClassID: Integer; ATime: TDateTime): Boolean;

implementation
            
uses
  DateUtils, WZ_gUnit,common;

{$R *.dfm}

function ShowNatureFrm(AOwner: TComponent; APeopRkey,AClassID: Integer; ATime: TDateTime): Boolean;
begin
  with TfrmNatureCard.Create(AOwner) do
  begin
    try
      FPeopRkey := APeopRkey;
      FTime := ATime;
      FClassID := AClassID;
      Result := ShowModal = mrOk;
    finally
      Free;
    end;
  end;
end;

procedure TfrmNatureCard.btn1Click(Sender: TObject);
var
  LSec: TTimeSector;
  I: Integer;
begin
  mmo2.Clear;
  mmo3.Clear;
  FBanCi.ClearSectorList;
  FBanCi.AllTimeList.Clear;
  FBanCi.UnCalcTimeList.Clear;
  if not FillBanCi(FBanCi, FPeopRkey, FClassID, FTime) then Exit;
  if FBanCi.DispatchTime then
  begin
    with FBanCi do
    begin
      for I := 0 to SectorList.Count - 1 do
      begin
        LSec := SectorList.Items[I];
        with LSec, mmo2.Lines do
        begin
          Add('****' + WZ_gUnit.gDateTimeToStr(FBeginTime) + '-' + WZ_gUnit.gDateTimeToStr(FEndTime)+'****');
          Add('签到' + WZ_gUnit.gDateTimeToStr(FInTime));
          if (FWCOut <> 0) and (FWCBack <> 0) then
          begin
            Add('->');
            Add('外出' + WZ_gUnit.gDateTimeToStr(FWCOut));
            Add('回来' + WZ_gUnit.gDateTimeToStr(FWCBack));
            Add('<-');
          end;
          Add('签退' + WZ_gUnit.gDateTimeToStr(FOutTime));
          Add('');
        end;
      end;
      for I := 0 to UnCalcTimeList.Count - 1 do
        mmo3.Lines.Add(WZ_gUnit.gDateTimeToStr(UnCalcTimeList.Item(I)));
    end;
  end;
end;

procedure TfrmNatureCard.btnSearchClick(Sender: TObject);
begin
  if adsNatureCard.Active then adsNatureCard.Close;
  try
    adsNatureCard.Parameters[0].Value := dtp1.DateTime;
    adsNatureCard.Parameters[1].Value := IncMinute(dtp2.DateTime,1440);
    adsNatureCard.Open;
    edtFilterChange(edtFilter);
  except
    ShowMessage('打开数据库失败');
  end;
end;

procedure TfrmNatureCard.dbgrdh1TitleClick(Column: TColumnEh);
begin
  if (Column.FieldName = 'employeecode') or (Column.FieldName = 'chinesename')
      or (Column.FieldName = 'card_time')
  then
  begin
    lbl8.Caption := Column.Title.Caption;
    FFilterIndex := Column.Field.Index;
    if not Column.Field.DataSet.IsEmpty then
    begin
      if Column.Title.SortMarker = smDownEh then
      begin
        TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
        Column.Title.SortMarker := smUpEh;
      end
      else if Column.Title.SortMarker = smUpEh then
      begin
        TCustomAdoDataSet(Column.Field.DataSet).Sort :='';
        Column.Title.SortMarker := smNoneEh;
      end
      else if Column.Title.SortMarker = smNoneEh then
      begin
        TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
        Column.Title.SortMarker := smDownEh;
      end;
    end;
  end;
end;

procedure TfrmNatureCard.edtFilterChange(Sender: TObject);
begin
  with adsNatureCard do
  begin
    if Active then
    begin
      if edtFilter.Text = '' then Filtered := False
      else
      begin
        if Fields[FFilterIndex].DataType = ftInteger then
          Filter := Fields[FFilterIndex].FieldName + ' = ' + TEdit(Sender).Text
        else
        if Fields[FFilterIndex].DataType = ftDateTime then
          Filter := Fields[FFilterIndex].FieldName + ' = ' + QuotedStr(TEdit(Sender).Text)
        else
          Filter := Fields[FFilterIndex].FieldName + ' LIKE ' + '*' + TEdit(Sender).Text + '*';
        try
          Filtered := True;
        except
        end;
      end;
    end;
  end;
end;

procedure TfrmNatureCard.FormCreate(Sender: TObject);
begin
  FBanCi := TBanCi.Create;
  FFilterIndex := 12;
//{$REGION '权限为1，3的处理'}
  if (vprev='1') or (vprev='2') or (vprev='3') then
  begin
    dbgrdh1.ReadOnly := True;
    dbnvgr1.DataSource := nil;
    //ts1.TabVisible := False;
  end;
//{$ENDREGION}
end;

procedure TfrmNatureCard.FormDestroy(Sender: TObject);
begin
  FBanCi.Free;
end;

procedure TfrmNatureCard.FormShow(Sender: TObject);
var
  I: Integer;
  LSql: string;
  //LS: TStringList;
begin
  dtp1.DateTime := DateOf(IncDay(FTime,-1));
  dtp2.DateTime := DateOf(IncDay(FTime,1));
  if FillBanCi(FBanCi, FPeopRkey, FClassID, FTime) then
  begin
    with FBanCi do
    begin
      for I := 0 to AllTimeList.Count - 1 do
        mmo1.Lines.Add(WZ_gUnit.gDateTimeToStr(AllTimeList.Item(I)));
      //LS := TStringList.Create;
      
      LSql := 'SELECT * FROM employeemsg WHERE RKey=' + IntToStr(FPeopRkey);
      if DM1.SQLOpen(LSql) and (not DM1.qryTmp.IsEmpty) then
      begin
        lbl4.Caption := '姓名：' + DM1.qryTmp.FieldByName('chinesename').AsString;
        lbl5.Caption := '工号：' + DM1.qryTmp.FieldByName('employeecode').AsString;
        lbl6.Caption := '班次：' + FClassName;
        lbl7.Caption := '时间段：' + WZ_gUnit.gDateTimeToStr(FBanCiBegin) + '至' + WZ_gUnit.gDateTimeToStr(FBanCiEnd);
        edtFilter.Text := DM1.qryTmp.FieldByName('employeecode').AsString;
      end;
    end;
  end;


end;

procedure TfrmNatureCard.dbgrdh1CellClick(Column: TColumnEh);
begin
   if  (Column.Index<>3)  then exit;
   //showmessage(vprev) ;

    if (vprev='4') then
    dbgrdh1.FieldColumns['card_time'].ReadOnly:=false
    else
     dbgrdh1.FieldColumns['card_time'].ReadOnly:=true;




end;

end.
