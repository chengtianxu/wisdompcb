unit control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, ComCtrls, Menus,
  ExtCtrls, DBGridEh;

type
  TForm1 = class(TForm)
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
  uses common, dmo, Editor;
{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  DM.ADO04.Close;
  DM.ADO04.Open;
  DM.ADO04.Refresh;
  Edit1.Text:='';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
  preColumn:=DBGridEh1.Columns[0];
  Label1.Caption:=preColumn.Title.Caption;

// rkey73:='851';
// user_ptr := '963';
// vprev := '4';

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  DM.ADO04.Active:=True;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if DM.Adoconnection1.Connected then
   begin

   end;
end;
procedure TForm1.N1Click(Sender: TObject);
var
  i: Integer;
begin
  i := DM.ADO04.RecNo;
  Form_Editor:=TForm_Editor.Create(Application);
  Form_Editor.Caption:=Application.Title;
  DM.ADO04.Edit;
  Form_Editor.Edit1.Text:=DM.ADO04seed_mean.Value;
  Form_Editor.Edit2.Text:=DM.ADO04table_name.Value;
  Form_Editor.ComboBox1.ItemIndex:=Form_Editor.ComboBox1.Items.IndexOf(DM.ADO04seed_flag1.Value);
  if Form_Editor.ShowModal=mrok then
  begin
    BitBtn2Click(nil);
    DM.ADO04.RecNo := i;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADO04.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADO04.IndexFieldNames:=Column.FieldName;
  end;
  if Column.Tag<>1 then
  begin
    if preColumn.FieldName<>Column.FieldName then
    begin
      Label1.Caption:=Column.Title.Caption;
      Column.Color:=clRed;
      preColumn.Color:=clBtnFace;
      preColumn:=Column;
      Edit1.Text:='';
    end;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    DM.ADO04.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    DM.ADO04.Filter:='';
end;

end.
