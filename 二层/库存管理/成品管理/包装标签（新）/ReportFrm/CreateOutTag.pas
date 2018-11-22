unit CreateOutTag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBClient, DBCtrls, ADODB, CheckLst,
  Spin;

const
  MY_MSG = WM_USer+ 100;

type
  TfrmCreateOutTag = class(TForm)
    pnl1: TPanel;
    edtPcsNum: TEdit;
    lbl1: TLabel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    dbgrd1: TDBGrid;
    lbl2: TLabel;
    edtBarInPut: TEdit;
    btnPrint: TButton;
    btnRefresh: TButton;
    btnSetPCS: TButton;
    cdsIn: TClientDataSet;
    dsIn: TDataSource;
    strngfldInidkey: TStringField;
    intgrfldInpack_ptr: TIntegerField;
    smlntfldInorder_no: TSmallintField;
    strngfldInMANU_PART_NUMBER: TStringField;
    strngfldInMANU_PART_DESC: TStringField;
    strngfldInANALYSIS_CODE_2: TStringField;
    strngfldInPO_NUMBER: TStringField;
    strngfldIndescription: TStringField;
    strngfldIncode: TStringField;
    intgrfldInqty: TIntegerField;
    strngfldInlotno: TStringField;
    strngfldInnotes: TStringField;
    strngfldInbarcode_id: TStringField;
    strngfldInCaseNo: TStringField;
    strngfldInparam1: TStringField;
    strngfldInParam2: TStringField;
    intgrfldInwo_ptr: TIntegerField;
    intgrfldInoutpackkey: TIntegerField;
    intgrfldInIncNO: TIntegerField;
    agrgtfldInAllQty: TAggregateField;
    lblAllQty: TDBText;
    pnl5: TPanel;
    lbl3: TLabel;
    lst1: TCheckListBox;
    strngfldInLotOrder: TStringField;
    lbl4: TLabel;
    lbl5: TLabel;
    lblTargetWeight: TLabel;
    edt1: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lblPWeight: TLabel;
    procedure btnPrintClick(Sender: TObject);
    procedure btnSetPCSClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtBarInPutKeyPress(Sender: TObject; var Key: Char);
    procedure edtPcsNumKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure lst1ClickCheck(Sender: TObject);
  private
    { Private declarations }

    function DecodeIDKey(AIDKey: string; outAQry: TADOQuery): Boolean;
    function CheckPack(AQry: TADOQuery): Boolean;
    function AddToCds(AQry: TADOQuery): Boolean;
    function Create698(out ARkey698: string): Boolean;
    function IncBQDM(AOldDM: string): string;
  public
    FOneWeight: Single;
    PWeight: Single;
    FMsgWeight: single;
    procedure GetStrMsg(var Msg:TMessage);message MY_MSG;

    { Public declarations }
  end;

implementation

uses
  DM, MMSystem, StrUtils, WZ_gUnit, MainFrm;

{$R *.dfm}

procedure TfrmCreateOutTag.btnPrintClick(Sender: TObject);
var
  LRkey698: string;
  Lqry: TADOQuery;
  bHasCreate: Boolean;
begin

  //2017-2-14已生成外箱的条码不是最高权限不能再生成
  bHasCreate := False;
  Lqry := TADOQuery.Create(Self);
  Lqry.Connection := DM1.con1;
  try
    cdsIn.First;
    while not cdsIn.Eof do
    begin
      LQry.Close;
      LQry.SQL.Text := 'select 1 from data0699 where outpackkey is not null and outpackkey <> 0 and pack_ptr=' + cdsIn.fieldbyname('pack_ptr').AsString + ' and order_no = ' + cdsIn.fieldbyname('order_no').AsString;
      LQry.Open;
      if not Lqry.IsEmpty then
      begin
        bHasCreate := True;
        Break;
      end;
      cdsIn.Next;
    end;
  finally
    Lqry.Free;
  end;
  if bHasCreate then
  begin
    if  messagedlg('本条码已生成外箱，你确定要生成吗?',mtconfirmation,[mbyes,mbNo],0)=mryes then
    begin
      if  ( StrToInt(gUser.User_Permit) <> 4) then
      begin
        ShowMessage('本条码已生成外箱，你没权限生成');
        Exit;
      end;
    end else
      Exit;
  end;


  //-----------------------------
  if Create698(LRkey698) then
  begin
    frmMain.btnRefreshClick(nil);
    if DM1.adsFrmMain.Locate('rkey', StrToInt(LRkey698), [loCaseInsensitive]) then
    begin
