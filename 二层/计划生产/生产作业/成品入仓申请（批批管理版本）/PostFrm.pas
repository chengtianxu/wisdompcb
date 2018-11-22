unit PostFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, ExtCtrls, DB, ADODB, DM;

type
  TfrmPost = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lvPO: TListView;
    btn1: TButton;
    edtmanupart: TEdit;
    lbl1: TLabel;
    edtpcs: TEdit;
    lbl5: TLabel;
    edtpnl: TEdit;
    lbl6: TLabel;
    lbl8: TLabel;
    edtbaknote: TEdit;
    lbl7: TLabel;
    edtwight: TEdit;
    lblErrNote: TLabel;
    adsWO: TADODataSet;
    adsWOWORK_ORDER_NUMBER: TStringField;
    adsWOQTY_BACKLOG: TFloatField;
    adsWOPANELS: TIntegerField;
    lvWO: TListView;
    adsPO: TADODataSet;
    adsPOSCH_DATE: TDateTimeField;
    adsPOSALES_ORDER: TStringField;
    adsPOAlsoNeed: TFloatField;
    adsPOCanPost: TFloatField;
    adsPOREPUT_APPR_BY: TIntegerField;
    adsPOrkey60: TAutoIncField;
    adsWOrkey06: TAutoIncField;
    adsWOrkey56: TAutoIncField;
    pnl5: TPanel;
    lbl9: TLabel;
    lbl10: TLabel;
    pnl6: TPanel;
    lbl12: TLabel;
    lbl13: TLabel;
    adsPOCOMMISION_ON_TOOLING: TStringField;
    lblWS: TLabel;
    adsWOPARTS_PER_PANEL: TFloatField;
    rg1: TRadioGroup;
    lbl11: TLabel;
    edtZQ: TEdit;
    procedure FormShow(Sender: TObject);
    procedure lvPOCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvWOCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure edtpcsExit(Sender: TObject);
    procedure edtpcsKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtwightKeyPress(Sender: TObject; var Key: Char);
    procedure edtwightExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FRkey25: string;
    FbWeiShu: Boolean;//是否尾数
    FInputPcs,FInputPnl: Integer;
    FSelectPOPostNum,FSelectWOPostNum: Integer;
    function GetPartPerPnl(ARkey06: Integer): Integer;
    procedure GetPO;
    procedure GetWO;
    procedure SelectPO;
    procedure SelectWO;
    function POPostData: Boolean;
    function NoPOPostData: Boolean;
    function PostCheck: boolean;
  end;

implementation

uses
  WZ_gUnit, Math;


{$R *.dfm}

{ TfrmPost }

procedure TfrmPost.GetPO;
var
  Sum1,Sum2: Integer;
begin
  Sum1 := 0;
  Sum2 := 0;
  lvPO.Clear;
  adsPO.Close;
  adsPO.Parameters[0].Value := Copy(edtmanupart.Text,1,Length(edtmanupart.Text) - 2) + '%';
  adsPO.Open;
  adsPO.First;
  while not adsPO.Eof do
  begin
    with lvPO.Items.Add do
    begin
      SubItems.Add(adsPO.fieldbyname('SALES_ORDER').AsString);
      SubItems.Add(adsPO.fieldbyname('SCH_DATE').AsString);
      SubItems.Add(adsPO.fieldbyname('AlsoNeed').AsString);
      SubItems.Add(IntToStr(adsPO.fieldbyname('CanPost').asinteger));
      SubItems.Add('0');
      Data := Pointer(adsPO.fieldbyname('rkey60').AsInteger);
    end;
    Sum1 := adsPO.fieldbyname('AlsoNeed').AsInteger + Sum1;
    Sum2 := adsPO.fieldbyname('CanPost').AsInteger + Sum2;
    adsPO.Next;
  end;
  lbl10.Caption := IntToStr(Sum1);
  lbl9.Caption := IntToStr(Sum2);
end;

procedure TfrmPost.GetWO;
var
  Sum1,Sum2: Integer;
