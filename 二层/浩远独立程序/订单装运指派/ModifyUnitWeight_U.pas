unit ModifyUnitWeight_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmModifyUnitWeight = class(TForm)
    edtManuPartNumber: TEdit;
    SpeedButton1: TSpeedButton;
    LbManuPartDesc: TLabel;
    Button1: TButton;
    Button2: TButton;
    lblOrigUnitWeight: TLabel;
    lblManuPartNumber: TLabel;
    edtManuPartDesc: TEdit;
    edtOrigUnitWeight: TEdit;
    lblNewUnitWeight: TLabel;
    edtNewUnitWeight: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtManuPartNumberExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNewUnitWeightKeyPress(Sender: TObject; var Key: Char);
    procedure edtManuPartNumberKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    orig_unit_weight:Double;
    SearchWay:string;
    rkey25:Integer;
  public
    { Public declarations }
    //user_ptr:string;
  end;

var
  FrmModifyUnitWeight: TFrmModifyUnitWeight;

implementation

uses common,damo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrmModifyUnitWeight.SpeedButton1Click(Sender: TObject);
var InputVar: PDlgInput;
begin
  SearchWay:='C';
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/80,MANU_PART_DESC/客户型号/110,CUST_CODE/客户代码/60,'+
                       'ONHOLD_SALES_FLAG/状态/40,ttype/产品属性/60,PRODUCT_NAME/产品类型/90,'+
                       'ANALYSIS_CODE_2/客户物料号/120,REPORT_UNIT_VALUE1/产品单重/80';
    InputVar.Sqlstr :='SELECT  dbo.Data0025.RKEY, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE, '+#13+
                      '        CASE dbo.Data0025.ONHOLD_SALES_FLAG WHEN 0 THEN ''有效'' WHEN 1 THEN ''过期'' END AS ONHOLD_SALES_FLAG, '+#13+
                      '        CASE dbo.Data0025.ttype WHEN 0 THEN ''量产板'' WHEN 1 THEN ''样板'' END AS TTYPE, dbo.Data0008.PRODUCT_NAME, '+#13+
                      '        dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.REPORT_UNIT_VALUE1 '+#13+
                      'FROM    dbo.Data0025 INNER JOIN '+#13+
                      '        dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN '+#13+
                      '        dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                      'WHERE   dbo.Data0025.PARENT_PTR IS NULL'+#13+
                      'ORDER BY dbo.Data0025.MANU_PART_NUMBER';
    inputvar.KeyField:='MANU_PART_NUMBER';
    inputvar.InPut_value:=edtManuPartNumber.Text;
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtManuPartNumber.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
      button1.Enabled:=true;
      edtNewUnitWeight.SetFocus;
      rkey25:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
      orig_unit_weight := frmPick_Item_Single.adsPick.FieldValues['REPORT_UNIT_VALUE1'];
      edtManuPartDesc.Text:=Trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']);
      edtOrigUnitWeight.Text:=floattostr(orig_unit_weight);
    end
    else edtManuPartNumber.SetFocus;
  finally
    frmPick_Item_Single.Free;
    SearchWay :='';
  end;
end;

procedure TFrmModifyUnitWeight.FormCreate(Sender: TObject);
begin
  rkey25:=0;
  orig_unit_weight := -9999;
end;

