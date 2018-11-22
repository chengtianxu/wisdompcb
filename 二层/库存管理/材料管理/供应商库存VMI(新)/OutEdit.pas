unit OutEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm_OutEdit = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_OutEdit: TForm_OutEdit;

implementation

uses Audit, demo;

{$R *.dfm}

procedure TForm_OutEdit.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',edit2.Text)>0 then abort;     //小数点不能重复
 if not (key in ['0'..'9','.',#8]) then abort;//判断是否输入数字
end;

procedure TForm_OutEdit.Edit1Exit(Sender: TObject);
begin
 if trim(edit1.Text) = '' then  edit1.Text := '0';
 if strtofloat(edit1.Text) >( form_audit.ADOQuery1quan_on_hand.Value+form_audit.ADO149quantity.Value) then
 begin
  messagedlg('修改数量不能大于当前可用数量!',mterror,[mbcancel],0);
  edit1.SetFocus;
 end
 else edit1.Text := formatfloat('0.000',strtofloat(edit1.Text));
end;

procedure TForm_OutEdit.Edit2Exit(Sender: TObject);
begin
 if trim(edit2.Text) = '' then  edit2.Text := '0';
 if strtofloat(edit2.Text) >(form_audit.ADOQuery1quan_on_hand.Value+form_audit.ADO149rtn_quantity.Value) then
 begin
  messagedlg('修改数量不能大于当前可用数量!',mterror,[mbcancel],0);
  edit2.SetFocus;
 end
 else edit2.Text := formatfloat('0.000',strtofloat(edit2.Text));
end;

procedure TForm_OutEdit.BitBtn1Click(Sender: TObject);
begin
with dm.tmpt do
begin
close;
sql.Text:='select data0149.quantity,data0149.rtn_quantity from data0149 where rkey=:rkey';
parameters[0].Value:=form_audit.ADO149rkey.Value;
open;
end;
if (form_audit.ADO149quantity.Value<>dm.tmpt.FieldByName('quantity').Value) or (form_audit.ADO149rtn_quantity.Value<>dm.tmpt.FieldByName('rtn_quantity').Value) then
begin
showmessage('已有人在操作,请稍后再试!');
exit;
end
else
try
dm.ADOConnection1.BeginTrans;
form_audit.ADO149.Edit;
form_audit.ADOQuery1.Edit;
if form_audit.ADS148ttype.Value=0 then //退货出仓
begin //先更改库存数量
form_audit.ADOQuery1quan_on_hand.Value:=strtocurr(edit5.Text)+form_audit.ADO149rtn_quantity.Value-strtofloat(edit2.Text);
form_audit.ADO149rtn_quantity.Value:=strtofloat(edit2.Text);
form_audit.ADO149tax_price.Value:=strtofloat(edit3.Text);
end
else //领料出仓
begin//先更改库存数量
form_audit.ADOQuery1quan_on_hand.Value:=strtocurr(edit5.Text)+form_audit.ADO149quantity.Value-strtofloat(edit1.Text);
form_audit.ADO149quantity.Value:=strtofloat(edit1.Text);
form_audit.ADO149tax_price.Value:=strtofloat(edit3.Text);
end;
dm.ADOConnection1.CommitTrans;
form_audit.ADO149.Post;
form_audit.ADOQuery1.Post;
messagedlg('恭喜修改成功!', mtinformation,[mbok],0);
form_audit.ADO149.Close;
form_audit.ADO149.Open;//更新数量
self.Close;
except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
end;
end;

end.