begin
  Sum1 := 0;
  Sum2 := 0;
  lvWO.Clear;
  adsWO.Close;
  adsWO.Parameters[0].Value := edtmanupart.Text;//Copy(edtmanupart.Text,1,Length(edtmanupart.Text) - 2) + '%';
  adsWO.Open;

  adsWO.First;
  while not adsWO.Eof do
  begin
    with lvWO.Items.Add do
    begin
      SubItems.Add(adsWO.fieldbyname('WORK_ORDER_NUMBER').AsString);
      SubItems.Add(IntToStr(adsWO.fieldbyname('QTY_BACKLOG').AsInteger));
      SubItems.Add(IntToStr(adsWO.fieldbyname('PANELS').AsInteger));
      SubItems.Add('0');
      SubItems.Add('0');
      Data := Pointer(adsWO.fieldbyname('rkey06').AsInteger);
    end;
    Sum1 := adsWO.fieldbyname('QTY_BACKLOG').AsInteger + Sum1;
    Sum2 := adsWO.fieldbyname('PANELS').AsInteger + Sum2;
    adsWO.Next;
  end;
  lbl13.Caption := IntToStr(Sum1);
  lbl12.Caption := IntToStr(Sum2);  
end;

procedure TfrmPost.FormShow(Sender: TObject);
begin
  if not FbWeiShu then GetPO;
  lblWS.Visible := FbWeiShu;
  GetWO;
end;

procedure TfrmPost.lvPOCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if StrToInt(Item.SubItems[4]) > 0 then Sender.Canvas.Brush.Color := clMoneyGreen;
end;

procedure TfrmPost.lvWOCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if StrToInt(Item.SubItems[3]) > 0 then Sender.Canvas.Brush.Color := clMoneyGreen;
end;

procedure TfrmPost.edtpcsExit(Sender: TObject);
begin
  if edtpcs.Text = '' then edtpcs.Text := '0';
  if edtpnl.Text = '' then edtpnl.Text := '0';
  FInputPcs := StrToInt(edtpcs.Text);
  FInputPnl := StrToInt(edtpnl.Text);
  SelectPO;
  if lblErrNote.Caption <> '' then Exit;
  SelectWO;
  if lblErrNote.Caption <> '' then Exit;
end;

procedure TfrmPost.SelectPO;
var
  I: Integer;
  tmp: Integer;
begin
  FSelectPOPostNum := 0;
  if FbWeiShu then Exit;
  if FInputPcs > StrToInt(lbl9.Caption) then
  begin
    lblErrNote.Caption := '数量大于订单总数';
    edtpcs.SetFocus;
    Exit;
  end else
    lblErrNote.Caption := '';
  for I := 0 to lvPO.Items.Count - 1 do
    lvPO.Items[I].SubItems[4] := '0';
  tmp := 0;
  for I := 0 to lvPO.Items.Count - 1 do
  begin
    if tmp + StrToInt(lvPO.Items[I].SubItems[3]) > FInputPcs then
    begin
      lvPO.Items[I].SubItems[4] := IntToStr(FInputPcs - tmp);
      tmp := FInputPcs;
      Break;
    end else
    begin
      lvPO.Items[I].SubItems[4] := lvPO.Items[I].SubItems[3];
      tmp := tmp + StrToInt(lvPO.Items[I].SubItems[3]);
    end;
  end;
  FSelectPOPostNum := tmp;
  lvPO.Invalidate;
end;

procedure TfrmPost.SelectWO;
var
  I: Integer;
  tmp: Integer;
  LRkey06: Integer;
begin
  FSelectWOPostNum := 0;
  if FInputPcs > StrToInt(lbl13.Caption) then
  begin
    lblErrNote.Caption := '数量大于在线总数';
    edtpcs.SetFocus;
    Exit;
  end else
    lblErrNote.Caption := '';
  for I := 0 to lvWO.Items.Count - 1 do
  begin
    lvWO.Items[I].SubItems[3] := '0';
    lvWO.Items[I].SubItems[4] := '0';
  end;
  tmp := 0;
  for I := 0 to lvWO.Items.Count - 1 do
  begin
    LRkey06 := Integer(Pointer(lvWO.Items[I].Data));
    if tmp + StrToInt(lvWO.Items[I].SubItems[1]) > FInputPcs then
    begin
      lvWO.Items[I].SubItems[3] := IntToStr(FInputPcs - tmp);
      lvWO.Items[I].SubItems[4] := IntToStr(Min(StrToIntDef(lvWO.Items[I].SubItems[2],0),Round((FInputPcs - tmp) / GetPartPerPnl(LRkey06))));
      tmp := FInputPcs;
      Break;
    end else
    begin
      lvWO.Items[I].SubItems[3] := lvWO.Items[I].SubItems[1];
      lvWO.Items[I].SubItems[4] := lvWO.Items[I].SubItems[2];
      tmp := tmp + StrToInt(lvWO.Items[I].SubItems[1]);
    end;
  end;
  FSelectWOPostNum := tmp;
  lvWO.Invalidate;
