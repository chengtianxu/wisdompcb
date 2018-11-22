unit Uspzt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Menus,common;

type
  TForm1 = class(TForm)
    DBGridEh4: TDBGridEh;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh4DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Udemo,ConstVar,Pick_Item_Single;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  dm.ADOdl599.Close;
 DM.ADOdl599.Parameters[0].Value:=DM.ADO597rkey.Value;
 DM.ADOdl599.Open;
end;
 
procedure TForm1.DBGridEh4DblClick(Sender: TObject);
begin
 ShowMessage(DM.ADODl599PUTH_INFO.AsString);
end;

procedure TForm1.N1Click(Sender: TObject);
var inputvar: PDlgInput;
i:string;
rec:Integer;
begin
 if StrToInt(vprev)<>4 then
 begin
  messagedlg('对不起!您没有此功能权限',mtinformation,[mbok],0);
  Exit;
 end;
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
   InputVar.Fields := 'USER_LOGIN_NAME/用户代码/250,USER_FULL_NAME/用户名称/250';
   InputVar.Sqlstr :='SELECT USER_LOGIN_NAME, USER_FULL_NAME,RKEY FROM dbo.Data0073 WHERE ACTIVE_FLAG=0 ';
   inputvar.KeyField:='rkey';
   InputVar.AdoConn := DM.ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
   begin
    if messagedlg('将所有未审的索赔申请当前审核人员更新?',mtconfirmation,[mbyes,mbno],1)<>mryes then exit
    else
    rec:=DM.ADODl599.RecNo;
    DM.ADODl599.First;
    while not DM.ADODl599.Eof do
    begin
     if frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger= DM.ADODl599.Fieldbyname('rkey73').Value then
     begin
      ShowMessage('已存在此人员');
      Exit;
     end;
     DM.ADODl599.Next;
    end;
    DM.ADODl599.RecNo:=rec;
    i:=DM.ADODl599.Fieldbyname('rkey73').AsString;
    DM.ADOQuery1.Close;
    DM.ADOQuery1.SQL.Text:='UPDATE data0599 SET rkey73= '+frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString+'  where status=0 AND rkey73= '+i ;
    DM.ADOQuery1.ExecSQL;
   end ;
   DM.ADODl599.Close;
   DM.ADODl599.Open;
  finally
   frmPick_Item_Single.Free ;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);

begin
 N1.Enabled:=(DM.ADODl599auth_date.IsNull) and (not DM.ADODl599.IsEmpty);

end;

end.
