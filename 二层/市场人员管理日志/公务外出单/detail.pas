unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB, DBCtrlsEh;

type
  TForm_Detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    MaskEdit1: TMaskEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    DBMemo1: TDBMemo;
    Label13: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  Ftag:integer;
 
  procedure initd;
  end;

var
  Form_Detail: TForm_Detail;
implementation

uses common,demo, main, Pick_Item_Single,ConstVar;

{$R *.dfm}
procedure Tform_Detail.initd;
begin
  if Ftag=0 then
  begin
    self.Caption:='公务外出单-新增';
    dm.GetNo(MaskEdit1,'data0723',0);
    dm.ADO723_1.Close;
    dm.ADO723_1.Parameters[0].Value:=null;
    dm.ADO723_1.Open;
    dm.ADO723_1.Append;

    dm.adotemp.Close;
    dm.adotemp.SQL.Text:='select getdate()';
    dm.adotemp.Open;
    //dm.ADO723_1.FieldByName('apply_Date').AsDateTime:=dm.adotemp.Fields[0].AsDateTime;
    dm.ADO723_1.FieldByName('apply_Date').AsString:=FormatdateTime('yyyy-mm-dd',now);
    dm.ADO723_1.FieldByName('goout_Date').AsDateTime:=dm.ADOtemp.Fields[0].AsDateTime;
    dm.ADO723_1.FieldByName('return_Date').AsDateTime:=dm.adotemp.Fields[0].AsDateTime;
  end else begin
    self.Caption:='公务外出单-编辑';
    MaskEdit1.ReadOnly:=true;
    DM.ADO723_1.Close;
    DM.ADO723_1.Parameters[0].Value:=dm.ADO723LogNo.Value;
    DM.ADO723_1.Open;
    MaskEdit1.Text:=DM.ADO723_1.Fieldbyname('LogNo').AsString;
  end;
end;
procedure TForm_Detail.BitBtn9Click(Sender: TObject);
begin
close;
end;

procedure TForm_Detail.BtnSaveClick(Sender: TObject);
begin
  if MaskEdit1.Text='' then
  begin
    showmessage('申请编号不能为空!');
    exit;
  end;
  dm.ADO723_1.Edit;
  dm.ADO723_1.FieldByName('salesID').AsString:=rkey73;
  dm.ADO723_1.FieldByName('status').AsInteger:=0;
  dm.ADO723_1.FieldByName('customer_name').AsString:=dbedit1.Text;
  dm.ADO723_1.FieldByName('billing_address_1').AsString:=dbedit2.Text;
  dm.ADOConnection1.BeginTrans;
  try
   if not dm.GetNo(MaskEdit1,'data0723',1) then abort;
    dm.ADO723_1.FieldByName('LogNo').AsString:=MaskEdit1.Text;
    dm.ADO723_1.Post;
    dm.ADO723_1.UpdateBatch(arAll);
    dm.ADOConnection1.CommitTrans;
    Fno723:=dm.ADO723_1.FieldByName('LogNo').AsString;
    modalresult:=mrok;
  except
    dm.ADOConnection1.RollbackTrans;
    showmessage('保存数据失败!');
  end;
end;

procedure TForm_Detail.SpeedButton1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'cust_code/客户代码/100,customer_name/客户全称/200,abbr_name/客户简称/150';
    InputVar.Sqlstr := 'select cust_code,customer_name,abbr_name,billing_address_1 from data0010 order by 1';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DM.ADO723_1.Edit;
      DBEdit1.Field.AsString:=frmPick_Item_Single.adsPick.FieldValues['customer_name'];
      if frmPick_Item_Single.adsPick.FieldValues['billing_address_1']<>null then
      DBEdit2.Field.AsString:=frmPick_Item_Single.adsPick.FieldValues['billing_address_1']
      else
      DBEdit2.Field.AsString:='';
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;


end.