end;

procedure TfrmPost.edtpcsKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9',#8]) then Key := #0;
end;

procedure TfrmPost.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Perform(WM_NEXTDLGCTL,0,0);
end;

function TfrmPost.POPostData: Boolean;
var
  I, J: Integer;
  LSql: string;
  LPONeed,LWOWillPost,LPostPCS,LHasPostNum,LPostPnl,LWillPostPnl: Integer;
  LNowDateTime: TDateTime;
  LRkey06,LRkey60: Integer;
  LPO_Number: string;
  LRkey25: Integer;
  lOldWeight: Double;
begin
  Result := False;
  LHasPostNum := 0;
  LPostPCS := 0;
  LPostPnl := 0;
  LNowDateTime := dm1.GetServerDatetime;
  dm1.con1.BeginTrans;
  try
    for I := 0 to lvPO.Items.Count - 1 do
    begin
      LPONeed := StrToInt(lvPO.Items[I].SubItems[4]);
      LRkey60 := Integer(Pointer(lvPO.Items[I].Data));
      if LPONeed = 0 then Break;
      if LHasPostNum >= StrToInt(edtpcs.Text) then Break;
      for J := 0 to lvWO.Items.Count - 1 do
      begin
        if LPONeed = 0 then Break;
        LRkey06 := Integer(Pointer(lvWO.Items[J].Data));
        LWOWillPost := StrToInt(lvWO.Items[J].SubItems[3]);
        LWillPostPnl := StrToInt(lvWO.Items[J].SubItems[4]);
        if LWOWillPost = 0 then Continue;
        if LPONeed > LWOWillPost then
        begin
          LPONeed := LPONeed - LWOWillPost;
          LPostPCS := LWOWillPost;
          LPostPnl := LWillPostPnl;
          lvWO.Items[J].SubItems[3] := '0';
          lvWO.Items[J].SubItems[4] := '0';
        end else
        if LPONeed = LWOWillPost then
        begin
          LPONeed := LPONeed - LWOWillPost;
          LPostPCS := LWOWillPost;
          LPostPnl := LWillPostPnl;
          lvWO.Items[J].SubItems[3] := '0';
          lvWO.Items[J].SubItems[4] := '0';
        end else
        if LPONeed < LWOWillPost then
        begin
          LPostPCS := LPONeed;
          LPostPnl := Min(Trunc(LPostPCS/GetPartPerPnl(LRkey06)),LWillPostPnl);
          LPONeed := 0;
          lvWO.Items[J].SubItems[3] := IntToStr(LWOWillPost - LPostPCS) ;
          lvWO.Items[J].SubItems[4] := IntToStr(LWillPostPnl - LPostPnl);
        end;

        LHasPostNum := LHasPostNum + LPostPCS;
        //251表插入
        LSql := 'select * from data0251 where rkey = -1';
        if dm1.SqlOpen(LSql) then
        begin
          dm1.qrytmp.Append;
          dm1.qrytmp.FieldByName('wo_ptr').AsInteger := LRkey06;
          dm1.qrytmp.FieldByName('po_ptr').AsInteger := LRkey60;
          dm1.qrytmp.FieldByName('ctime').AsDateTime := LNowDateTime;
          dm1.qrytmp.FieldByName('cuser_ptr').AsString := gUser.User_Ptr;
          dm1.qrytmp.FieldByName('cpcs').AsInteger := LPostPCS;
          dm1.qrytmp.FieldByName('cpnl').AsInteger := LPostPnl;
          dm1.qrytmp.FieldByName('status').AsInteger := 0;
          dm1.qrytmp.FieldByName('BKNote').AsString := edtbaknote.Text;
          dm1.qrytmp.FieldByName('IsChaBan').AsInteger := rg1.ItemIndex;
          dm1.qrytmp.FieldByName('ZhouQi').AsString := edtZQ.Text;
          dm1.qrytmp.Post;
        end else
          exit;

        //56表操作
        LSql := 'select PO_Number from data0097 where rkey = (select PURCHASE_ORDER_PTR from data0060 where rkey = ' + IntToStr(LRkey60) + ')';
        if dm1.SqlOpen(LSql) then
        begin
          if not dm1.qrytmp.IsEmpty then
          begin
            LPO_Number := dm1.qrytmp.fieldbyname('PO_Number').AsString;
          end;
        end else
          Exit;
        LSql := 'select * from data0056 where wo_ptr = ' + IntToStr(LRkey06);
        if dm1.SqlOpen(LSql) then
        begin
          if not dm1.qrytmp.IsEmpty then
          begin
            dm1.qrytmp.Edit;
            dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger := dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger + LPostPCS;
            dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger := dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger + LPostPnl;
            dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger := dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger - LPostPCS;
            dm1.qrytmp.FieldByName('PANELS').AsInteger := dm1.qrytmp.FieldByName('PANELS').AsInteger - LPostPnl;
            dm1.qrytmp.FieldByName('employee_ptr').AsString := gUser.User_Ptr;
            dm1.qrytmp.FieldByName('tobestock_date').AsDateTime := LNowDateTime;
            dm1.qrytmp.FieldByName('REFERENCE').AsString := Trim(edtbaknote.Text);
            dm1.qrytmp.FieldByName('PO_NUMBER').AsString := LPO_Number ;
            dm1.qrytmp.FieldByName('UNIT_PTR').AsInteger := LRkey60;
            dm1.qrytmp.Post;
          end else
          begin
            //ShowMessage('没有在线数据');
            Exit;
          end;          

        end else
          Exit;

        //60表操作
        LSql := 'select * from data0060 where rkey = ' + IntToStr(LRkey60);
        if dm1.SqlOpen(LSql) then
        begin
          if not dm1.qrytmp.IsEmpty then
          begin
            dm1.qrytmp.Edit;
            dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger := dm1.qrytmp.FieldByName('REPUT_APPR_BY').AsInteger + LPostPCS;
            dm1.qrytmp.Post;
          end else
          begin
            //ShowMessage('没有找到订单');
            Exit;
          end;
        end else
          Exit;     

        //产品重量
        LSql := 'select rkey,report_unit_value1 from data0025 where rkey= (select bom_ptr from data0006 where rkey = ' + IntToStr(LRkey06) + ')';
        if dm1.SqlOpen(LSql) then
        begin
          LRkey25 := dm1.qrytmp.fieldbyname('rkey').AsInteger;
          lOldWeight := dm1.qrytmp.fieldbyname('report_unit_value1').AsFloat;
          if Abs(dm1.qrytmp.FieldByName('report_unit_value1').AsFloat - StrToFloat(edtwight.Text)) > 0.000001 then
          begin
            dm1.qrytmp.Edit;
            dm1.qrytmp.FieldByName('report_unit_value1').AsFloat := StrToFloat(edtwight.Text);
            dm1.qrytmp.Post;

            //更改产品重量写日志
            LSql := 'select * from data0318 where rkey = -1';
            if dm1.SqlOpen(LSql) then
            begin
              dm1.qrytmp.Append;
              dm1.qrytmp.FieldByName('CUSTOMER_PART_PTR').AsInteger := LRkey25;
              dm1.qrytmp.FieldByName('TRANS_TYPE').AsInteger := 25;
              dm1.qrytmp.FieldByName('TRANS_DESCRIPTION').AsString := '提交入库时变更产品单重';
              dm1.qrytmp.FieldByName('FROM_STRING').AsString := FloatToStr(LOldWeight);
              dm1.qrytmp.FieldByName('TO_STRING').AsString := edtwight.Text;
              dm1.qrytmp.FieldByName('USER_PTR').AsString := gUser.User_Ptr; 
              dm1.qrytmp.FieldByName('TRANS_DATE').AsDateTime := LNowDateTime;
              dm1.qrytmp.FieldByName('PROGRAM_SOURCE').AsInteger := 22;
              dm1.qrytmp.Post;
            end;
          end;
        end;
             
      end;
    end;
    dm1.con1.CommitTrans;
    Result := True;
  finally
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      Result := False;
    end;
  end;