procedure TFrmModifyUnitWeight.edtManuPartNumberExit(Sender: TObject);
var InputVar: PDlgInput;
begin
  if SearchWay='C' then Exit;
  if (trim(edtManuPartNumber.Text)='') then
  begin
    edtManuPartDesc.Text:='';
    edtOrigUnitWeight.Text:='';
    edtNewUnitWeight.Text:='';
    rkey25:=0;
    Exit;
  end;  
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'MANU_PART_NUMBER/本厂编号/80,MANU_PART_DESC/客户型号/110,CUST_CODE/客户代码/60,'+
                       'ONHOLD_SALES_FLAG/状态/40,ttype/产品属性/60,PRODUCT_NAME/产品类型/90,'+
                       'ANALYSIS_CODE_2/客户物料号/120,REPORT_UNIT_VALUE1/产品单重/80';
    InputVar.Sqlstr :='SELECT  dbo.Data0025.RKEY, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE, '+#13+
                      '        CASE dbo.Data0025.ONHOLD_SALES_FLAG WHEN 0 THEN ''有效'' WHEN 1 THEN ''过期'' END AS ONHOLD_SALES_FLAG, '+#13+
                      '        CASE dbo.Data0025.ttype WHEN 0 THEN ''量产板'' WHEN 1 THEN ''样板'' END AS TTYPE, dbo.Data0008.PRODUCT_NAME, '+#13+
                      '        dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0025.REPORT_UNIT_VALUE1 '+#13+
                      'FROM    dbo.Data0025 INNER JOIN '+#13+
                      '        dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN '+#13+
                      '        dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
                      'WHERE   dbo.Data0025.PARENT_PTR IS NULL'+#13+
                      'ORDER BY dbo.Data0025.MANU_PART_NUMBER';
    inputvar.KeyField:='MANU_PART_NUMBER';
    inputvar.InPut_value:=edtManuPartNumber.Text;
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    edtManuPartNumber.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_NUMBER']);
    button1.Enabled:=true;
    edtNewUnitWeight.SetFocus;
    rkey25:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    orig_unit_weight := frmPick_Item_Single.adsPick.FieldValues['REPORT_UNIT_VALUE1'];
    edtManuPartDesc.Text:=Trim(frmPick_Item_Single.adsPick.FieldValues['MANU_PART_DESC']);
    edtOrigUnitWeight.Text:=floattostr(orig_unit_weight);
  finally
    frmPick_Item_Single.Free;
  end;
end;

procedure TFrmModifyUnitWeight.Button1Click(Sender: TObject);
var NewUnitWeight:Double;
begin
  try
    if rkey25=0 then Exit;
    if Trim(edtNewUnitWeight.Text)='' then
      begin
        edtNewUnitWeight.SetFocus;
        exit;
      end
    else
       NewUnitWeight:=strtofloat(Trim(edtNewUnitWeight.Text));
    if NewUnitWeight<=0 then
    begin
      ShowMessage('请输入正确的重量！');
      edtNewUnitWeight.SetFocus;
      edtNewUnitWeight.SelectAll;
      Exit;
    end;
    if orig_unit_weight=-9999 then Exit;
  except
    ShowMessage('请输入正确的重量！');
    edtNewUnitWeight.SetFocus;
    edtNewUnitWeight.SelectAll;
    Exit;
  end;
  try
    if NewUnitWeight<>orig_unit_weight then
    begin
      dm.ADOConnection1.BeginTrans;
      dm.aqtmp.sql.Text:='update data0025 set report_unit_value1='+edtNewUnitWeight.Text+' where rkey='+inttostr(rkey25);
      //ShowMessage(dm.aqtmp.SQL.Text);
      dm.aqtmp.ExecSQL;
      dm.aqtmp.SQL.Text:='INSERT INTO Data0318 '+#13+
                         '       (CUSTOMER_PART_PTR, TRANS_TYPE, TRANS_DESCRIPTION, FROM_STRING, TO_STRING, USER_PTR, TRANS_DATE, PROGRAM_SOURCE) '+#13+
                         'VALUES ('+inttostr(rkey25)+', 25, ''变更产品单重'','''+edtOrigUnitWeight.Text+''', '''+floattostr(NewUnitWeight)+''', '+rkey73+', GETDATE(), 22)';
      //ShowMessage(dm.aqtmp.SQL.Text);
      dm.aqtmp.ExecSQL;
      dm.ADOConnection1.CommitTrans;
    end;
    ShowMessage('保存成功！');
    ModalResult:=mrOk;
  except
    dm.ADOConnection1.RollbackTrans;
    ShowMessage('保存过程中出现错误！');
    ModalResult:=mrAbort;
  end;
end;

procedure TFrmModifyUnitWeight.FormShow(Sender: TObject);
begin
  if edtManuPartNumber.Text<>'' then
  begin
    edtManuPartNumber.OnExit(sender);
    edtNewUnitWeight.SetFocus;
  end;
end;

procedure TFrmModifyUnitWeight.edtNewUnitWeightKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then Button1.SetFocus;
end;

procedure TFrmModifyUnitWeight.edtManuPartNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then edtNewUnitWeight.SetFocus;
end;

end.