//      DM1.temp.Close;
//      DM1.temp.SQL.Text := 'select * from data0699 where outpackkey is not null and pack_ptr = '+ LRkey698 ;
//      DM1.temp.Open;
      frmMain.mniPrintClick(nil);
      btnRefreshClick(btnRefresh);
      btnSetPCSClick(btnSetPCS);
      edtBarInPut.SetFocus;
    end
    else
    begin
      ShowMessage('打印失败');
      Exit;
    end;
  end
  else
  begin
    ShowMessage('打印失败');
    Exit;
  end;
end;

procedure TfrmCreateOutTag.btnSetPCSClick(Sender: TObject);
var
  LPcs: Integer;
begin
//  if not TryStrToInt(edtPcsNum.Text, LPcs) then
//  begin
//    ShowMessage('请输入正确的PCS数字');
//    Exit;
//  end;
//  if LPcs > 9999 then
//  begin
//    ShowMessage('数量超出4位数字，超出范围');
//    Exit;
//  end;
  edtPcsNum.Enabled := False;
  btnSetPCS.Enabled := False;
  edtBarInPut.Enabled := True;
  btnRefresh.Enabled := True;
  dbgrd1.Enabled := True;
  //btnPrint.Enabled := True;
end;

procedure TfrmCreateOutTag.btnRefreshClick(Sender: TObject);
begin
  edtBarInPut.Enabled := True;
  btnPrint.Enabled := True;
  lbl4.Visible := False;
  edtBarInPut.SetFocus;

  while not cdsIn.IsEmpty do
    cdsIn.Delete;
//  edtBarInPut.Text := '';

//  edtPcsNum.Enabled := True;
//  btnSetPCS.Enabled := True;
//  edtBarInPut.Enabled := False;
//  btnRefresh.Enabled := False;
//  dbgrd1.Enabled := False;
//  btnPrint.Enabled := False;
end;

function TfrmCreateOutTag.DecodeIDKey(AIDKey: string; outAQry: TADOQuery): Boolean;
var
  rkey698, order699: string;
  lsql: string;
begin
  rkey698 := Copy(AIDKey, 1, Pos('-', AIDKey) - 1);
  order699 := Copy(AIDKey, Pos('-', AIDKey) + 1, Length(AIDKey) - Pos('-', AIDKey) + 1);
  lsql := 'select data0699.*,d25.REPORT_UNIT_VALUE1,d25.PWeight from data0699 inner join data0698 on data0698.rkey = data0699.pack_ptr ' +
        ' inner join data0025 d25 on d25.MANU_PART_NUMBER = data0699.MANU_PART_NUMBER ' +
    ' where pack_ptr = ' + rkey698 + ' and order_no = ' + order699 + ' and data0698.type = ' + QuotedStr('内箱');
  try
    outAQry.Close;
    outAQry.SQL.Clear;
    outAQry.SQL.Add(lsql);
    outAQry.Open;

    if outAQry.IsEmpty then
    begin
      Result := False;
      sndPlaySound('ERROR.wav', SND_ASYNC);
      ShowMessage('无效的内箱条码');
      Exit;
    end;

    Foneweight := outaqry.fieldbyname('REPORT_UNIT_VALUE1').asfloat;
    PWeight := outaqry.fieldbyname('PWeight').asfloat;
    Result := True;
  except
    on E: Exception do
    begin
      sndPlaySound('ERROR.wav', SND_ASYNC);
      ShowMessage(E.Message);
      Result := False;
    end;
  end;
end;

procedure TfrmCreateOutTag.FormCreate(Sender: TObject);
begin
  cdsIn.CreateDataSet;
  btnSetPCSClick(btnSetPCS);
end;

procedure TfrmCreateOutTag.edtBarInPutKeyPress(Sender: TObject; var Key: Char);
var
  LQry: TADOQuery;
  LRet: Boolean;
begin
  if Key = #13 then
  begin
    LRet := false;
    LQry := TADOQuery.Create(Self);
    LQry.Connection := DM1.con1;
    try
      if not DecodeIDKey(edtBarInPut.Text, LQry) then
        Exit;
      if not CheckPack(LQry) then
        Exit;
      if not cdsIn.IsEmpty then
      begin
        cdsIn.Last;
