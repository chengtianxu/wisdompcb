unit Modify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGridEh, DB, ADODB, ExtCtrls, Mask,
  DBCtrls;

type
  TForm_modify = class(TForm)
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);

  private
    { Private declarations }
     PreColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Form_modify: TForm_modify;


implementation
uses
  damo;
{$R *.dfm}

procedure TForm_modify.FormShow(Sender: TObject);
begin
  DM.ADOQuery3.Active;
  PreColumn := DBGridEh1.Columns[1];//数据表第二列显示为初始当前列
  Label1.Caption:='搜索：' + PreColumn.Title.Caption;//快速搜索索引属性赋值
  if (precolumn.Field.DataType in [ftString,ftWideString]) then
  begin
    DM.ADOQuery3.Sort:=PreColumn.FieldName+' ASC';
    Precolumn.Title.Color :=  clred;
    Precolumn.Title.SortMarker:=smUpEh;
  end;

end;



procedure TForm_modify.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if not dm.ADOQuery3.Active then exit;

  if column.Title.SortMarker =smDownEh then
  begin
     column.Title.SortMarker:=smUpEh;
     DM.ADOQuery3.Sort:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   DM.ADOQuery3.Sort:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:='搜索：' + column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm_modify.BitBtn1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssalt in shift) and (chr(key)='V') then
    showmessage(dm.ADOQuery3.SQL.Text);
end;

procedure TForm_modify.BitBtn2Click(Sender: TObject);
begin
  begin
  //  if dm.ADOQuery3GLPTR_STATUS.Value=true then
 //   begin
  //    application.messagebox('Confirm','确定不保存退出吗？',MB_OKCANCEL);
 //     dm.ADOQuery3.CancelBatch();
 //     break;
 //   end
  //  else
      close;
  end;
end;

procedure TForm_modify.BitBtn1Click(Sender: TObject);
begin
  if Application.MessageBox('确认要更新这些记录吗?', PChar('提示'),MB_YESNO)=6 then
  begin
    dm.ADOQuery3.UpdateBatch();
    dm.ADOQuery3.close;
    dm.ADOQuery3.Open;
  end;
end;

procedure TForm_modify.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    DBGridEh1.DataSource.DataSet.Filter:='';
end;


procedure TForm_modify.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if dm.ADOQuery3.Modified then
 if (messagedlg('你确定不保存退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes) then
  begin
   dm.ADOQuery3.CancelBatch();
   self.ModalResult:=mrcancel;
  end
 else
  CanClose:=false;
end;

procedure TForm_modify.BitBtn3Click(Sender: TObject);
begin
  if not dm.ADOQuery3.Active then Exit;
  with dm.ADOQuery3 do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        if not (state in [dsEdit]) then Edit;
        FieldByName('GLPTR_STATUS').AsBoolean:= True;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TForm_modify.BitBtn4Click(Sender: TObject);
begin
  if not dm.ADOQuery3.Active then Exit;
  with dm.ADOQuery3 do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        if not (state in [dsEdit]) then Edit;   
        FieldByName('GLPTR_STATUS').AsBoolean:= not FieldByName('GLPTR_STATUS').AsBoolean;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
end;

end.
