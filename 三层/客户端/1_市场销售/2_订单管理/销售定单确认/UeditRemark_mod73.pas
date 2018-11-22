unit UeditRemark_mod73;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseSinglePickListFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TfrmSinglePickList)
    procedure btnOKClick(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unode_mod73,uCommFunc;

procedure TForm2.btnOKClick(Sender: TObject);
var
dataset,dataset90:TClientDataSet;
sql,sql90:string;
LData:OleVariant;
begin

 dataset:=TClientDataSet.Create(nil);
 dataset90:=TClientDataSet.Create(nil);
 sql:='select * from data0060 where prod_rel= '+'1'+' and status=1 and quote_price in(1,3) and rkey= '+ QuotedStr(cdsPick.FieldValues['rkey']);
 sql90:='select * from data0090 where IF_PUTHDATE=1 and pact_ptr= '+ QuotedStr(cdsPick.FieldValues['rkey']);
 gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([sql,sql90]),[dataset,dataset90]);
 if dataset.IsEmpty then
 begin
  ShowMessage('状态发生改变,请刷新数据!');
  Exit;
 end;
 Form3:=TForm3.Create(Application);
 try
  Form3.Caption:= Form3.Caption+ cdsPick.FieldValues['sales_order'];
  Form3.Memo1.Lines.Text:=cdsPick.FieldValues['RemarkAudit'];
  if Form3.ShowModal=mrOk then
  begin
   with dataset do
   begin
    Edit;
    FieldValues['RemarkAudit']:= Form3.Memo1.Lines.Text;
    FieldValues['quote_price']:=0;
    Post;
   end;
   if not dataset90.IsEmpty then
   begin
    with dataset90 do
    begin
     Edit;
     FieldValues['user_ptr']:=null;
     FieldValues['auth_date']:=null;
     Post;
    end;
   end;
   LData:= VarArrayCreate([0,1],varVariant);
   if dataset.ChangeCount>0 then LData[0]:=dataset.Delta;
   if dataset90.ChangeCount>0 then LData[1]:=dataset90.Delta;
   if gSvrIntf.IntfPostDataBySqlArr(VarArrayOf(['DATA0060','DATA0090']),LData) then
   begin
    ShowMessage('应期退回成功！');
   end
   else
   begin
    ShowMessage('应期退回失败，请联系管理员！');
    Exit;
   end;
  end;
 finally
  dataset.Free;
  dataset90.Free;
 end;
 if form3.ModalResult=mrOk then
 Close;
end;
procedure TForm2.eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
 showmessage(cdsPick.CommandText);
end;

end.