//        if LQry.FieldByName('order_no').AsInteger >= cdsIn.FieldByName('order_no').AsInteger then
//        begin
//          sndPlaySound('ERROR.wav', SND_ASYNC);
//          ShowMessage('请按从大到小的顺序扫描内包');
//          Exit;
//        end;
        //总数量
//        if LQry.FieldByName('qty').AsInteger + cdsIn.FieldByName('AllQty').Value > StrToInt(edtPcsNum.Text) then
//        begin
//          sndPlaySound('ERROR.wav', SND_ASYNC);
//          ShowMessage('数量超出外箱数量');
//          Exit;
//        end;
//        if LQry.FieldByName('qty').AsInteger + cdsIn.FieldByName('AllQty').Value = StrToInt(edtPcsNum.Text) then
//        begin
//          sndPlaySound('PASS.wav', SND_ASYNC);
//          btnPrint.Enabled := True;
//          //btnPrint.SetFocus;
//        end;
      end
      else
      begin
//        if LQry.FieldByName('qty').AsInteger > StrToInt(edtPcsNum.Text) then
//        begin
//          sndPlaySound('ERROR.wav', SND_ASYNC);
//          ShowMessage('数量超出外箱数量');
//          Exit;
//        end;
//        if LQry.FieldByName('qty').AsInteger = StrToInt(edtPcsNum.Text) then
//        begin
//          sndPlaySound('PASS.wav', SND_ASYNC);
//          btnPrint.Enabled := True;
//          //btnPrint.SetFocus;
//        end;
      end;
      if not AddToCds(LQry) then
        Exit;

      lblTargetWeight.Caption := FloatToStr(StrToIntDef(cdsIn.fieldbyname('allqty').AsString,0) * FOneWeight);
      lblPWeight.Caption := FloatToStr(cdsIn.RecordCount * PWeight);
      LRet := True;
    finally
      LQry.Free;
      edtBarInPut.Text := '';
      if not LRet then
      begin
        edtBarInPut.Enabled := False;
        btnPrint.Enabled := False;
        lbl4.Visible := True;
      end;
    end;
    //ShowMessage('不匹配，请检查后在扫描');
  end;
end;

procedure TfrmCreateOutTag.edtPcsNumKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnSetPCSClick(btnSetPCS);
    edtBarInPut.SetFocus;
  end;
end;

procedure TfrmCreateOutTag.FormShow(Sender: TObject);
var
  I: Integer;
  LIndex: Integer;
begin
  for I := 0 to dbgrd1.Columns.Count - 1 do
  begin
    lst1.Items.Add(dbgrd1.Columns[I].Title.Caption);
  end;

  LIndex := lst1.Items.IndexOf('本厂编号');
  if LIndex <> -1 then
    lst1.Checked[LIndex] := True;
  LIndex := lst1.Items.IndexOf('客户型号');
  if LIndex <> -1 then
    lst1.Checked[LIndex] := True;
  LIndex := lst1.Items.IndexOf('数量');
  if LIndex <> -1 then
    lst1.Checked[LIndex] := True;
  LIndex := lst1.Items.IndexOf('周期');
  if LIndex <> -1 then
    lst1.Checked[LIndex] := True;
  LIndex := lst1.Items.IndexOf('箱号');
  lst1.Checked[LIndex] := False;
//  if LIndex <> -1 then
//    lst1.Checked[LIndex] := True;
  LIndex := lst1.Items.IndexOf('条码');
  if LIndex <> -1 then
    lst1.Checked[LIndex] := True;

  //edt1.Enabled := gUser.User_Permit = '4';
  btnPrint.Visible := gUser.User_Permit = '4';
end;

function TfrmCreateOutTag.AddToCds(AQry: TADOQuery): Boolean;
var
  I: Integer;
  LField: TField;
begin
  Result := False;
  cdsIn.Append;
  cdsIn.FieldByName('idkey').AsString := AQry.fieldbyname('pack_ptr').AsString + '-' + AQry.fieldbyname('order_no').AsString;
  for I := 0 to cdsIn.Fields.Count - 1 do
  begin
    LField := AQry.FindField(cdsIn.Fields[I].FieldName);
    if LField <> nil then
      cdsIn.Fields[I].Value := LField.Value;
  end;
  cdsIn.Post;
  Result := True;
