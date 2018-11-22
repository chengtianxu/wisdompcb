unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, Buttons, ComCtrls, StdCtrls, DMFrm,
  DB, Menus,common;

type
  TfrmMain = class(TForm)
    pnl2: TPanel;
    ehMain: TDBGridEh;
    pnl4: TPanel;
    cbxSelectAll: TCheckBox;
    lbl1: TLabel;
    pb1: TProgressBar;
    lblNum: TLabel;
    ds1: TDataSource;
    pmMain: TPopupMenu;
    mniAutoCalc: TMenuItem;
    mniChengeBC: TMenuItem;
    mniChangeBZ: TMenuItem;
    mniChangeJR: TMenuItem;
    mniClearYT: TMenuItem;
    N9: TMenuItem;
    mniYSJL: TMenuItem;
    N13: TMenuItem;
    mniCLear: TMenuItem;
    N1: TMenuItem;
    NExcel1: TMenuItem;
    mniChushiHua: TMenuItem;
    N12: TMenuItem;
    N8: TMenuItem;
    mniLocked: TMenuItem;
    mniUnLocked: TMenuItem;
    mniPLBK: TMenuItem;
    N14: TMenuItem;
    pnl1: TPanel;
    btnRefresh: TBitBtn;
    btnSearch: TBitBtn;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbFilter1: TComboBox;
    cbbFilter2: TComboBox;
    edtFilter1: TEdit;
    edtFilter2: TEdit;
    grp2: TGroupBox;
    lbl4: TLabel;
    rbAuto: TRadioButton;
    rbManu: TRadioButton;
    btnCheck: TBitBtn;
    Label1: TLabel;
    lbCount: TLabel;
    btn_export: TButton;
    BitBtn1: TBitBtn;
    lbl5: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure cbxSelectAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure ehMainTitleClick(Column: TColumnEh);
    procedure ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure ehMainColumns4UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure ehMainColumns5UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure ehMainColumns7UpdateData(Sender: TObject; var Text: String;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure mniCLearClick(Sender: TObject);
    procedure mniLockedClick(Sender: TObject);
    procedure mniClearYTClick(Sender: TObject);
    procedure mniAutoCalcClick(Sender: TObject);
    procedure lbl4Click(Sender: TObject);
    procedure mniChengeBCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniChushiHuaClick(Sender: TObject);
    procedure mniYSJLClick(Sender: TObject);
    procedure mniPLBKClick(Sender: TObject);
    procedure NExcel1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure edtFilter1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCheckClick(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtFilter1KeyPress(Sender: TObject; var Key: Char);
    procedure edtFilter1Change(Sender: TObject);
  private
    { Private declarations }
    FWhereSql: string;
    FMainSql: string;
      field_name  :  string;
    PreColumn: TColumnEh;
    function GetFilterStr(ACbX: TComboBox; AValueEdit: TEdit): string;
    procedure adsMainAfterScroll(DataSet: TDataSet);
    procedure LockUI;
    procedure UnLockUI;
    procedure LoopProgressBar(AMax,ANow: Integer);
    procedure Export_dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string);    
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  gFilterFrm, ADODB, CalcUnit, WZ_gUnit, ModiyFrm, ShellAPI, NatureCardFrm, MutiAddCard, ReqView,
  SumFrm, ComObj, ActiveX, IniPickMonthFrm, PasCheck, OUTFrm;

{$R *.dfm}

procedure TfrmMain.btnSearchClick(Sender: TObject);
//var
//  frmFilter:  TfrmFilter;
begin
 // try
  //  frmFilter:=TfrmFilter.create(nil);
  if gFilterFrom.ShowModal = mrOk then
  begin
    FWhereSql := gFilterFrom.GetWhereString;
    btnRefreshClick(btnRefresh);

  end;
//  finally
//   frmFilter.free;
//  end;
end;

procedure TfrmMain.cbxSelectAllClick(Sender: TObject);
begin
  if cbxSelectAll.Checked then
    ehMain.SelectedRows.SelectAll
  else
    ehMain.SelectedRows.Clear;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

   rkey73:= '2787';
  user_ptr := '3262';
  vprev := '4';


 if not App_init_2(dm1.con1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;


  Caption := application.Title;


  FMainSql := DM1.adsMain.CommandText;
  DM1.adsMain.AfterScroll := adsMainAfterScroll;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  if Trim(FWhereSql) = '' then FWhereSql := gFilterFrom.GetWhereString;

  DM1.adsMain.Close;
  DM1.adsMain.CommandText := FMainSql + FWhereSql + ' order by employeecode asc, checkdate asc';
  DM1.adsMain.Open;
  lbCount.Caption:=IntToStr(DM1.adsMain.RecordCount);

  DM1.adsMain.Properties['Unique Table'].Value :='onoffdutydata';
  DM1.adsMain.Properties['resync command'].Value := FMainSql + ' WHERE d1.rkey =?';
end;

procedure TfrmMain.ehMainTitleClick(Column: TColumnEh);
begin
  if not DM1.adsMain.Active then Exit;
  if (Column.Title.SortMarker = smNoneEh) or (Column.Title.SortMarker = smDownEh) then
  begin
    if Column.Field.FieldKind = fkLookup then
      TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.KeyFields+' ASC'
    else
      TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
  end
  else
  if Column.Title.SortMarker = smUpEh then
  begin
    if Column.Field.FieldKind = fkLookup then
      TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.KeyFields+' DESC'
    else
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
  end ;

  if  DM1.adsMain.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (field_name <> column.FieldName) then
  begin
    lbl2.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edtFilter1.Text:='';
    edtFilter1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn := column ; 
  end else
    edtFilter1.SetFocus;

end;



procedure TfrmMain.ehMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if Column.FieldName = 'RestColor' then
  begin
    if not VarIsNull(Column.Field.Value) then
    begin
      if DM1.adsLookUpRestColor.Locate('resttype_name',Column.Field.Value,[loCaseInsensitive]) then
      begin
        TDBGridEh(Sender).Canvas.Brush.Color := StringToColor(DM1.adsLookUpRestColor.FieldByName('color').AsString);//StringToColor(Column.Field.Value);
        TDBGridEh(Sender).Canvas.FillRect(Rect);
      end;
    end;
  end;

  if (Column.FieldName = 'RWT') and (not VarIsNull(DM1.adsMain.fieldbyname('SWT').Value)) then
  begin
    if VarCompareValue(Column.Field.Value, DM1.adsMain.fieldbyname('SWT').Value) <> vrEqual then
    begin
      TDBGridEh(Sender).Canvas.Brush.Color := clYellow;
      TDBGridEh(Sender).Canvas.FillRect(Rect);
      TDBGridEh(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top+1,FormatFloat('0.00',Column.Field.AsFloat));
    end;
  end;
  
  if (Column.FieldName = 'ROT') and (not VarIsNull(DM1.adsMain.fieldbyname('OWT').Value)) then
  begin
    if VarCompareValue(Column.Field.Value, DM1.adsMain.fieldbyname('OWT').Value) <> vrEqual then
    begin
      TDBGridEh(Sender).Canvas.Brush.Color := clYellow;
      TDBGridEh(Sender).Canvas.FillRect(Rect);
      TDBGridEh(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top+1,FormatFloat('0.00',Column.Field.AsFloat));
    end;
  end;
  
  if (Column.FieldName = 'employeecode') and (not VarIsNull(DM1.adsMain.FieldByName('locked').Value)) and (DM1.adsMain.FieldByName('locked').AsInteger = 1) then
  begin
      TDBGridEh(Sender).Canvas.Brush.Color := clSilver;
      TDBGridEh(Sender).Canvas.FillRect(Rect);
      TDBGridEh(Sender).Canvas.TextOut(Rect.Left+2,Rect.Top+1,Column.Field.AsString);
  end;
end;

procedure TfrmMain.ehMainColumns4UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  if DM1.adsMain.FieldByName('locked').AsInteger <> 0 then
  begin
    Handled := True;
    exit;
  end;
  if MessageBox(Handle, PChar('是否更改假日类型?'), PChar('提示'),MB_YESNO) <> ID_Yes then
  begin
    Handled := True;
    exit;
  end;
end;

procedure TfrmMain.ehMainColumns5UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  if DM1.adsMain.FieldByName('locked').AsInteger <> 0 then
  begin
    Handled := True;
    exit;
  end;
  if DM1.adsLookUpClass.FieldByName('classstatus').AsInteger = 0 then
  begin
    ShowMessage('当前选择班次为无效班次，无法计算考勤结果！！');
  end;
  if MessageBox(Handle, PChar('是否更改班次?'), PChar('提示'),MB_YESNO) <> ID_Yes then
    Handled := True;
end;

procedure TfrmMain.ehMainColumns7UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
  if DM1.adsMain.FieldByName('locked').AsInteger <> 0 then
  begin
    Handled := True;
    exit;
  end;
  if MessageBox(Handle, PChar('是否更改班次类型?'), PChar('提示'),MB_YESNO)<> ID_Yes then
  begin
    Handled := True;
  end;
end;



//工号  0
//姓名  1
//班次  2
//部门  3
//班组类型  4
//异常说明  5
//帐名       6
//假日类型   7
function TfrmMain.GetFilterStr(ACbX: TComboBox; AValueEdit: TEdit): string;
var
  LFieldName,LInStr: string;
  I: Integer;
begin
  if Trim(AValueEdit.Text) = '' then Exit;

  for I := 0 to ehMain.Columns.Count - 1 do
  begin
    if ehMain.Columns[I].Title.Caption = ACbX.Items[ACbX.ItemIndex] then
    begin
      LFieldName := ehMain.Columns[I].FieldName;
      Break;
    end;
  end;
  case ACbX.ItemIndex of
    0,1,3,5,6:
    begin
      Result := '(' + LFieldName + ' Like %' + AValueEdit.Text + '%)';
    end;
    2:
    begin
      try
        DM1.adsLookUpClass.Filtered := False;
        DM1.adsLookUpClass.Filter := 'classname like %' + AValueEdit.Text + '%';
        DM1.adsLookUpClass.Filtered := True;
        DM1.adsLookUpClass.First;
        LInStr := ' (classid = 0 ';
        while not DM1.adsLookUpClass.Eof do
        begin
          LInStr := LInStr + ' or classid = ' + DM1.adsLookUpClass.fieldbyname('rkey').AsString ;
          DM1.adsLookUpClass.Next;
        end;
        LInStr := LInStr + ')';
        Result := LInStr;
      finally
        DM1.adsLookUpClass.Filtered := False;
      end;
    end;     
    4:
    begin
      try
        DM1.adsLookClassGroupType.Filtered := False;
        DM1.adsLookClassGroupType.Filter := 'item like %' + AValueEdit.Text + '%';
        DM1.adsLookClassGroupType.Filtered := True;
        DM1.adsLookClassGroupType.First;
        LInStr := ' (workgroup = -1 ';
        while not DM1.adsLookClassGroupType.Eof do
        begin
          LInStr := LInStr + ' or workgroup = ' + DM1.adsLookClassGroupType.fieldbyname('rkey').AsString ;
          DM1.adsLookClassGroupType.Next;
        end;
        LInStr := LInStr + ')';
        Result := LInStr;
      finally
        DM1.adsLookClassGroupType.Filtered := False;
      end;
    end;
    7:
    begin
      try
        DM1.adsLookUpRestColor.Filtered := False;
        DM1.adsLookUpRestColor.Filter := 'resttype_name like %' + AValueEdit.Text + '%';
        DM1.adsLookUpRestColor.Filtered := True;
        DM1.adsLookUpRestColor.First;
        LInStr := ' (RestType = 0 ';
        while not DM1.adsLookUpRestColor.Eof do
        begin
          LInStr := LInStr + ' or RestType = ' + DM1.adsLookUpRestColor.fieldbyname('rkey').AsString ;
          DM1.adsLookUpRestColor.Next;
        end;
        LInStr := LInStr + ')';
        Result := LInStr;
      finally
        DM1.adsLookUpRestColor.Filtered := False;
      end;
    end;
  end;
end;

procedure TfrmMain.adsMainAfterScroll(DataSet: TDataSet);
begin
  lblNum.Caption := IntToStr(DM1.adsMain.RecordCount);
end;

procedure TfrmMain.LockUI;
begin
  btnSearch.Enabled := False;
  btnRefresh.Enabled := False;
  cbbFilter1.Enabled := False;
  cbbFilter2.Enabled := False;
  edtFilter1.Enabled := False;
  edtFilter2.Enabled := False;
  cbxSelectAll.Enabled := False;
  ehMain.Enabled := False;
  DM1.adsMain.DisableControls;
end;

procedure TfrmMain.UnLockUI;
begin
  btnSearch.Enabled := True;
  btnRefresh.Enabled := True;
  cbbFilter1.Enabled := True;
  cbbFilter2.Enabled := True;
  edtFilter1.Enabled := True;
  edtFilter2.Enabled := True;
  cbxSelectAll.Enabled := True;
  ehMain.Enabled := True;
  DM1.adsMain.EnableControls;
end;

procedure TfrmMain.mniCLearClick(Sender: TObject);
  procedure ClearNote;
  var
    LSql: string;
  begin
    LSql := GetSetNullSql(DM1.adsMain.fieldbyname('rkey').AsString);
    DM1.SqlExec(LSql);
    if rbAuto.Checked then DM1.ADORefreshCurrent(DM1.adsMain);
  end;
var
  I: Integer;
begin
  try
    LockUI;
    if ehMain.SelectedRows.Count = 0 then
    begin
      if DM1.adsMain.FieldByName('locked').AsInteger = 0 then
        ClearNote;
    end else
    begin
      for I := 0 to ehMain.SelectedRows.Count - 1 do
      begin
        if DM1.adsMain.BookmarkValid(Pointer(ehMain.SelectedRows.Items[I])) then
        begin
          DM1.adsMain.GotoBookmark(Pointer(ehMain.SelectedRows.Items[I]));
          if DM1.adsMain.FieldByName('locked').AsInteger = 0 then
            ClearNote;
        end;
        LoopProgressBar(ehMain.SelectedRows.Count,I+1);
      end;
    end;
  finally
    UnLockUI;
  end;
end;

procedure TfrmMain.LoopProgressBar(AMax, ANow: Integer);
begin
  if pb1.Max <> AMax then pb1.Max := AMax;
  pb1.Position := ANow;
  Application.ProcessMessages;
end;

procedure TfrmMain.mniLockedClick(Sender: TObject);
  procedure SetLock(ALocked: Boolean);
  var
    LSql: string;
  begin
    lSql := 'update onoffdutydata set locked = ' + IntToStr(ord(ALocked)) +
            ' where rkey = ' + DM1.adsMain.fieldbyname('rkey').AsString;
        DM1.SqlExec(LSql);
    // add by lisa  取消锁定时把6个卡和所有其它计算出来的值清空
//    if  ALocked=false  then
//    begin
//   lSql:='update onoffdutydata set '  +
//         ' OnDutyTime1=null, OffDutyTime1=null, OnDutyTime2=null, OffDutyTime2=null, OnDutyTime3=null, OffDutyTime3=null, OffDutyTime4=null, OnDutyTime4=null,'+
//         ' YTNote=null, RWT=0, ROT=0, SumCN=0, '+
//        ' SumCT=0, SumZN=0, SumZT=0, SumKN=0, SumKT=0, SumWN=0, SumWT=0, SumJN=0, SumJT=0, SumEN=0, SumET=0, SumLT=0,SumLN=0,NCN=0,CN1=0, CT1=0, CN2=0,CT2=0,CN3=0,CT3=0, '+
//       ' CN4=0, CT4=0, ZN1=0, ZT1=0, ZN2=0, ZT2=0, ZN3=0, ZT3=0, ZN4=0, ZT4=0, KN1=0, KT1=0, KN2=0, KT2=0, KN3=0, KT3=0, KN4=0, KT4=0, WN1=0, WT1=0, WN2=0, WT2=0, WN3=0, WT3=0, WN4=0, WT4=0, JN1=0, '+
//       ' JT1=0, JN2=0, JT2=0, JN3=0, JT3=0, JN4=0, JT4=0, LN1=0, LT1=0, LN2=0, LT2=0, LN3=0, LT3=0, LN4=0, LT4=0, EN1=0, ET1=0, EN2=0, ET2=0, EN3=0, ET3=0, EN4=0, YT=0, OvertimeType=0, SegNo=0, cardcheck=0, '+
//       ' ET4=0, SWT=0, OWT=0  where   rkey = ' + DM1.adsMain.fieldbyname('rkey').AsString;
//     DM1.SqlExec(LSql);
//   end;

   //end;

    if rbAuto.Checked then DM1.ADORefreshCurrent(DM1.adsMain);
  end;
var
  I: Integer;
  bLocked: Boolean;
begin
  if (Sender as TMenuItem).Name = 'mniLocked' then bLocked := True else bLocked := False;
  
  try
    LockUI;
    if ehMain.SelectedRows.Count = 0 then
    begin
      SetLock(bLocked);
    end else
    begin
      for I := 0 to ehMain.SelectedRows.Count - 1 do
      begin
        if DM1.adsMain.BookmarkValid(Pointer(ehMain.SelectedRows.Items[I])) then
        begin
          DM1.adsMain.GotoBookmark(Pointer(ehMain.SelectedRows.Items[I]));
          SetLock(bLocked);;
        end;
        LoopProgressBar(ehMain.SelectedRows.Count,I+1);
      end;
    end;
  finally
    UnLockUI;
  end;
end;

procedure TfrmMain.mniClearYTClick(Sender: TObject);
  procedure ClearYT;
  var
    LSql: string;
  begin
    lSql := 'update onoffdutydata set YTNote = NULL' +
            ' where rkey = ' + DM1.adsMain.fieldbyname('rkey').AsString +
            ' AND (locked = 0 or locked is null)';
    DM1.SqlExec(LSql);
    if rbAuto.Checked then DM1.ADORefreshCurrent(DM1.adsMain);
  end;
var
  I: Integer;
begin
  try
    LockUI;
    if ehMain.SelectedRows.Count = 0 then
    begin
      if DM1.adsMain.FieldByName('locked').AsInteger = 0 then
        ClearYT;
    end else
    begin
      for I := 0 to ehMain.SelectedRows.Count - 1 do
      begin
        if DM1.adsMain.BookmarkValid(Pointer(ehMain.SelectedRows.Items[I])) then
        begin
          DM1.adsMain.GotoBookmark(Pointer(ehMain.SelectedRows.Items[I]));
          if DM1.adsMain.FieldByName('locked').AsInteger = 0 then
            ClearYT;
        end;
        LoopProgressBar(ehMain.SelectedRows.Count,I+1);
      end;
    end;
  finally
    UnLockUI;
  end;
end;

procedure TfrmMain.mniAutoCalcClick(Sender: TObject);
  procedure CalcKQ;
  var
    LSql: string;
  begin
    LSql := CalcOnOffSql;
    DM1.SqlExec(LSql);
   if rbAuto.Checked then DM1.ADORefreshCurrent(DM1.adsMain);
  end;
var
  I: Integer;
  N: Cardinal;
  Lsql:string;
begin
  try
    LockUI;
    Screen.Cursor := crHourGlass;
//    if Pos('_hr',common.db_ptr)>0 then
//    begin
//     if DM1.adsMain.FieldByName('locked').AsInteger = 0 then
//     begin
//     Lsql:='exec sp_setonoffdutydataAll_HR  '''', '''+formatdatetime('yyyy-MM-dd',(DM1.adsMain.FieldByName('CheckDate').AsDateTime))+''' ,'+
//             ' '''+formatdatetime('yyyy-MM-dd',(DM1.adsMain.FieldByName('CheckDate').AsDateTime))+'''  ' ;
//     DM1.SqlExec(LSql);
//     btnRefreshClick(btnRefresh);
//     ShowMessage('计算完毕!');
//     end;
//    end
//    else
//    begin
      N := GetTickCount;
      if ehMain.SelectedRows.Count = 0 then
      begin
        if DM1.adsMain.FieldByName('locked').AsInteger = 0 then
          CalcKQ;
        n := (GetTickCount - n);
      end else
      begin
        for I := 0 to ehMain.SelectedRows.Count - 1 do
        begin
          if DM1.adsMain.BookmarkValid(Pointer(ehMain.SelectedRows.Items[I])) then
          begin
            DM1.adsMain.GotoBookmark(Pointer(ehMain.SelectedRows.Items[I]));
            if DM1.adsMain.FieldByName('locked').AsInteger = 0 then
            begin
             CalcKQ;
             
//                if Pos('_hreicc',common.db_ptr)>0 then   //处理东莞EICC时  20170815加
//                begin
//
//                Lsql:='exec sp_setonoffdutydataAll_HR  '''', '''+formatdatetime('yyyy-MM-dd',(DM1.adsMain.FieldByName('CheckDate').AsDateTime))+''' ,'+
//                       ' '''+formatdatetime('yyyy-MM-dd',(DM1.adsMain.FieldByName('CheckDate').AsDateTime))+'''  ' ;
//                if (DM1.adsMain.FieldByName('rwt').value<DM1.adsMain.FieldByName('owt').value)
//                DM1.SqlExec(LSql);
//                btnRefreshClick(btnRefresh);
//                end;
//                end;
          end;
          LoopProgressBar(ehMain.SelectedRows.Count,I+1);
        end;
        n := Trunc((GetTickCount - n) / ehMain.SelectedRows.Count);
      end;

       ShowMessage(IntToStr(ehMain.SelectedRows.Count)+'条记录; 每条' + IntToStr(n)+'毫秒');
     end;


  finally
    UnLockUI;
    Screen.Cursor := crdefault;
  end;
end;

procedure TfrmMain.lbl4Click(Sender: TObject);
var
  LMsg: string;
begin
  LMsg := '自动刷新：适合单条处理,' + #13 + '或者少量选择处理,处理完毕后会自动刷新界面数据,速度较慢 ' + #13#13 +
          '手动刷新：适合全选批量处理,'+#13+'处理完毕后请手动点击刷新按钮,处理速度快! ';
  ShowMessage(LMsg);
end;

procedure TfrmMain.mniChengeBCClick(Sender: TObject);
  procedure UpdateChange(AField,AKey: string);
  var
    LSql: string;
  begin
    LSql := ' update OnOffDutyData set ' + AField + ' = ' + AKey +
            ' Where rkey = ' + DM1.adsMain.fieldbyname('rkey').AsString +
            ' AND (locked = 0 or locked is null)';
    DM1.SqlExec(LSql);
    if rbAuto.Checked then DM1.ADORefreshCurrent(DM1.adsMain);
  end;
var
  LFrm: TfrmModify;
  LSql, LField, LKey: string;
  I: Integer;
begin
  case (Sender as TMenuItem).Tag of
    2:
    begin
      LSql := ' select rkey,classname as displaytext from class where classstatus = 1' +
              ' union all select null,'+ QuotedStr('清空') +' as displaytext order by classname ';
      LField := 'classid';
    end;
    3:
    begin
      LField := 'workgroup';
      LSql := ' select rkey,item as displaytext from Datadetail where dictid = 22 ' +
              ' union all select null,'+ QuotedStr('清空') +' as displaytext ';
    end;
    4:
    begin
      LField := 'RestType';
      if vprev = '2' then
      begin
        LSql := ' select rkey,resttype_name as displaytext from resttypemsg where resttype_name = ' + QuotedStr('调休') +
                ' union all select null,'+ QuotedStr('清空') +' as displaytext '
      end else
      begin
        LSql := ' select rkey,resttype_name as displaytext from resttypemsg ' +
                ' union all select null,'+ QuotedStr('清空') +' as displaytext ';
      end;
    end;
  end;
  LFrm := TfrmModify.Create(Self);
  try
    LFrm.InitFrm(LSql);
    if LFrm.ShowModal = mrOk then
    begin
      LKey := IntToStr(Integer(lfrm.cbb1.Items.Objects[LFrm.cbb1.ItemIndex]));
      try
        LockUI;
        if ehMain.SelectedRows.Count = 0 then
        begin
          if DM1.adsMain.FieldByName('locked').AsInteger = 0 then
            UpdateChange(LField, LKey);
        end else
        begin
          for I := 0 to ehMain.SelectedRows.Count - 1 do
          begin
            if DM1.adsMain.BookmarkValid(Pointer(ehMain.SelectedRows.Items[I])) then
            begin
              DM1.adsMain.GotoBookmark(Pointer(ehMain.SelectedRows.Items[I]));
              if DM1.adsMain.FieldByName('locked').AsInteger = 0 then
                UpdateChange(LField, LKey);
            end;
            LoopProgressBar(ehMain.SelectedRows.Count,I+1);
          end;
        end;
      finally
        UnLockUI;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  I: Integer;
begin
//{$REGION '权限为1,的处理'}
  if (vprev='1') then
  begin
    for I := 0 to pmMain.Items.Count - 1 do
    begin
      if not ( WZ_gUnit.StrInArr(pmMain.Items[I].Caption,['原始记录'])) then
        pmMain.Items[I].Visible := False;
    end;
    for I := 0 to ehMain.Columns.Count - 1 do ehMain.Columns[I].ReadOnly := True;
  end;

//{$REGION '权限为2的处理，也就是所有文员'}
  if (vprev='2') then
  begin
    for I := 0 to pmMain.Items.Count - 1 do
    begin
      if  not ( WZ_gUnit.StrInArr( pmMain.Items[I].Caption, ['修改班次','修改假日','原始记录','修改班组类别','考勤申请明细'])) then
        pmMain.Items[I].Visible := False;
    end;
  end;

//{$REGION '权限为3的处理，处理锁定'}
//  if (vprev='3') then
//  begin
//    for I := 0 to pmMain.Items.Count - 1 do
//    begin
//      if WZ_gUnit.StrInArr(pmMain.Items[I].Caption,['加锁','解锁','后台批量补卡','部门出勤汇总']) then
//        pmMain.Items[I].Visible := False;
//    end;
//  end;

//{$REGION '权限为4，最高权限，有所有'}

  btnRefreshClick(btnRefresh);


   PreColumn:=ehMain.columns[0];
field_name:= ehMain.columns[0].fieldname;
ehMain.columns[0].title.Color:=clRed;
 ehMain.columns[0].Title.SortMarker:=smUpEh;
//dm1.adsMain.Sort:=field_name;

end;

procedure TfrmMain.mniChushiHuaClick(Sender: TObject);
var
  LFrm: TfrmIniPickMonth;
  Lt: TDateTime;
begin

  LFrm := TfrmIniPickMonth.Create(Self);
  
  try
    if not LFrm.ShowModal = mrOK then Exit;
    Lt := LFrm.dtp1.DateTime;
  finally
    LFrm.Free;
  end;
  
  LockUI;
  try
    DM1.spInit.Parameters.ParamByName('@yearmonth').Value := FormatDateTime('yyyy-mm',Lt);
    DM1.spInit.ExecProc;
  finally
    UnLockUI;
  end;  
end;

procedure TfrmMain.mniYSJLClick(Sender: TObject);
begin
  if not DM1.adsMain.IsEmpty then
  begin
    with DM1.adsMain do
    begin
      ShowNatureFrm(Self,FieldByName('EmployeeID').AsInteger,
        FieldByName('ClassID').AsInteger,
        FieldByName('CheckDate').AsDateTime);
    end;
  end;
end;

procedure TfrmMain.mniPLBKClick(Sender: TObject);
begin
  ShowMutiAddCard(Self);
end;

procedure TfrmMain.NExcel1Click(Sender: TObject);
begin
  LockUI;
  try
    Self.Export_dbGridEH_to_Excel(ehMain,'');
  finally
    UnLockUI;
  end;
end;

procedure TfrmMain.N12Click(Sender: TObject);
begin
  ShowReqView(Self);
end;

procedure TfrmMain.pmMainPopup(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to pmMain.Items.Count - 1 do
  begin
    pmMain.Items[I].Enabled := DM1.adsMain.Active and (not DM1.adsMain.IsEmpty);
  end;
  mniChushiHua.Enabled := True;
 if Pos('_hreicc',common.db_ptr)>0 then
 begin
 //mniYSJL.Visible:=false;
 //mniAutoCalc.Visible:=false;
 end;
end;

procedure TfrmMain.N14Click(Sender: TObject);
begin
  ShowSumFrm(Self,)
end;

procedure TfrmMain.edtFilter1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  LStr,LStr1,LStr2: string;
begin
  if (Key = ord(#13)) or (Trim((Sender as TEdit).Text) = '') then
  begin
    LStr1 := GetFilterStr(cbbFilter1,edtFilter1);
    LStr2 := GetFilterStr(cbbFilter2,edtFilter2);
    if (LStr1 <> '') and (LStr2 <> '') then
      LStr := LStr1 + ' AND ' + LStr2
    else
      LStr := LStr1 + LStr2;
    if Trim(LStr) <> '' then
    begin
      DM1.adsMain.Filtered := False;
      DM1.adsMain.Filter := LStr;
      DM1.adsMain.Filtered := True;
    end else
      DM1.adsMain.Filtered := False;
    lbCount.Caption:=IntToStr(DM1.adsMain.RecordCount);
  end;
end;


procedure TfrmMain.Export_dbGridEH_to_Excel(dbGrid: TDBGridEh;
  title_caption: string);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if not dbgrid.DataSource.DataSet.Active then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

 // XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  //Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  Sheet := XLApp.Workbooks[1].WorkSheets[1];
  dbgrid.DataSource.DataSet.DisableControls;
  dbgrid.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrid.Columns.Count - 1 do
    if dbgrid.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrid.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrid.DataSource.DataSet.Eof do
  begin
    LoopProgressBar(DM1.adsMain.RecordCount,jCount);
    v_cloumn := 0;
    for iCount := 0 to dbgrid.Columns.Count - 1 do
      if dbgrid.Columns[iCount].Visible = true then
       begin
        if dbgrid.Columns[iCount].Field.DataType in [ftString,ftWideString] then
          Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';       
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrid.Columns[iCount].Field.AsString;
       end
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrid.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrid.DataSource.DataSet.First;
  dbgrid.DataSource.DataSet.EnableControls;
end;

procedure TfrmMain.btnCheckClick(Sender: TObject);
begin
  try
    frmCheck:=TfrmCheck.Create(Application);
    frmCheck.ShowModal;
  finally
    frmCheck.Free;
  end;
end;

procedure TfrmMain.btn_exportClick(Sender: TObject);
begin
 if not DM1.adsMain.IsEmpty then
 common.Export_dbGridEH_to_Excel(ehMain,'考勤明细');

end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
var
  Lfrm: TfrmOUT;
begin
  Lfrm:=TfrmOUT.Create(nil);
  Screen.Cursor:= crHourGlass;
  try
    with DM1.qryOUt do
    begin
      Close;
      Parameters[0].Value:= rkey73;
      open;
//      if not IsEmpty then
//        lbl5.Visible:= True;
    end;
    Lfrm.ShowModal;
  finally
    Screen.Cursor:= crDefault;
    Lfrm.Free;
  end;
end;

procedure TfrmMain.edtFilter1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
     DM1.adsMain.Filtered:=false;
    if DM1.adsMain.FieldByName(field_name).FieldKind = fkCalculated then  exit;
    if DM1.adsMain.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
    begin
      if trim(edtFilter1.text) <> '' then
      begin
        if DM1.adsMain.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          DM1.adsMain.Filter:=field_name + ' like ''%' + trim(edtFilter1.text) + '%'' ' //+ statussql
        else if DM1.adsMain.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          DM1.adsMain.Filter:=  field_name+' >= ' + inttostr(strtointdef(edtFilter1.text,0));//+ statussql;
      end else
         DM1.adsMain.Filter:='';
    end;

    DM1.adsMain.Filtered:=true;
    lbCount.Caption:=IntToStr(DM1.adsMain.RecordCount);
  end;
end;

procedure TfrmMain.edtFilter1Change(Sender: TObject);
begin
  if Trim(edtFilter1.Text) = '' then
  begin
    DM1.adsMain.Filtered:=False;
  end;
end;

end.
