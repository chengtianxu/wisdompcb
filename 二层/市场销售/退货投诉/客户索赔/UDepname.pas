unit UDepname;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TFrm_depname = class(TForm)
    Button1: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    sdate:Integer;
    { Public declarations }
  end;

var
  Frm_depname: TFrm_depname;

implementation

uses Udemo,ConstVar,Pick_Item_Single, UnDetail, Unusual;

{$R *.dfm}

procedure TFrm_depname.Button1Click(Sender: TObject);
var i:Integer;
begin
 if Trim(Edit2.Text)='' then Exit;
       for i:=1 to Frm_UnDetail.StringGrid1.RowCount-2 do
      begin
        if (Frm_UnDetail.StringGrid1.Cells[0,i])=(IntToStr(Frm_depname.Edit2.Tag)) then
        begin
         ShowMessage('人员已存在');
         exit;

        end;
      end;
 ModalResult:=mrOk;
end;

procedure TFrm_depname.BitBtn2Click(Sender: TObject);
var inputvar: PDlgInput;
//i:Integer;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
   InputVar.Fields := 'USER_LOGIN_NAME/用户代码/250,USER_FULL_NAME/用户名称/250';
   InputVar.Sqlstr :='SELECT USER_LOGIN_NAME, USER_FULL_NAME,RKEY FROM dbo.Data0073 WHERE ACTIVE_FLAG=0 ' ;


   inputvar.KeyField:='rkey';
   InputVar.AdoConn := DM.ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
    Edit2.Text:=frmPick_Item_Single.adsPick.FieldValues['USER_FULL_NAME'];
    Edit2.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
    Label1.Caption:= frmPick_Item_Single.adsPick.Fieldbyname('USER_LOGIN_NAME').Value;

   end ;
  finally
   frmPick_Item_Single.Free ;
  end;
end;

end.