end;

function TfrmCreateOutTag.CheckPack(AQry: TADOQuery): Boolean;
var
  I: Integer;
  J: Integer;
  Ltmp: string;
begin
  Result := False;
  if cdsIn.IsEmpty then
    Result := True
  else
  begin
    //
    if cdsIn.Locate('pack_ptr;order_no', VarArrayOf([AQry.FieldByName('pack_ptr').AsInteger, AQry.FieldByName('order_no').AsInteger]), [loCaseInsensitive]) then
    begin
      ShowMessage('请勿重复扫描');
      Result := False;
      Exit;
    end;

    //
    cdsIn.Last;
    for I := 0 to lst1.Items.Count - 1 do
    begin
      if lst1.Checked[I] then
      begin
        for J := 0 to dbgrd1.Columns.Count - 1 do
        begin
          if dbgrd1.Columns[J].Title.Caption = lst1.Items[I] then
          begin

            if dbgrd1.Columns[J].Title.Caption = '箱号' then
            begin
              if LeftStr(AQry.FieldByName(dbgrd1.Columns[J].FieldName).Value, 4) <> LeftStr(cdsIn.FieldByName(dbgrd1.Columns[J].FieldName).Value, 4) then
              begin
                sndPlaySound('ERROR.wav', SND_ASYNC);
                ShowMessage(dbgrd1.Columns[J].Title.Caption + '  不匹配，请注意');
                Exit;
              end;
              if StrToInt(RightStr(AQry.FieldByName(dbgrd1.Columns[J].FieldName).Value, 2)) - StrToInt(RightStr(cdsIn.FieldByName(dbgrd1.Columns[J].FieldName).Value, 2)) <> -1 then
              begin
                sndPlaySound('ERROR.wav', SND_ASYNC);
                ShowMessage(dbgrd1.Columns[J].Title.Caption + '  请从大到小按顺序扫描');
                Exit;
              end;
            end
            else if dbgrd1.Columns[J].Title.Caption = '条码' then
            begin
              if LeftStr(AQry.FieldByName(dbgrd1.Columns[J].FieldName).Value, 16) <> LeftStr(cdsIn.FieldByName(dbgrd1.Columns[J].FieldName).Value, 16) then
              begin
                sndPlaySound('ERROR.wav', SND_ASYNC);
                ShowMessage(dbgrd1.Columns[J].Title.Caption + '  不匹配，请注意');
                Exit;
              end;
            end
            else if dbgrd1.Columns[J].Title.Caption = '本厂编号' then
            begin
              Ltmp := cdsIn.FieldByName(dbgrd1.Columns[J].FieldName).AsString;
              if LeftStr(AQry.FieldByName(dbgrd1.Columns[J].FieldName).Value, 8) <> LeftStr(cdsIn.FieldByName(dbgrd1.Columns[J].FieldName).Value, 8) then
              begin
                sndPlaySound('ERROR.wav', SND_ASYNC);
                ShowMessage(dbgrd1.Columns[J].Title.Caption + '  不匹配，请注意');
                Exit;
              end;
            end
            else if AQry.FieldByName(dbgrd1.Columns[J].FieldName).Value <> cdsIn.FieldByName(dbgrd1.Columns[J].FieldName).Value then
            begin
              sndPlaySound('ERROR.wav', SND_ASYNC);
              ShowMessage(dbgrd1.Columns[J].Title.Caption + '  不匹配，请注意');
              Exit;
            end;
          end;
        end;
      end;
    end;
    Result := True;
  end;
end;

function TfrmCreateOutTag.Create698(out ARkey698: string): Boolean;
var
  LQry: TADOQuery;
  LField: TField;
  I: Integer;
  LBQDM: string;
  LSvrTIme: TDateTime;
  LRkey698: string;
  LBar: string;
  ltmplot: string;
