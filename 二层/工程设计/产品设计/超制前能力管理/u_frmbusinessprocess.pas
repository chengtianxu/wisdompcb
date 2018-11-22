unit u_frmbusinessprocess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, Menus;

type
  Tfrmbusinessprocess = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    N4: TMenuItem;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbusinessprocess: Tfrmbusinessprocess;

implementation

uses uDM, u_frmcpedit,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure Tfrmbusinessprocess.FormShow(Sender: TObject);
begin
  dm.ADO0741.Active := True;

 { with  dm.ADO0742 do
  begin
  close;
  Parameters.ParamByName('rkey741').Value:=dm.ADO0741rkey.Value;
  Open;
  end;  }
  dm.ADO0741.Active := true;
  dm.ADO0742.Active := true;

end;

procedure Tfrmbusinessprocess.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  modalresult:=mrok;
end;

procedure Tfrmbusinessprocess.BitBtn1Click(Sender: TObject);
begin
      try
          frm_cpedit:=Tfrm_cpedit.Create(nil);
          if (Sender as TBitBtn).Tag = 0
          then  dm.ADO0741.Insert else dm.ADO0741.Edit;
          
        if frm_cpedit.ShowModal=mrok then
          begin
          end;
      finally
          frm_cpedit.Free;
      end;
end;

procedure Tfrmbusinessprocess.N1Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除此流程吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
    dm.ADO0741.Delete;
end;

procedure Tfrmbusinessprocess.MenuItem1Click(Sender: TObject);
var rkey741,rkey742,index742 : Integer;

begin
   if MessageBox(Handle,'确定删除该部门流程吗?' ,'提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
   begin
       rkey742 := dm.ADO0742rkey.Value;
       rkey741 := dm.ADO0742d741_ptr.Value;
       index742 := dm.ADO0742d34_index.Value;
      dm.ADOConnection1.BeginTrans;
      try
        dm.ADO0742.Active := false;
        dm.ADOTMP1.SQL.Clear;
        dm.ADOTMP1.SQL.Text := 'delete from FA0742 where rkey='+inttostr(rkey742);
        dm.ADOTMP1.ExecSQL;
        dm.ADOTMP1.SQL.Text :=' update FA0742 set d34_index=d34_index-1 from FA0742 where d741_ptr='+inttostr(rkey741)+ '  and d34_index>'+ inttostr(index742);
        dm.ADOTMP1.ExecSQL;
        ShowMessage('删除成功！');
        DM.ADOConnection1.CommitTrans;
      except
        ShowMessage('遇到错误,撤销数据操作');
        dm.ADOConnection1.RollbackTrans;
      end;
     dm.ADO0742.Active := True;
   end;
end;

procedure Tfrmbusinessprocess.N4Click(Sender: TObject);
var     InputVar: PDlgInput ;
         rowcount : Integer;
begin

  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
      InputVar.Fields := 'dept_code/部门代码/200,dept_name/部门名称/250';
      InputVar.Sqlstr := 'select rkey,dept_code,dept_name from data0034 where active_flag=0 and ttype =4  ';
      InputVar.AdoConn := dm.ADOConnection1;
      frmPick_Item_Single.InitForm_New(InputVar) ;
    
    if frmPick_Item_Single.ShowModal=mrok then
    begin
          dm.ADOTMP1.SQL.Clear;
          dm.ADOTMP1.SQL.Text := 'select count(*) as trowcount  from FA0742 where d741_ptr='+inttostr(dm.ADO0741rkey.Value);
          dm.ADOTMP1.Open;
          rowcount := dm.ADOTMP1.FieldByName('trowcount').AsInteger;
          dm.ADOTMP1.Close;
          dm.ADOTMP1.SQL.Clear;
          rowcount :=rowcount+1;
       dm.ADOTMP1.SQL.Text :=' insert into FA0742 (d741_ptr,d34_index,d34_ptr) '+
       ' select '+inttostr(dm.ADO0741rkey.Value)+','+inttostr(rowcount)+','
       +inttostr(frmPick_Item_Single.adsPick.FieldValues['rkey']);
       dm.ADOTMP1.ExecSQL;
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
   dm.ADO0742.Active := False;
   dm.ADO0742.Active := True;

end;

procedure Tfrmbusinessprocess.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (ssAlt in Shift)  and  (Key=86) then
   showmessage(DM.ADO0742.SQL.Text);
end;

procedure Tfrmbusinessprocess.DBGridEh2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 with  dm.ADO0742 do
  begin
  close;
  Parameters.ParamByName('rkey741').Value:=dm.ADO0741rkey.Value;
  Open;
  end;
end;

end.