end;

function TfrmPost.PostCheck: boolean;
begin
  lblErrNote.Caption := '';
  Result := False;
  if dm1.IS_Stock_Inventorying then
  begin
    ShowMessage('在线产品正在盘点,当前不能提交入库');
    Exit;
  end;
  if (gUser.User_Permit = '1') or (gUser.User_Permit = '3') then
  begin
    ShowMessage('你只有检查权限，不能更改数数据！！');
    Exit;
  end;  
  if not FbWeiShu then GetPO;
  GetWO;
  if not FbWeiShu then SelectPO;
  if lblErrNote.Caption <> '' then Exit;
  SelectWO;
  if lblErrNote.Caption <> '' then Exit;
  if FSelectWOPostNum = 0 then
  begin
    lblErrNote.Caption := '提交的数量为0';
    Exit;
  end;
  if not FbWeiShu and (FSelectPOPostNum = 0) then
  begin
    lblErrNote.Caption := '没有有效的订单';
    Exit;
  end;
  if FbWeiShu and (Trim(edtbaknote.Text) = '') then
  begin
    lblErrNote.Caption := '尾数必须写备注';
    Exit;
  end;
  if StrToFloatdef(edtwight.Text,-1) < 0 then
  begin
    edtwight.SetFocus;
    lblErrNote.Caption := '请填写正确的重量';
    Exit;
  end;
  if not FbWeiShu then
  begin
    adsPO.First;
    while not adsPO.Eof do
    begin
      if UpperCase(adsPO.fieldbyname('COMMISION_ON_TOOLING').AsString) = 'Y' then
      begin
        if StrToFloatdef(edtwight.Text,0) = 0 then
        begin
          edtwight.SetFocus;
          lblErrNote.Caption := '重量不能为0';
          Exit;
        end;
      end;
      adsPO.Next;
    end;
  end;
  Result := True;
