unit u_frmbusinessprocess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, Menus, AppEvnts;

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
    ApplicationEvents1: TApplicationEvents;
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
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
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

  with  dm.ADO0742 do
  begin
  close;
  Parameters.ParamByName('rkey741').Value:=dm.ADO0741rkey.Value;
  Open;
  end;


  //dm.ADO0741.Active := true;
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
          with  dm.ADO0742 do
          begin
          close;
          Parameters.ParamByName('rkey741').Value:=dm.ADO0741rkey.Value;
          Open;
          end;
          end;
      finally
          frm_cpedit.Free;
      end;
end;

procedure Tfrmbusinessprocess.N1Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定删除此流程吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;


    with dm.ADOTMP1 do
    begin
    close;
    sql.Clear;
    SQL.Text:='select 1 from FA0738 where check_type='+inttostr(dm.ADO0741.fieldbyname('rkey').AsInteger);
    open;
    end;


    if not dm.ADOTMP1.IsEmpty then
    begin
    ShowMessage('请检查该审批流程是否有被引用,如有被引用请先删除资料！！');
    Exit;
    end;

    with dm.ADODel742 do
    begin
    close;
    Parameters[0].Value:=dm.ADO0741rkey.Value;
    Open;
    end;

    dm.ADO0741.Delete;


    with  dm.ADO0742 do
    begin
    close;
    Parameters.ParamByName('rkey741').Value:=dm.ADO0741rkey.Value;
    Open;
    end;
   
end;

procedure Tfrmbusinessprocess.MenuItem1Click(Sender: TObject);
var rkey741,rkey742,index742 : Integer;

begin
   if MessageBox(Handle,'确定删除该部门流程吗?' ,'提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
   begin
       with dm.ADOTMP1 do
       begin
       close;
       sql.Clear;
       SQL.Text:='select 1 from FA0738 where check_type='+inttostr(dm.ADO0741.fieldbyname('rkey').AsInteger);
       open;
       end;

       if not dm.ADOTMP1.IsEmpty then
       begin
       ShowMessage('请检查该流程是否有被引用,如有被引用请先删除资料！！');
       end;

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
       ShowMessage('新增成功！');
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
 IF (ssalt in shift) and ((KEY=ORD('S')) OR (KEY=ORD('s')))
then showmessage(dm.ADO0742.SQL.Text);
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

procedure Tfrmbusinessprocess.DBGridEh2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF (ssalt in shift) and ((KEY=ORD('S')) OR (KEY=ORD('s')))
then showmessage(dm.ADO0741.SQL.Text);
end;

procedure Tfrmbusinessprocess.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
 if  (DBGridEh2.Focused)  And  (Msg.message  =  WM_MOUSEWHEEL)  then
       begin    
           if  Msg.wParam  >  0  then    
               SendMessage(DBGridEh2.Handle,  WM_KEYDOWN,  VK_UP,  0)
           else  
               SendMessage(DBGridEh2.Handle,  WM_KEYDOWN,  VK_DOWN,  0);
           Handled  :=  True;

          with  dm.ADO0742 do
          begin
          close;
          Parameters.ParamByName('rkey741').Value:=dm.ADO0741rkey.Value;
          Open;
          end;
       end;

end;

procedure Tfrmbusinessprocess.PopupMenu1Popup(Sender: TObject);
begin
  if dm.ADO0741.IsEmpty then
  begin
  N1.Enabled := False;
  end
  else
  N1.Enabled := True;
end;

procedure Tfrmbusinessprocess.PopupMenu2Popup(Sender: TObject);
begin
 if dm.ADO0742.IsEmpty then
  begin
  MenuItem1.Enabled := False;
  end
  else
  MenuItem1.Enabled := True;
end;

procedure Tfrmbusinessprocess.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
if dm.ADO0741Type.value=0
then  DBGridEh2.Canvas.Font.Color := clRed;
DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
