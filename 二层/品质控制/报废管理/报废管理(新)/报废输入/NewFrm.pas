unit NewFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, DB, DBClient, Buttons,ADODB, Grids,
  DBGridEh;

type
  TDSPickListFrmInitData = record
  end;
  TfrmNew = class(TForm)
    pnl1: TPanel;
    grp1: TGroupBox;
    grp2: TGroupBox;
    edtBFDH: TLabeledEdit;
    edtTime: TLabeledEdit;
    edtSQGX: TLabeledEdit;
    grp3: TGroupBox;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl9: TLabel;
    edtPCS: TLabeledEdit;
    edtPNL: TLabeledEdit;
    edtZYDH: TEdit;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    edtQXDM: TEdit;
    lbl3: TLabel;
    lbl5: TLabel;
    lblQXMC: TLabel;
    lblBFLX: TLabel;
    grp4: TGroupBox;
    lbl8: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lblBCBH: TLabel;
    lblZXPCS: TLabel;
    lblPCSPERPNL: TLabel;
    lblKHXH: TLabel;
    lblZXPNL: TLabel;
    btn3: TButton;
    lblYBFS: TLabel;
    lbl15: TLabel;
    edtBZ: TEdit;
    lbl6: TLabel;
    btn4: TSpeedButton;
    lblNote: TLabel;
    edtFSGX: TEdit;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    lbl1: TLabel;
    cbxBFGC: TComboBox;
    lbl7: TLabel;
    lblZRBM: TLabel;
    edt1: TEdit;
    cbx1: TCheckBox;
    edt2: TEdit;
    lbl16: TLabel;
    edt3: TEdit;
    cbx2: TCheckBox;
    grpIn: TGroupBox;
    ehIn: TDBGridEh;
    procedure btn1Click(Sender: TObject);
    procedure edtPCSKeyPress(Sender: TObject; var Key: Char);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure edtPCSExit(Sender: TObject);
    procedure edtZYDHExit(Sender: TObject);
    procedure edtQXDMExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtFSGXExit(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure cbx1Click(Sender: TObject);
    procedure cbx2Click(Sender: TObject);
  private
    { Private declarations }
    FFSStep: Integer;
    function CheckWONumber(Abbr: Boolean): Boolean;
    function CheckQXDM: Boolean;
    function CheckZRGX: Boolean;
    function CheckBFNumber: Boolean;
    function getsystem_date(Query: TAdoQuery; datetype: byte): tdatetime;
    function CheckData:Boolean;

  public
    { Public declarations }
    FBFType: Integer;//0 = 在线输入， 1=MRB鉴定报废
    FRkey25: string;
    FType06: Integer;     //0表示外层   1表示内层
    procedure InitFrm;
    procedure MRBBFCheckInit(A06Rkey: string);
    procedure ShowBFInfo(A58RKey: string);
  end;

implementation

uses
  DM, WZ_gUnit, Pick_Item_Single, BMListFrm, VarUtils, gBFUnit, StrUtils,
  QryWorkList,DateUtils;
{$R *.dfm}

{ TfrmNew }

procedure TfrmNew.btn1Click(Sender: TObject);
var
  LFrm: TfrmPick_Item_Single;
  LBMFrm: TfrmBMList;
  LListFrm: TfrmWork;
  LDate:TDateTime;
  LInPut: PDlgInput;
begin
  LFrm := TfrmPick_Item_Single.Create(Self);
  LInPut.AdoConn := dm1.con1;
  try
    case (Sender as TSpeedButton).Tag of
      0://作业单
      begin
        if FType06 = 0 then
        begin
          LInPut.KeyField := 'WORK_ORDER_NUMBER';
          LInPut.Fields := 'WORK_ORDER_NUMBER/作业单号/130,MANU_PART_NUMBER/本厂编号/70,MANU_PART_DESC/客户型号/80,ABBR_NAME/工厂名字/80,' +
                    'STEP/步骤/30,DEPT_CODE/当前工序/50,DEPT_NAME/工序名称/80,QTY_BACKLOG/在线数量/50,REFERENCE/在线备注/60,FGZ/返工状态/80';

            LInPut.Sqlstr := 'SELECT D06.RKey,D06.WORK_ORDER_NUMBER, D25.MANU_PART_NUMBER,D25.MANU_PART_DESC, (CASE D56.WTYPE WHEN 0 THEN '''' ELSE ''返工'' END) AS FGZ,' +
                      ' D15.ABBR_NAME, D56.STEP, D56.QTY_BACKLOG ,D56.REFERENCE , D34.DEPT_CODE, D34.DEPT_NAME FROM Data0006 D06' +
                      ' INNER JOIN Data0025 D25 ON D06.BOM_PTR=D25.RKey' +
                      ' INNER JOIN Data0056 D56 ON D06.RKey=D56.WO_PTR' +
                      ' INNER JOIN Data0034 D34 ON D56.DEPT_PTR=D34.RKey' +
                      ' INNER JOIN Data0015 D15 ON D56.LOC_PTR=D15.RKey' +
                      ' WHERE D06.PROD_STATUS in (3,5,6,103) and D06.wtype <> 2 and D06.wtype <> 4 and D25.IsSpell<1';
          LFrm.InitForm_New(LInPut);
          if LFrm.ShowModal = MrOK then
          begin
            edtZYDH.Text := LFrm.Get_Rslt;
            edtZYDH.Tag := LFrm.adsPick1.fieldbyname('RKey').AsInteger;
          end;

        end
        else
        begin
          LListFrm:= TfrmWork.Create(nil);
          try
            LDate:= getsystem_date(dm1.qrytmp,1);
            LListFrm.dtp1.Date:= IncDay(LDate,-30);
            LListFrm.dtp2.Date:= LDate;

            dm1.ads1.Close;
            dm1.ads1.Parameters[0].Value:= LListFrm.dtp1.Date;
            dm1.ads1.Parameters[1].Value:= LListFrm.dtp2.Date;
            dm1.ads1.Open;
            dm1.ads1.IndexFieldNames:= LListFrm.preColumn.FieldName;
            
            if LListFrm.ShowModal = mrOk then
            begin
              edtZYDH.Text := dm1.ads1WORK_ORDER_NUMBER.AsString;
              edtZYDH.Tag := dm1.ads1RKey.AsInteger;
            end;
          finally
            edt1.Text:='';
            LListFrm.Free;
          end;
        end;
        edtZYDH.SetFocus;
      end;
      1://缺陷代码
      begin
        if Trim(edtZYDH.Text) = '' then
        begin
          ShowMessage('请先选择作业单');
          edtZYDH.SetFocus;
          Exit;
        end;
        LInPut.KeyField := 'REJ_CODE';
        LInPut.Fields := 'REJ_CODE/缺陷代码/80,REJECT_DESCRIPTION/缺陷名称/100,rej_type/报废类别/120';
        LInPut.Sqlstr := 'SELECT RKEY, REJ_CODE, REJECT_DESCRIPTION,'+
                      'case rej_type when 0 then ''工厂报废'' '+
                      'when 1 then ''供应商报废'' '+
                      'when 2 then ''客户报废'' '+
                      'when 3 then ''市场报废'' '+
                      'when 4 then ''其它'' '+
                      'end as rej_type FROM Data0039';
        LFrm.InitForm_New(LInPut);
        if LFrm.ShowModal = MrOK then
        begin
          edtQXDM.Text := LFrm.Get_Rslt;
          edtQXDM.Tag := LFrm.adsPick1.fieldbyname('RKey').AsInteger;
        end;
        edtQXDM.SetFocus;
      end;
      2://责任部门
      begin
        if Trim(edtZYDH.Text) = '' then
        begin
          ShowMessage('请先选择作业单');
          edtZYDH.SetFocus;
          Exit;
        end;
        LBMFrm := TfrmBMList.Create(Self);
        LBMFrm.FRkey06 := IntToStr(edtZYDH.Tag);
        LBMFrm.FRkey25 := FRkey25;
        LBMFrm.rg1Click(LBMFrm.rg1);
        try
          if LBMFrm.ShowModal = mrOK then
          begin
            if not LBMFrm.adsBMList.IsEmpty then
            begin
              edtFSGX.Text := LBMFrm.adsBMList.fieldbyname('DEPT_CODE').AsString;
              edtFSGX.Tag := LBMFrm.adsBMList.fieldbyname('Rkey34').AsInteger;
              lblZRBM.Caption := LBMFrm.adsBMList.fieldbyname('DEPT_NAME').AsString;
              if FType06 = 1 then FFSStep:= LBMFrm.adsBMList.fieldbyname('Rkey34').AsInteger;
            end;
          end;
        finally
          LBMFrm.Free;
        end;
        edtFSGX.SetFocus;
      end;
    end;
    Perform(WM_NEXTDLGCTL,0,0);
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNew.btn5Click(Sender: TObject);
begin
  if (lblPCSPERPNL.Caption <> '') and (edtPCS.Text <> '') then
    edtPNL.Text := IntToStr(StrToInt(edtPCS.Text) div StrToInt(lblPCSPERPNL.Caption));
end;

procedure TfrmNew.btn6Click(Sender: TObject);
begin
  if (lblPCSPERPNL.Caption <> '') and (edtPNL.Text <> '') then
    edtPCS.Text := IntToStr(StrToInt(edtPNL.Text) * StrToInt(lblPCSPERPNL.Caption));
end;

function TfrmNew.CheckBFNumber: Boolean;
begin
  Result := False;
  try
    if StrToInt(edtPCS.Text) <= 0 then
    begin
      ShowMessage('PCS数必须大于0');
      Exit;
    end;
    if FType06 = 0 then
    begin
      if StrToInt(edtPCS.Text) > StrToInt(lblZXPCS.Caption) then
      begin
        ShowMessage('PCS数量大于在线数量');
        Exit;
      end;
      if StrToInt(edtPNL.Text) > StrToInt(lblZXPNL.Caption)  then
      begin
        ShowMessage('PNL数大于在线数量');
        Exit;
      end;
    end;
    Result := True;   
  except
  end;
end;

function TfrmNew.CheckQXDM: Boolean;
var
  tmpS: string;
begin
  tmpS := 'SELECT RKEY, REJECT_DESCRIPTION,'+
                      'case rej_type when 0 then ''工厂报废'' '+
                      'when 1 then ''供应商报废'' '+
                      'when 2 then ''客户报废'' '+
                      'when 3 then ''市场报废'' '+
                      'when 4 then ''其它'' '+
                      'end as rej_type FROM Data0039 WHERE  REJ_CODE = ' + QuotedStr(edtQXDM.Text);
  Result := True;
  dm1.qrytmp.Close;
  dm1.qrytmp.SQL.Clear;
  dm1.qrytmp.SQL.Add(tmpS);
  dm1.qrytmp.Open;
  if dm1.qrytmp.IsEmpty then
  begin
    Result := False;
  end else
  begin
    edtQXDM.Tag := dm1.qrytmp.fieldbyname('RKey').AsInteger;
    lblQXMC.Caption := dm1.qrytmp.fieldbyname('REJECT_DESCRIPTION').AsString;
    lblBFLX.Caption := dm1.qrytmp.fieldbyname('rej_type').AsString;
  end;
end;

function TfrmNew.CheckWONumber(Abbr: Boolean): Boolean;
var
  I: Integer;
  LUser15Ptr: string;
begin
  Result := True;
  dm1.qrytmp.Close;
  if FType06 = 0 then
  begin
    dm1.qrytmp.SQL.Clear;
    dm1.qrytmp.SQL.Add(' SELECT D06.RKey AS RKey06,D15.RKey,D25.rkey as rkey25 FROM Data0006 D06 INNER JOIN Data0056 D56 ON D06.RKey=D56.WO_PTR ');
    dm1.qrytmp.SQL.Add(' INNER JOIN Data0025 D25 ON D06.BOM_PTR = D25.RKey ');
    dm1.qrytmp.SQL.Add(' LEFT JOIN Data0015 D15 ON D56.LOC_PTR = D15.RKey ');
    dm1.qrytmp.SQL.Add(' WHERE D06.WORK_ORDER_NUMBER = ' + QuotedStr(edtZYDH.Text)  + ' AND D06.PROD_STATUS in (3,5,6,103) AND D25.IsSpell<1');
    if FBFType = 0 then
      dm1.qrytmp.SQL.Add(' and D06.wtype <> 2 and D06.wtype <> 4');
  end
  else
  begin
    dm1.qrytmp.SQL.Text:= ' SELECT D06.RKey AS RKey06,D15.RKey,D25.rkey as rkey25  '+#13+
                          '   FROM Data0006 D06 INNER JOIN  Data0025 D25 ON D06.BOM_PTR = D25.RKey  '+#13+
                          '   LEFT JOIN Data0015 D15 ON D06.WHOUSE_PTR = D15.RKey '+#13+
                          '   WHERE D06.WORK_ORDER_NUMBER = ' + QuotedStr(edtZYDH.Text)  +
                          '  AND D25.IsSpell<1  '+#13+
                          '   and D06.wtype <> 2 and D06.wtype <> 4 '+#13+
                          '   AND D06.PROD_STATUS in (3,5,6,9,103)';
  end;
  dm1.qrytmp.Open;
  if dm1.qrytmp.IsEmpty then
  begin
    Result := False;
  end else
  begin
    edtZYDH.Tag := dm1.qrytmp.fieldbyname('RKey06').AsInteger;
//    ShowMessage(dm1.qrytmp.fieldbyname('RKey25').asstring);
    FRkey25:= dm1.qrytmp.fieldbyname('RKey25').asstring;




    if Abbr and cbxBFGC.Enabled then
    begin
      for I := 0 to cbxBFGC.items.Count - 1 do
      begin
        if Integer(cbxBFGC.Items.Objects[I])=dm1.qrytmp.FieldByName('RKey').AsInteger then
        begin
          cbxBFGC.ItemIndex := I;
          Break;
        end;
      end;
    end;
  end;
  if FType06 = 0 then
  begin
  //取得当前工序
    if Result and Abbr then
    begin
      dm1.qrytmp.Close;
      dm1.qrytmp.SQL.Clear;
      dm1.qrytmp.SQL.Add(' SELECT d25.rkey as rkey25,D56.STEP,D56.WTYPE, D06.QUAN_REJ,D25.MANU_PART_NUMBER,D25.MANU_PART_DESC,D06.PARTS_PER_PANEL, D34.DEPT_CODE, D34.RKey, D56.QTY_BACKLOG,D56.PANELS FROM Data0056 D56 ');
      dm1.qrytmp.SQL.Add(' INNER JOIN Data0034 D34 ON D56.DEPT_PTR = D34.RKey ');
      dm1.qrytmp.SQL.Add(' INNER JOIN Data0006 D06 ON D06.RKey = D56.WO_PTR');
      dm1.qrytmp.SQL.Add(' INNER JOIN Data0025 D25 ON D25.RKey = D06.BOM_PTR');
      dm1.qrytmp.SQL.Add(' WHERE D56.WO_PTR = ' + IntToStr(edtZYDH.Tag));
      dm1.qrytmp.Open;
      if dm1.qrytmp.FieldByName('WTYPE').AsInteger > 0 then
        edtSQGX.Text := Format('%.3d',[dm1.qrytmp.FieldByName('WTYPE').AsInteger]) + '.' + dm1.qrytmp.FieldByName('dept_code').AsString
      else
        edtSQGX.Text := Format('%.3d',[dm1.qrytmp.FieldByName('STEP').AsInteger]) + '.' + dm1.qrytmp.FieldByName('dept_code').AsString;

      FRkey25 := dm1.qrytmp.fieldbyname('rkey25').AsString;
      edtSQGX.Tag :=  dm1.qrytmp.FieldByName('RKey').AsInteger;
      lblBCBH.Caption := dm1.qrytmp.FieldByName('MANU_PART_NUMBER').AsString;
      lblKHXH.Caption := dm1.qrytmp.FieldByName('MANU_PART_DESC').AsString;
      lblZXPCS.Caption := dm1.qrytmp.FieldByName('QTY_BACKLOG').AsString;
      lblZXPNL.Caption := dm1.qrytmp.FieldByName('PANELS').AsString;
      lblPCSPERPNL.Caption := dm1.qrytmp.FieldByName('PARTS_PER_PANEL').AsString;
      lblYBFS.Caption := dm1.qrytmp.FieldByName('QUAN_REJ').AsString;
    
      if Trim(edtFSGX.Text) = '' then
      begin
        //edtFSGX.Text := dm1.qrytmp.fieldbyname('dept_code').AsString;
        //edtFSGX.Tag := dm1.qrytmp.fieldbyname('rkey').AsInteger;
        //edtFSGXExit(edtFSGX);
      end;
    end;


    //如果绑定了工厂则不可以选择不是工厂的工单
    LUser15Ptr := GetUser15Ptr(gUser.User_Longin_Ptr);
    if Result and (LUser15Ptr <> '') and (not Abbr) then
    begin
      dm1.qrytmp.Close;
      dm1.qrytmp.SQL.Clear;
      dm1.qrytmp.SQL.Add('select 1 from data0056 d56 where d56.WO_PTR = ' + IntToStr(edtZYDH.Tag));
      dm1.qrytmp.SQL.Add(' and d56.LOC_PTR = ' + LUser15Ptr);
      dm1.qrytmp.Open;
      Result := not dm1.qrytmp.IsEmpty;
      if not Result then
      begin
        ShowMessage('不能选择其他工厂工单进行报废');
      end;
    end;
  end;
end;

function TfrmNew.CheckZRGX: Boolean;
var
  LNowStep: Integer;
begin
  Result := True;
  LNowStep:=0;
  dm1.qrytmp.Close;
  dm1.qrytmp.SQL.Clear;
  dm1.qrytmp.SQL.Add(' SELECT RKey, DEPT_NAME FROM Data0034 WHERE ttype <> 5 and DEPT_CODE = ' + QuotedStr(edtFSGX.Text));
  dm1.qrytmp.Open;
  if dm1.qrytmp.IsEmpty then
  begin
    Result := False;
  end else
  begin
    edtFSGX.Tag := dm1.qrytmp.fieldbyname('RKey').AsInteger;
    lblZRBM.Caption := dm1.qrytmp.fieldbyname('DEPT_NAME').AsString;
    //当前工序
    if FType06 = 0 then
    begin
      dm1.qrytmp.Close;
      dm1.qrytmp.SQL.Clear;
      dm1.qrytmp.SQL.Add(' select step FROM Data0056 WHERE WO_PTR = ' + IntToStr(edtZYDH.Tag));
      dm1.qrytmp.Open;
      if dm1.qrytmp.IsEmpty then
      begin
        Result := False;
        Exit;
      end else
      begin
        LNowStep := dm1.qrytmp.fieldbyname('step').AsInteger;
      end;
    end;
    //是否相关的前工序
    dm1.qrytmp.Close;
    dm1.qrytmp.SQL.Clear;
    dm1.qrytmp.SQL.Add(' SELECT distinct step_no FROM Data0048 WHERE wo_ptr = ' + IntToStr(edtZYDH.Tag));
    dm1.qrytmp.SQL.Add(' AND fm_dept_ptr = ' + IntToStr(edtFSGX.Tag));
    dm1.qrytmp.SQL.Add(' ORDER BY step_no DESC');
    dm1.qrytmp.Open;
    if not dm1.qrytmp.IsEmpty then
    begin
      if dm1.qrytmp.FieldByName('step_no').AsInteger <= LNowStep then
        FFSStep := dm1.qrytmp.FieldByName('step_no').AsInteger
      else
        FFSStep := LNowStep;
    end else
    begin
      FFSStep := LNowStep;
    end;
  end;
end;

procedure TfrmNew.edtFSGXExit(Sender: TObject);
begin
  if not CheckZRGX then
  begin
    lblNote.Caption := '责任工序错误';
    lblNote.Visible := True;
  end else
    lblNote.Visible := False;
end;

procedure TfrmNew.edtPCSExit(Sender: TObject);
begin
  if Length(Trim(TEdit(Sender).Text)) = 0 then (Sender as TEdit).Text := '0';
end;

procedure TfrmNew.edtPCSKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13,#9]) then
  begin
    Key := #0;
  end;
end;

procedure TfrmNew.edtQXDMExit(Sender: TObject);
begin
  if not CheckQXDM then
  begin
    lblNote.Caption := '缺陷代码无效';
    lblNote.Visible := True;
  end else
    lblNote.Visible := False;
end;

procedure TfrmNew.edtZYDHExit(Sender: TObject);
begin
  if not CheckWONumber(True) then
  begin
    lblNote.Caption := '作业单无效';
    lblNote.Visible := True;
  end else
  begin
    lblNote.Visible := False;
    if FType06 = 0 then
    begin
      dm1.cdsIN.Close;         //打开内层预报废
      dm1.cdsIN.Params.ParamByName('OUT06').Value:= edtZYDH.Tag;
      dm1.cdsIN.Open;
    end;
  end;
end;

procedure TfrmNew.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmNew.InitFrm;
begin
  //报废单号和时间
  dm1.qrytmp.close;
  dm1.qrytmp.SQL.Clear;
  dm1.qrytmp.SQL.Add('SELECT seed_value, getdate() AS BFDateTime from data0004 WHERE data0004.rkey=18');
  dm1.qrytmp.Open;
  edtBFDH.Text := dm1.qrytmp.fieldbyname('seed_value').AsString;
  edtTime.Text := gDateTimeToStr(dm1.qrytmp.fieldbyname('BFDateTime').AsDateTime);
  //
  edtSQGX.Text := '';
  edtSQGX.Tag := 0;
  edtZYDH.Tag := 0;
  edtQXDM.Text := '';
  edtQXDM.Tag := 0;
  edtFSGX.Text := '';
  edtFSGX.Tag := 0;
  edtPCS.Text := '0';
  edtPNL.Text := '0';
  lblBCBH.Caption := '';
  lblKHXH.Caption := '';
  lblZXPCS.Caption := '';
  lblZXPNL.Caption := '';
  lblPCSPERPNL.Caption := '';
  lblYBFS.Caption := '';
  edtBZ.Text := '';
  edt1.Text := '';
  edt2.Text := '';
  edt3.Text := '';
  FRkey25 := '';
//  edtZYDH.SetFocus;
end;

procedure TfrmNew.ShowBFInfo(A58RKey: string);
var
  I: Integer;
  LS: TStringList;
begin

  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TWinControl then
      (Components[I] as TWinControl).Enabled := False;
  end;

  LS := TStringList.Create;
  try
    LS.Add(' SELECT');
    LS.Add(' D25.MANU_PART_NUMBER, D25.MANU_PART_DESC,D58.MRB_NO,D06.WORK_ORDER_NUMBER,');
    LS.Add(' D58.QTY_ORG_REJ, D58.PANELS, D58.QTY_REJECT,D39.REJECT_DESCRIPTION, ');
    LS.Add(' D39.REJ_CODE,');
    LS.Add(' CASE D39.REJ_TYPE WHEN 0 THEN ''工厂报废'' WHEN 1 THEN ''供应商报废'' WHEN 2 THEN ''客户报废'' ');
    LS.Add(' WHEN 3 THEN ''市场报废'' WHEN 4 THEN ''其他'' END AS REJ_TYPE, ');
    LS.Add(' D34SQ.DEPT_CODE, D34SQ.DEPT_NAME,D34FS.DEPT_CODE, D34FS.DEPT_NAME AS FSDEPT_NAME,');
    LS.Add(' D58.TDATETIME,D05SQ.EMPLOYEE_NAME,D58.AUDIT_DATETIME, D05PZ.EMPLOYEE_NAME,');
    LS.Add(' D15.ABBR_NAME, D58.REFERENCE, D58.RKey AS RKey58, D06.Rkey AS RKey06,');
    LS.Add(' D58.STEPNOW,d58.GlobalId,d58.PANEL_ID,d58.coordinate ');
    LS.Add(' FROM Data0058 D58 INNER JOIN Data0006 D06 ON D58.WO_PTR = D06.RKey');
    LS.Add(' INNER JOIN Data0025 D25 ON D06.BOM_PTR = D25.RKey');
    LS.Add(' INNER JOIN Data0034 D34SQ ON D58.DEPT_PTR = D34SQ.RKey');
    LS.Add(' INNER JOIN Data0034 D34FS ON D58.RESP_DEPT_PTR = D34FS.RKey');
    LS.Add(' INNER JOIN Data0039 D39 ON D58.REJECT_PTR = D39.RKey');
    LS.Add(' INNER JOIN Data0005 D05SQ ON D58.EMPL_PTR = D05SQ.RKey');
    LS.Add(' INNER JOIN Data0005 D05PZ ON D58.AUDIT_EMPL_PTR = D05PZ.RKey');
    LS.Add(' INNER JOIN Data0015 D15 ON D58.warehouse_ptr = D15.RKey');
    LS.Add(' WHERE D58.RKey = ' + A58RKey);
    dm1.qrytmp.Close;
    dm1.qrytmp.SQL.Clear;
    dm1.qrytmp.SQL.Assign(LS);
    dm1.qrytmp.Open;

      if not dm1.qrytmp.IsEmpty then
      begin
        edtZYDH.Text := dm1.qrytmp.FieldByName('WORK_ORDER_NUMBER').AsString;
        edtQXDM.Text := dm1.qrytmp.FieldByName('REJ_CODE').AsString;
        edtFSGX.Text := dm1.qrytmp.FieldByName('DEPT_CODE_1').AsString;
        edtPCS.Text := dm1.qrytmp.FieldByName('QTY_REJECT').AsString;
        edtPNL.Text := dm1.qrytmp.FieldByName('PANELS').AsString;
        edtBZ.Text := dm1.qrytmp.FieldByName('REFERENCE').AsString;
        lblQXMC.Caption := dm1.qrytmp.FieldByName('REJECT_DESCRIPTION').AsString;
        lblBFLX.Caption := dm1.qrytmp.FieldByName('REJ_TYPE').AsString;
        lblZRBM.Caption := dm1.qrytmp.fieldbyname('FSDEPT_NAME').AsString;
        edtBFDH.Text := dm1.qrytmp.FieldByName('MRB_NO').AsString;
        edtTime.Text := gDateTimeToStr(dm1.qrytmp.FieldByName('AUDIT_DATETIME').AsDateTime);
        edtSQGX.Text := dm1.qrytmp.FieldByName('DEPT_CODE').AsString;
        lblBCBH.Caption := dm1.qrytmp.FieldByName('MANU_PART_NUMBER').AsString;
        lblKHXH.Caption := dm1.qrytmp.FieldByName('MANU_PART_DESC').AsString;
        cbxBFGC.Items.Add(dm1.qrytmp.FieldByName('ABBR_NAME').AsString);
        cbxBFGC.ItemIndex := cbxBFGC.Items.Count - 1;
        edt3.Text := dm1.qrytmp.fieldbyname('GlobalId').AsString;
        edt2.Text := dm1.qrytmp.fieldbyname('coordinate').AsString;
      end;
  finally
    LS.Free;
  end;


  btn3.Visible := False;
  lbl10.Visible := False;
  lbl13.Visible := False;
  lbl14.Visible := False;
  lbl11.Visible := False;
  lblZXPCS.Visible := False;
  lblZXPNL.Visible := False;
  lblPCSPERPNL.Visible := False;
  lblYBFS.Visible := False;
end;



procedure TfrmNew.btn3Click(Sender: TObject);
var
  LSucc: Boolean;
begin
  if InPD then
  begin
    ShowMessage('盘点中禁止操作');
    Exit;
  end;

  if cbx1.Checked then
  begin
    if Pos(edt1.Text,lblBCBH.Caption) <= 0 then
    begin
      lbl6.Caption := '请核对本厂编号与作业单号是否匹配';
      Exit;
    end;
  end;

  if LeftStr(edtSQGX.Text,3) = '001' then
  begin
    ShowMessage('第一步工序禁止报废,请过数后报废');
    Exit;
  end;

  if (not CheckWONumber(False)) or
     (not CheckQXDM) or
     (not CheckZRGX) or
     (not CheckBFNumber)
  then
  begin
    lbl6.Caption := '报废参数不正确';
    Exit;
  end;

  if not CheckData then Exit;

//  if (StrToInt(lblZXPCS.Caption) - StrToInt(edtPCS.Text)) < (StrToInt(lblZXPNL.Caption) - StrToInt(edtPNL.Text)) then
//  begin
//    lbl6.Caption := '报废后，在线PCS不能小于在线PNL数';
//    Exit;
//  end;
//  if StrToInt(lblZXPNL.Caption) > 0 then
//  begin
//    if ((StrToInt(lblZXPNL.Caption) - StrToInt(edtPNL.Text)) * StrToInt(lblPCSPERPNL.Caption)) <
//        (StrToInt(lblZXPCS.Caption) - StrToInt(edtPCS.Text)) then
//    begin
//      lbl6.Caption := '报废后，在线PNL数量与PCS数量逻辑不正确';
//      Exit;
//    end;
//  end;

  if FBFType = 0 then
    LSucc := NewBF(IntToStr(edtZYDH.Tag),IntToStr(edtFSGX.Tag),IntToStr(FFSStep),edtPCS.Text,edtPNL.Text,
                    IntToStr(edtQXDM.Tag),IntToStr(Integer(cbxBFGC.Items.Objects[cbxBFGC.ItemIndex])),edtBZ.Text,FType06,
                    0,edt3.Text,edt2.Text,dm1.cdsIN)
  else
    LSucc := NewMRBCheckBF(IntToStr(edtZYDH.Tag),IntToStr(edtFSGX.Tag),IntToStr(FFSStep),edtPCS.Text,edtPNL.Text,
                    IntToStr(edtQXDM.Tag),IntToStr(Integer(cbxBFGC.Items.Objects[cbxBFGC.ItemIndex])),edtBZ.Text);
  if LSucc then
  begin
    InitFrm;

    lbl6.Caption := '报废成功';
    Perform(WM_NEXTDLGCTL,0,0);
    if FBFType = 1 then ModalResult := mrOk;
    edtZYDH.SetFocus;
  end else
  begin
    lbl6.Caption := '报废提交失败';
  end;
end;

procedure TfrmNew.MRBBFCheckInit(A06Rkey: string);
var
  LQry: TADOQuery;
  lsql: string;
begin
  FBFType := 1;
  edtZYDH.Enabled := False;
  btn1.Enabled := False;
  edtPCS.Enabled := False;
  edtPNL.Enabled := False;
  btn5.Enabled := False;
  btn6.Enabled := False;
  InitFrm;
  lsql := ' select D06.Work_order_number, d56.QTY_BACKLOG, d56.panels from ' +
          ' data0006 d06 inner join data0056 d56 on d06.rkey = d56.wo_ptr ' +
          ' where d06.rkey = ' + A06Rkey;
  LQry := TADOQuery.Create(Self);
  try
    if SqlOpen(LQry,lsql) then
    begin
      if LQry.IsEmpty then Exit;
      edtZYDH.Text := LQry.fieldbyname('Work_order_number').AsString;
      edtZYDHExit(edtZYDH);
      edtPCS.Text := LQry.fieldbyname('QTY_BACKLOG').AsString;
      edtPNL.Text := LQry.fieldbyname('panels').AsString;
    end;
  finally
    LQry.Free;
  end;

end;

procedure TfrmNew.cbx1Click(Sender: TObject);
begin
  edt1.Visible := cbx1.Checked;
end;

procedure TfrmNew.cbx2Click(Sender: TObject);
begin
  edt3.Visible := cbx2.Checked;
end;

function TfrmNew.getsystem_date(Query: TAdoQuery;
  datetype: byte): tdatetime;
begin
  Query.Close;
  query.SQL.Text := 'select getdate() as long_datetime,' + #13 +
    'convert(datetime,(convert(varchar,getdate(),101)),101) as sort_datetime';
  Query.Open;
  if datetype = 0 then
    result := query.FieldValues['long_datetime']
  else
    result := query.FieldValues['sort_datetime'];
end;

function TfrmNew.CheckData: Boolean;
var
  sum:Integer;
begin
  Result:= false;
  sum:=0;
  with dm1.cdsIN do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('QTY_REJECT').AsInteger - FieldByName('used_qty').AsInteger < FieldByName('qty').AsInteger then
      begin
        ShowMessage('输入数量大于可消数量，请检查');
        exit;
      end
      else
      begin
        sum := sum +  FieldByName('qty').AsInteger;
      end;
      Next;
    end;
    if (StrToInt(edtPCS.Text)>0) and (sum > StrToInt(edtPCS.Text)) then
    begin
      ShowMessage('输入的报废PCS数小于内层之和，请检查！');
      Exit;
    end;
    Result:= True;
  end;
end;

end.