end;

procedure TfrmPost.edtwightKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = '.') and (Pos('.',edtwight.Text) > 0) then Key := #0;
  if not (Key in ['0'..'9',#8,'.']) then Key := #0;
end;

procedure TfrmPost.edtwightExit(Sender: TObject);
begin
  if Trim(edtwight.Text) = '' then edtwight.Text := '0';
end;

procedure TfrmPost.btn1Click(Sender: TObject);
begin
  if Trim(edtZQ.Text) = '' then
  begin
    ShowMessage('周期不能为空');
    Exit;
  end;
  if PostCheck then
  begin
  
    if (not FbWeiShu) then
    begin
      if POPostData then
        ModalResult := mrOk
      else
        ShowMessage('保存失败');
    end;
    
    if FbWeiShu then
    begin
      if NoPOPostData then
        ModalResult := mrOk
      else
        ShowMessage('保存失败');
    end;
  end;
end;

function TfrmPost.NoPOPostData: Boolean;
var
  I: Integer;
  LHasPostNum,LPostPCS, LPostPnl: Integer;
  LNowDateTime: TDateTime;
  LRkey06: Integer;
  LRkey25: Integer;
  lOldWeight: Double;
  LSql: string;
begin
  Result := False;
  LNowDateTime := dm1.GetServerDatetime;
  LHasPostNum := 0;
  dm1.con1.BeginTrans;
  try
    for I := 0 to lvWO.Items.Count - 1 do
    begin
      LRkey06 := Integer(Pointer(lvWO.Items[I].Data));
      LPostPCS := StrToInt(lvWO.Items[I].SubItems[3]);
      LPostPnl := StrToInt(lvWO.Items[I].SubItems[4]);
      if LPostPCS = 0 then Break;
      if LHasPostNum >= StrToInt(edtpcs.Text) then Break;
      LHasPostNum := LHasPostNum + LPostPCS;
      //251表插入
      LSql := 'select * from data0251 where rkey = -1';
      if dm1.SqlOpen(LSql) then
      begin
        dm1.qrytmp.Append;
        dm1.qrytmp.FieldByName('wo_ptr').AsInteger := LRkey06;
        //dm1.qrytmp.FieldByName('po_ptr').AsInteger := LRkey60;
        dm1.qrytmp.FieldByName('ctime').AsDateTime := LNowDateTime;
        dm1.qrytmp.FieldByName('cuser_ptr').AsString := gUser.User_Ptr;
        dm1.qrytmp.FieldByName('cpcs').AsInteger := LPostPCS;
        dm1.qrytmp.FieldByName('cpnl').AsInteger := LPostPnl;
        dm1.qrytmp.FieldByName('status').AsInteger := 0;
        dm1.qrytmp.FieldByName('BKNote').AsString := edtbaknote.Text;
        dm1.qrytmp.Post;
      end else
        exit;

      //56表操作
      LSql := 'select * from data0056 where wo_ptr = ' + IntToStr(LRkey06);
      if dm1.SqlOpen(LSql) then
      begin
        if not dm1.qrytmp.IsEmpty then
        begin
          dm1.qrytmp.Edit;
          dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger := dm1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger + LPostPCS;
          dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger := dm1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger + LPostPnl;
          dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger := dm1.qrytmp.FieldByName('QTY_BACKLOG').AsInteger - LPostPCS;
          dm1.qrytmp.FieldByName('PANELS').AsInteger := dm1.qrytmp.FieldByName('PANELS').AsInteger - LPostPnl;
          dm1.qrytmp.FieldByName('employee_ptr').AsString := gUser.User_Ptr;
          dm1.qrytmp.FieldByName('tobestock_date').AsDateTime := LNowDateTime;
          dm1.qrytmp.FieldByName('REFERENCE').AsString := Trim(edtbaknote.Text);
          //dm1.qrytmp.FieldByName('PO_NUMBER').AsString := LPO_Number ;
          //dm1.qrytmp.FieldByName('UNIT_PTR').AsInteger := LRkey60;
          dm1.qrytmp.Post;
        end else
        begin
          //ShowMessage('没有找到在线数据');
          Exit;
        end;
      end else
        Exit;

      //产品重量
      LSql := 'select rkey,report_unit_value1 from data0025 where rkey= (select bom_ptr from data0006 where rkey = ' + IntToStr(LRkey06) + ')';
      if dm1.SqlOpen(LSql) then
      begin
        LRkey25 := dm1.qrytmp.fieldbyname('rkey').AsInteger;
        lOldWeight := dm1.qrytmp.fieldbyname('report_unit_value1').AsFloat;
        if Abs(dm1.qrytmp.FieldByName('report_unit_value1').AsFloat - StrToFloat(edtwight.Text)) > 0.000001 then
        begin
          dm1.qrytmp.Edit;
          dm1.qrytmp.FieldByName('report_unit_value1').AsFloat := StrToFloat(edtwight.Text);
          dm1.qrytmp.Post;

          //更改产品重量写日志
          LSql := 'select * from data0318 where rkey = -1';
          if dm1.SqlOpen(LSql) then
          begin
            dm1.qrytmp.Append;
            dm1.qrytmp.FieldByName('CUSTOMER_PART_PTR').AsInteger := LRkey25;
            dm1.qrytmp.FieldByName('TRANS_TYPE').AsInteger := 25;
            dm1.qrytmp.FieldByName('TRANS_DESCRIPTION').AsString := '提交入库时变更产品单重';
            dm1.qrytmp.FieldByName('FROM_STRING').AsString := FloatToStr(LOldWeight);
            dm1.qrytmp.FieldByName('TO_STRING').AsString := edtwight.Text;
            dm1.qrytmp.FieldByName('USER_PTR').AsString := gUser.User_Ptr; 
            dm1.qrytmp.FieldByName('TRANS_DATE').AsDateTime := LNowDateTime;
            dm1.qrytmp.FieldByName('PROGRAM_SOURCE').AsInteger := 22;
            dm1.qrytmp.Post;
          end;
        end;
      end else
        Exit;
    end;
    dm1.con1.CommitTrans;
    Result := True;
  finally
    if dm1.con1.InTransaction then
    begin
      dm1.con1.RollbackTrans;
      Result := False;
    end;
  end;
end;

function TfrmPost.GetPartPerPnl(ARkey06: Integer): Integer;
begin
  if adsWO.Locate('rkey06',ARkey06,[]) then
    Result := adsWO.fieldbyname('PARTS_PER_PANEL').AsInteger
  else
    Result := 1;
end;

end.
