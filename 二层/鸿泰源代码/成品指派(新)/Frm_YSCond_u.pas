unit Frm_YSCond_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFrm_YSCond = class(TForm)
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure QryDo;
  end;

var
  Frm_YSCond: TFrm_YSCond;

implementation
 uses constvar,pick_item_single, damo,Frm_YSResult_u;
{$R *.dfm}

{ TFrm_YSCond }

class procedure TFrm_YSCond.QryDo;
begin
  with TFrm_YSCond.Create(nil) do
  try
    DateTimePicker1.date:=date-90;
    if showmodal=mrok then
    begin
      hide;
      try
        Frm_YSResult:=TFrm_YSResult.Create(nil);
        Frm_YSResult.ADOQuery1.SQL.Text:=Frm_YSResult.ADOQuery1.SQL.Text+
        ' and Data0060.ENT_DATE>='''+FormatDateTime('YYYY/MM/DD',DateTimePicker1.date)+'''';
        if Edit1.Text<>'' then
          Frm_YSResult.ADOQuery1.SQL.Text:=Frm_YSResult.ADOQuery1.SQL.Text+' and data0010.cust_code='''+Edit1.Text+'''';
        Frm_YSResult.ADOQuery1.SQL.Text:=Frm_YSResult.ADOQuery1.SQL.Text+' GROUP BY dbo.Data0097.PO_NUMBER, dbo.Data0025.MANU_PART_NUMBER, derivedtbl_1.qty, derivedtbl_1.amount';
        Frm_YSResult.ADOQuery1.Open;
        Frm_YSResult.ShowModal;
      finally
        Frm_YSResult.free
      end;
    end;
  finally
    free;
  end;
end;

procedure TFrm_YSCond.BitBtn1Click(Sender: TObject);
var inputvar: PDlgInput;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    inputvar.Fields:='cust_code/客户代码/130,customer_name/客户名称/240';
    inputvar.Sqlstr:='select rkey,cust_code,customer_name from data0010 order by cust_code';
    inputvar.KeyField:='cust_code';
    inputvar.InPut_value:=edit1.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
    with frmpick_item_single.adsPick do
    begin
      edit1.Text:=trim(FieldValues['cust_code']);
      label4.Caption:=trim(FieldValues['customer_name']);
    end;
  finally
    frmpick_item_single.free;
  end;
end;

procedure TFrm_YSCond.Edit1Exit(Sender: TObject);
begin
  if (Edit1.Text<>'') and (self.ActiveControl<>BitBtn3) then
  begin
    dm.aqtmp.Close;
    dm.aqtmp.SQL.Text:='select cust_code,customer_name from data0010 where cust_code='''+Edit1.Text+'''';
    dm.aqtmp.Open;
    if not dm.aqtmp.IsEmpty then
    begin
      edit1.Text:=trim(dm.aqtmp.FieldValues['cust_code']);
      label4.Caption:=trim(dm.aqtmp.FieldValues['customer_name']);
    end else begin
      showmessage('客户代码不存在');
      edit1.SetFocus;
    end;
  end;
end;

end.
