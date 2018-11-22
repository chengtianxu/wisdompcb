unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DBGridEh, StdCtrls, DBCtrls, Buttons,
  Menus;

type
  TForm_main = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    pnl1: TPanel;
    btn2: TBitBtn;
    btn4: TBitBtn;
    BitBtn1: TBitBtn;
    ComboBox2: TComboBox;
    Edit3: TEdit;
    Label4: TLabel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    Label5: TLabel;
    pnl2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3Change(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure btn4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    PreColumn:TColumnEh;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation
  uses  Damo,common;
{$R *.dfm}

procedure TForm_main.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
    for i:=1 to DBGrideh2.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := dbgrideh2.Columns[i-1].Title.Caption ;
    if dbgrideh2.Columns[i-1].Visible then
        item.Checked := true ;
    item.OnClick := item_click ;
    self.PopupMenu1.Items.Add(item) ;
  end;
 DM.ADO25.Close;
 PreColumn:=DBGridEh1.Columns[0];
 DM.ADO25.Open;
end;

procedure TForm_main.btn2Click(Sender: TObject);
begin
Close;
end;


procedure TForm_main.FormCreate(Sender: TObject);
begin
if not app_init_2(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
 self.Caption:=application.Title;
 //  rkey73:='851';
//  user_ptr := '963';
//  vprev := '4';

end;

procedure TForm_main.DBGridEh2TitleClick(Column: TColumnEh);
begin
 if (column.Title.SortMarker=smDownEh) or (column.Title.SortMarker=smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADODataSet1.IndexFieldNames:=column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADODataSet1.IndexFieldNames:=column.FieldName+' DESC';
  end;
  if PreColumn.FieldName <> column.FieldName then
  begin
    Label4.Caption := column.Title.Caption;
    PreColumn.Title.Color := clBtnFace ;
    PreColumn:=column;
    edit3.SetFocus;
    edit3.Text:='';
  end
  else
    edit3.SetFocus;
end;

procedure TForm_main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADO25_1.CommandText);
end;

procedure TForm_main.Edit3Change(Sender: TObject);
begin
 if trim(edit3.Text)<>'' then
  begin
    dm.ADODataSet1.Filter:=PreColumn.FieldName+' like ''%'+trim(edit3.Text)+'%''';
  end
  else
  begin
    dm.ADODataSet1.Filter:='';
  end;
end;

procedure TForm_main.DBGridEh1CellClick(Column: TColumnEh);
begin
Edit1.Text:=DM.ADO25set_lngth.AsString;
Edit2.Text:=DM.ADO25set_width.AsString;
end;

procedure TForm_main.btn4Click(Sender: TObject);
begin
    IF DBGrideh2.DataSource.DataSet.Active THEN
      IF DBGrideh2.DataSource.DataSet.RecordCount > 0 THEN
      Export_dbGrideh_to_Excel(DBGrideh2,'查看防呆明细') ;
end;

procedure TForm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADO25.SQL.Text);
end;

procedure TForm_main.DBGridEh1DblClick(Sender: TObject);
begin
dm.ADODataSet1.Close;
dm.ADODataSet1.Parameters.ParamByName('num').Value:=ComboBox2.ItemIndex;
dm.ADODataSet1.Parameters.ParamByName('len').Value:=StrToFloat(Edit1.Text);
dm.ADODataSet1.Parameters.ParamByName('wid').Value:=StrToFloat(Edit2.Text);
dm.ADODataSet1.Open;

end;

procedure TForm_main.BitBtn1Click(Sender: TObject);
begin
    if edit1.Text='' then
  begin
    messagedlg('交货长度不能为空，请检查!',mtinformation,[mbok],0);
    edit1.SetFocus;
    exit;
  end;
    if edit2.Text='' then
  begin
    messagedlg('交货宽度不能为空，请检查!',mtinformation,[mbok],0);
    edit2.SetFocus;
    exit;
  end;
  begin
   DM.ADO25.Close;
   DM.ADO25.Parameters[3].Value:=ComboBox1.ItemIndex+1;
   dm.ADO25.Parameters.ParamByName('num').Value:=ComboBox2.ItemIndex;
   dm.ADO25.Parameters.ParamByName('len').Value:=StrToFloat(Edit1.Text);
   dm.ADO25.Parameters.ParamByName('wid').Value:=StrToFloat(Edit2.Text);
   DM.ADO25.Open;
  end;

end;

procedure TForm_main.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if (pos(key,'.0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
          //Key := #0 ;
          exit;
      end;
end;

procedure TForm_main.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if (pos(key,'.0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
          //Key := #0 ;
          exit;
      end;
end;

procedure TForm_main.BitBtn5Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;
 procedure TForm_main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGrideh2.FieldCount-1 do
              if DBGrideh2.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
                  begin
                      DBGrideh2.Columns[i].Visible:=true;
                      break;
                  end;
      end
  else
      begin
          for i := 0 to DBGrideh2.FieldCount-1 do
              if DBGrideh2.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGrideh2.Columns[i].Visible := false;
                      break;
                  end;
      end;
end;
procedure TForm_main.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if (pos(key,'.0123456789')=0) and (key<>chr(8)) then
      begin
          abort;
          //Key := #0 ;
          exit;
      end;
end;

end.