begin
  Result := False;
  LQry := TADOQuery.Create(Self);
  DM1.con1.BeginTrans;
  try
    //取得标签代码
    DM1.SqlOpen('select SEED_VALUE,seed_flag,table_name,datename(week,getdate()) as Nowweek, datename(year,getdate()) as NowYear,getdate() as nowtime  from data0004  where rkey = 74');
    if DM1.qrytmp.IsEmpty then
    begin
      LBQDM := '00001';
      LSvrTIme := Now;
    end
    else
    begin
      LBQDM := DM1.qrytmp.FieldByName('SEED_VALUE').AsString;
      LSvrTIme := DM1.qrytmp.fieldbyname('nowtime').AsDateTime;
    end;

    DM1.SqlOpen('select * from data0698 where rkey = ' + cdsIn.fieldbyname('pack_ptr').AsString);

    LQry.Connection := DM1.con1;
    LQry.SQL.Text := 'select * from data0698 where rkey = -1';
    LQry.Open;
    LQry.Append;
    for I := 0 to LQry.Fields.Count - 1 do
    begin
      LField := DM1.qrytmp.FindField(LQry.Fields[I].FieldName);
      if LField <> nil then
      begin
        if UpperCase(LField.FieldName) = 'RKEY' then
        begin

        end
        else if LowerCase(LField.FieldName) = 'pack_number' then
        begin
          LQry.Fields[I].Value := LBQDM;
        end
        else if LowerCase(LField.FieldName) = 'qty' then
        begin
          LQry.Fields[I].Value := cdsIn.fieldbyname('AllQty').Value;//StrToInt(edtPcsNum.Text);
        end
        else if LowerCase(LField.FieldName) = 'v_print' then
        begin
          LQry.Fields[I].Value := 0;
        end
        else if LowerCase(LField.FieldName) = 'v_date' then
        begin
          LQry.Fields[I].Value := LSvrTIme;
        end
        else if LowerCase(LField.FieldName) = 'empl_ptr' then
        begin
          LQry.Fields[I].Value := gUser.User_Ptr;
        end
        else if LowerCase(LField.FieldName) = 'pack_item' then
        begin
          LQry.Fields[I].Value := cdsIn.RecordCount;
        end
        else if LowerCase(LField.FieldName) = 'type' then
        begin
          LQry.Fields[I].Value := '外箱';
        end else
        if LowerCase(LField.FieldName) = LowerCase('netWeight') then
        begin
          LQry.Fields[I].Value := LeftStr(FloatToStr(FMsgWeight),7);
        end else        
        begin
          LQry.Fields[I].Value := LField.Value;
        end;
      end;
    end;
    LQry.Post;
    LRkey698 := LQry.fieldbyname('rkey').AsString;
    ARkey698 := LRkey698;
    //标签代码+1
    LBQDM := IncBQDM(LBQDM);
    if not DM1.SqlExec('UPDATE Data0004 SET SEED_VALUE = ' + QuotedStr(LBQDM) + ' WHERE RKey = 74') then
    begin
      Exit;
    end;

    //是否多lot判断
    ltmplot := '';
    cdsIn.First;
    while not cdsIn.eof do
    begin
      if ltmplot = '' then
      begin
        ltmplot := cdsIn.fieldbyname('lotorder').AsString;
        cdsin.Next;
        Continue;
      end;
      if cdsIn.FieldByName('lotorder').AsString <> ltmplot then
      begin
        ltmplot := '多Lot';
        break;
      end;
      cdsIn.Next;
    end;

    //生成699
    cdsIn.Last;
    LQry.Close;
    LQry.SQL.Text := 'select * from data0699 where pack_ptr = ' + LRkey698;
    LQry.Open;
    LQry.Append;
    for I := 0 to LQry.Fields.Count - 1 do
    begin
      LField := cdsIn.FindField(LQry.Fields[I].FieldName);
      if LField <> nil then
      begin
        if LowerCase(LField.FieldName) = 'pack_ptr' then
        begin
          LQry.Fields[I].Value := LRkey698;
        end
        else if LowerCase(LField.FieldName) = 'order_no' then
        begin
          LQry.Fields[I].Value := 1;
        end
        else if LowerCase(LField.FieldName) = 'qty' then
        begin
          LQry.Fields[I].Value := cdsIn.fieldbyname('allqty').Value;//StrToInt(edtPcsNum.Text);
        end
        else if LowerCase(LField.FieldName) = 'barcode_id' then
        begin
          LBar := Copy(cdsIn.fieldbyname('barcode_id').AsString, 1, 16);
          LBar := LBar + Format('%.4d', [StrToInt(cdsIn.fieldbyname('allqty').AsString)]);
          LBar := LBar + Copy(cdsIn.fieldbyname('barcode_id').AsString, 21, 4);
          LBar := LBar + RightStr('000000' + cdsIn.fieldbyname('LotOrder').AsString, 6);
          LQry.Fields[I].Value := LBar;
          if Length(LBar) <> 30 then
          begin
            DM1.con1.RollbackTrans;
            ShowMessage('条码长度不等于30位，错误');
            Exit;
          end;
        end
        else if LowerCase(LField.FieldName) = 'caseno' then
        begin
          LQry.Fields[I].Value := LeftStr(cdsIn.fieldbyname('caseno').AsString, 4);
        end
        else
        if LowerCase(LField.FieldName) = 'param2' then
        begin
          LQry.Fields[I].Value := ltmplot;
        end else
        begin
          LQry.Fields[I].Value := LField.Value;
        end;
      end;
    end;


    LQry.Post;

    cdsIn.First;
    while not cdsIn.Eof do
    begin
      LQry.Close;
      LQry.SQL.Text := 'update data0699 set outpackkey = ' + LRkey698 + ' where pack_ptr=' + cdsIn.fieldbyname('pack_ptr').AsString + ' and order_no = ' + cdsIn.fieldbyname('order_no').AsString;
      LQry.ExecSQL;
      cdsIn.Next;
    end;

    DM1.con1.CommitTrans;
    Result := True;
  finally
    LQry.Free;
    if DM1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      Result := False;
    end;
  end;
