unit Umain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus;

type
  TForm_main = class(TForm)
    PopupMenu1: TPopupMenu;
    mni_new: TMenuItem;
    N_Edit: TMenuItem;
    N_Check: TMenuItem;
    N4: TMenuItem;
    N_Del: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    qry_Main: TADOQuery;
    dsMain: TDataSource;
    qry_596: TADOQuery;
    ds596: TDataSource;
    qry_MainRKEY: TAutoIncField;
    qry_MainTYPE_CODE: TStringField;
    qry_MainTYPE_NAME: TWideStringField;
    qry_MainLENGTH: TIntegerField;
    qry_596rkey595: TIntegerField;
    qry_596rkey593: TIntegerField;
    qry_596rec_no: TIntegerField;
    qry_596invt_ttyename: TWideStringField;
    qry_596TYPE_NAME: TWideStringField;
    qry_596Expr1: TIntegerField;
    qry_596Expr2: TIntegerField;
    qry_596Expr3: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure qry_MainAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mni_newClick(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure N_DelClick(Sender: TObject);
    procedure N_CheckClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Frkey:integer;
    PreColumn: TColumnEh;
    field_name:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

uses demo, Uedit,common;


{$R *.dfm}

procedure TForm_main.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm_main.BitBtn2Click(Sender: TObject);
begin
  qry_Main.Close;
  qry_Main.Open;
end;

procedure TForm_main.BitBtn4Click(Sender: TObject);
begin
 begin
 if not qry_Main.IsEmpty then
 if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
 end;
end;

procedure TForm_main.qry_MainAfterScroll(DataSet: TDataSet);
begin
 if qry_main.isempty then exit;
 qry_596.Close;
 qry_596.Parameters.ParamByName('rkey595').Value:=qry_Main.FieldValues['rkey'];
 qry_596.open;


end;

procedure TForm_main.FormShow(Sender: TObject);
begin
 qry_Main.Close;
 qry_Main.Open;
end;

procedure TForm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.Active then
 begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ; //=计算字段
  Frkey:=qry_Mainrkey.Value;

  if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_Main.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_Main.Sort:=Column.FieldName+' DESC';
  end;
  if Frkey<>-1 then  qry_Main.Locate('rkey',Frkey,[]);
  if (PreColumn.FieldName <> column.FieldName)
     and  (column.Field.DataType in [ftString,ftWideString]) then
   begin
    edit1.Text:='';
    edit1.SetFocus;
    label1.Caption := column.Title.Caption ;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
   end
  else
    edit1.SetFocus;
 end;
end;

procedure TForm_main.Edit1Change(Sender: TObject);
begin

  if Trim(Edit1.Text)<>'' then
  begin
    qry_Main.Filtered:=False;
    qry_Main.Filter:= PreColumn.FieldName + ' like ''%' + Trim(Edit1.Text)+ '%''';
    qry_Main.Filtered:=True;
  end
  else
  begin
    qry_Main.Filter:='';
  end;
end;

procedure TForm_main.FormCreate(Sender: TObject);
begin
if not app_init_2(DM.con1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
  self.Caption:=application.Title;

//  DM.con1.Open;
//  rkey73:='851';
//  user_ptr := '963';
//  vprev := '4';

  PreColumn := DBGridEh1.Columns[0];
  field_name := DBGridEh1.Columns[0].FieldName;
  DBGridEh1.Columns[0].Title.Color:=clRed;
end;

procedure TForm_main.mni_newClick(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有新增权限',mtinformation,[mbok],0)

 else
 begin

  try
    Form_edit:=TForm_edit.Create(Application);

    Form_edit.Label6.Visible:=False;
    Form_edit.Edit6.Visible:=False;
    DM.qry596.Close;
    DM.qry596.Parameters[0].Value :=0;
    DM.qry596.Open;
    DM.save596.Close;
    DM.save596.Parameters[0].Value :=0;
    DM.save596.Open;

    if Form_edit.ShowModal=mrok then
    begin
    BitBtn2Click(BitBtn2);
    qry_Main.Locate('rkey',Form_edit.Frkey,[]);
    end;
  finally
    Form_edit.Free;
  end;
 end;
end;

procedure TForm_main.N_EditClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then

    messagedlg('对不起!您没有编辑权限',mtinformation,[mbok],0)
  else
  begin
    try
      Form_edit:=TForm_edit.Create(Application);
      Form_edit.Edit6.Visible:=False;
      Form_edit.Label6.Visible:=False;
      Form_edit.status:=1; //编辑
      DM.save595.Close;
      DM.save595.Parameters[0].Value := qry_Main.FieldValues['rkey'];
      dm.save595.Open;
      DM.save596.Close;
      DM.save596.Parameters[0].Value := qry_Main.FieldValues['rkey'];
      dm.save596.Open;
      DM.qry596.Close;
      DM.qry596.Parameters[0].Value := qry_Main.FieldValues['rkey'];
      dm.qry596.Open;

      Form_edit.Edit1.Text:=qry_MainTYPE_CODE.AsString;
      Form_edit.edit2.Text:= qry_MainTYPE_NAME.AsString;
      Form_edit.edit3.Text:=  qry_MainLENGTH.AsString;
      if Form_edit.ShowModal=mrok then

      begin
       BitBtn2Click(BitBtn2);
       qry_Main.Locate('rkey',Form_edit.Frkey,[]);
      end;
    finally
     Form_edit.Free;
    end;
  end;
 end;
procedure TForm_main.N_DelClick(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有删除权限',mtinformation,[mbok],0);
  end
  else
 if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 try
   DM.con1.BeginTrans;

   DM.ADOQuery1.Close;
   DM.ADOQuery1.SQL.Text:='delete from data0595 where rkey='+qry_Mainrkey.AsString;
   DM.ADOQuery1.ExecSQL;


   DM.con1.CommitTrans;
   messagedlg('删除操作成功',mtinformation,[mbok],0);
   qry_Main.Close;
   qry_Main.Open;
 except
   DM.con1.RollbackTrans;

 end;

end;

procedure TForm_main.N_CheckClick(Sender: TObject);
begin
  Form_edit:=TForm_edit.Create(Application);
  DM.save595.Close;
  DM.save595.Parameters[0].Value := qry_Main.FieldValues['rkey']; //2
  dm.save595.Open;
  DM.save596.Close;
  DM.save596.Parameters[0].Value := qry_Main.FieldValues['rkey']; //2
  dm.save596.Open;
  DM.qry596.Close;
  DM.qry596.Parameters[0].Value := qry_Main.FieldValues['rkey']; //2
  dm.qry596.Open;

  Form_edit.Edit1.Text:=qry_MainTYPE_CODE.AsString;
  Form_edit.edit2.Text:= qry_MainTYPE_NAME.AsString;
  Form_edit.edit3.Text:=  qry_MainLENGTH.AsString;

  Form_edit.Panel3.Enabled:=False;
  Form_edit.Panel4.Enabled:=False;
  Form_edit.Panel5.Enabled:=False;
  Form_edit.BitBtn2.Enabled:=False;
  Form_edit.ShowModal;

end;


procedure TForm_main.PopupMenu1Popup(Sender: TObject);
begin
  if qry_Main.IsEmpty then
  begin
    N_Edit.Enabled:=False;
    N_Check.Enabled:=False;
    N_Del.Enabled:=False;
  end
  else
  begin
    N_Edit.Enabled:=True;
    N_Check.Enabled:=True;
    N_Del.Enabled:=True;
   end;
end;

procedure TForm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  ShowMessage(qry_Main.SQL.Text);
end;
end.
