unit FSHReqFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DM, DB, ADODB;

type
  TfrmFSHReq1 = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    btn1: TButton;
    lblBFDH: TLabel;
    lblBFSJ: TLabel;
    lblQXDM: TLabel;
    lblBFSL: TLabel;
    edtSQR: TEdit;
    edtSQTime: TEdit;
    edtSQSM: TEdit;
    lbl8: TLabel;
    edtJSGX: TEdit;
    sp1: TADOStoredProc;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Insert549: Boolean;

    procedure InitFrm;
  end;


implementation

uses
  WZ_gUnit;


{$R *.dfm}


procedure TfrmFSHReq1.btn1Click(Sender: TObject);
begin
  if Insert549 then
    ModalResult := mrOk
  else
    ShowMessage('提交申请失败');
end;

procedure TfrmFSHReq1.InitFrm;
begin
  lblBFDH.Caption := dm1.adsFrmMain.fieldbyname('MRB_NO').AsString;
  lblQXDM.Caption := dm1.adsFrmMain.fieldbyname('REJ_CODE').AsString;
  lblBFSJ.Caption := dm1.adsFrmMain.fieldbyname('AUDIT_DATETIME').AsString;
  lblBFSL.Caption := dm1.adsFrmMain.fieldbyname('QTY_REJECT').AsString;
  //
  dm1.qrytmp.Close;
  dm1.qrytmp.SQL.Clear;
  dm1.qrytmp.SQL.Add('SELECT EMPLOYEE_NAME, getdate() AS TimeNow FROM Data0005 WHERE');
  dm1.qrytmp.SQL.Add(' RKey = ' + gUser.User_Ptr);
  dm1.qrytmp.Open;
  edtSQR.Text := dm1.qrytmp.FieldByName('EMPLOYEE_NAME').AsString;
  edtSQTime.Text := dm1.qrytmp.FieldByName('TimeNow').AsString;
  //
  dm1.qrytmp.Close;
  dm1.qrytmp.SQL.Clear;
  dm1.qrytmp.SQL.Clear;
  dm1.qrytmp.SQL.Add(' select d34.dept_code, d58.DEPT_PTR from data0058 d58 ');
  dm1.qrytmp.SQL.Add(' inner join data0034 d34 on d58.DEPT_PTR = d34.rkey');
  dm1.qrytmp.SQL.Add(' WHERE D58.RKey=' + dm1.adsFrmMain.FieldByName('RKey58').AsString);
  DM1.qrytmp.Open;

  edtJSGX.Text := dm1.qrytmp.FieldByName('DEPT_CODE').AsString;
  edtJSGX.Tag := dm1.qrytmp.FieldByName('DEPT_PTR').AsInteger;

end;

function TfrmFSHReq1.Insert549: Boolean;
//var
//  LS: TStringList;
begin
  Result := True;

  //{$REGION '只能有一条549'}
  DM1.qrytmp.Close;
  dm1.qrytmp.SQL.Clear;
  dm1.qrytmp.SQL.Add('SELECT * FROM Data0549 WHERE D58_PTR=' + dm1.adsFrmMain.FieldByName('RKey58').AsString+ ' AND Status = 0');
  dm1.qrytmp.Open;
  if not dm1.qrytmp.IsEmpty then
  begin
    ShowMessage('已经存在反审核申请记录，禁止再次申请');
    Exit;
  end;

  sp1.Close;
  sp1.Parameters[1].Value := dm1.adsFrmMain.FieldByName('RKey58').AsString;
  sp1.Parameters[2].Value := gUser.User_Ptr;
  sp1.Parameters[3].Value := edtSQSM.Text;
  sp1.Parameters[4].Value := -1;
  sp1.ExecProc;

//  Exit;
//  //{$REGION '取得58记录'}
//  dm1.qrytmp.Close;
//  dm1.qrytmp.SQL.Clear;
//  dm1.qrytmp.SQL.Add('SELECT * FROM Data0058 WHERE RKey = ' + dm1.adsFrmMain.FieldByName('RKey58').AsString);
//  dm1.qrytmp.Open;
//
//  //{$REGION '由于要删除58所以保存58的记录'}
//  LS := TStringList.Create;
//  try
//    LS.Clear;
//    LS.Add('INSERT INTO Data0549 VALUES( ');
//    LS.Add(QuotedStr(dm1.qrytmp.FieldByName('MRB_NO').AsString)+',');
//    LS.Add(dm1.qrytmp.FieldByName('WO_PTR').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('TRAN_PTR').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('DEPT_PTR').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('REJECT_PTR').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('QTY_ORG_REJ').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('QTY_REJECT').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('PANELS').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('STEP').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('EMPL_PTR').AsString+',');
//    LS.Add(QuotedStr(gDateTimeToStr(dm1.qrytmp.FieldByName('TDATETIME').AsDateTime))+',');
//    LS.Add(dm1.qrytmp.FieldByName('AUDIT_EMPL_PTR').AsString+',');
//    LS.Add(QuotedStr(gDateTimeToStr(dm1.qrytmp.FieldByName('AUDIT_DATETIME').AsDateTime))+',');
//    LS.Add(dm1.qrytmp.FieldByName('RESP_DEPT_PTR').AsString+',');
//    LS.Add(QuotedStr(dm1.qrytmp.FieldByName('REFERENCE').AsString)+',');
//    LS.Add(dm1.qrytmp.FieldByName('TTYPE').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('StepNow').AsString+',');
//    LS.Add(dm1.qrytmp.FieldByName('warehouse_ptr').AsString+',');
//    LS.Add(dm1.qrytmp.fieldbyname('RKey').AsString + ',');
//    LS.Add('getdate(),');
//    LS.Add(gUser.User_Ptr + ',');
//    LS.Add(QuotedStr(edtSQSM.Text));
//    LS.Add(',NULL,NULL,NULL,'+ IntToStr(edtJSGX.Tag) +',NULL,NULL,NULL,0)');
//    dm1.qrytmp.Close;
//    dm1.qrytmp.SQL.Clear;
//    dm1.qrytmp.SQL.Assign(LS);
//    dm1.qrytmp.ExecSQL;
//    Result := True;
//  finally
//    LS.Free;
//  end;
end;

end.