end;

function TfrmCreateOutTag.IncBQDM(AOldDM: string): string;
var
  I: Integer;
  nIndex: Integer;
  tmps: string;
begin
  nIndex := -1;
  for I := 1 to Length(AOldDM) do
  begin
    if AOldDM[I] in ['0'..'9'] then
    begin
      if nIndex = -1 then
        nIndex := I - 1;
      tmps := tmps + AOldDM[I];
    end
    else
    begin
      nIndex := -1;
      tmps := '';
    end;
  end;
  if nIndex = -1 then
    Result := AOldDM + Format('%.1d', [StrToIntDef(tmps, 1) + 1])
  else
    Result := Copy(AOldDM, 1, nIndex) + Format('%.1d', [StrToIntDef(tmps, 1) + 1]);
end;

procedure TfrmCreateOutTag.lst1ClickCheck(Sender: TObject);
var
  LIndex: Integer;
begin
  LIndex := lst1.Items.IndexOf('本厂编号');
  if LIndex <> -1 then
    lst1.Checked[LIndex] := True;
  LIndex := lst1.Items.IndexOf('客户型号');
  if LIndex <> -1 then
    lst1.Checked[LIndex] := True;
//  LIndex := lst1.Items.IndexOf('数量');
//  if LIndex <> -1 then
//    lst1.Checked[LIndex] := True;
  LIndex := lst1.Items.IndexOf('周期');
  if LIndex <> -1 then
    lst1.Checked[LIndex] := True;
  //LIndex := lst1.Items.IndexOf('箱号');
  //lst1.Checked[LIndex] := False;
//  if LIndex <> -1 then
//    lst1.Checked[LIndex] := True;
  LIndex := lst1.Items.IndexOf('条码');
  if LIndex <> -1 then
    lst1.Checked[LIndex] := True;
end;

procedure TfrmCreateOutTag.GetStrMsg(var Msg: TMessage);
var
  LFudong: Single;
begin
  LFudong := (StrToFloatDef(lblTargetWeight.Caption,0) +
              StrToFloatDef(lblPWeight.Caption,0)
     ) * StrToFloatDef(edt1.Text,0) / 100;

  //LFudong := PWeight;

  if Abs(StrToFloatDef(lblTargetWeight.Caption,0) + StrToFloatDef(lblPWeight.Caption,0) - Single(Psingle(@Msg.LParam)^)) <= LFudong then
  begin
  if btnPrint.Enabled then
  begin
      FMsgWeight := Single(Psingle(@Msg.LParam)^);
      btnPrintClick(btnPrint);
  end else
  begin

  end;
  end else
  begin
    ShowMessage('重量不符 ERP：' + lblTargetWeight.Caption + #13 +
          ' 包装重' + lblPWeight.Caption + #13 +
    '  电子秤:' + FloatToStr(Single(Psingle(@Msg.LParam)^)));
  end;
end;

end.


