unit wip_divergent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls,ComObj, Excel97, DB, ADODB, ExtCtrls,
  Menus, DBGridEh;

type
  TForm11 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    RadioGroup2: TRadioGroup;
    PopupMenu1: TPopupMenu;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;
    procedure item_click(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses demo,common;

{$R *.dfm}
procedure TForm11.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGrid1.FieldCount - 1 do
    if DBGrid1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGrid1.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGrid1.FieldCount - 1 do
    if DBGrid1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGrid1.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TForm11.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm11.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.ADOQuery3.SQL.Text);
end;

procedure TForm11.Button2Click(Sender: TObject);

begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;
procedure TForm11.Button3Click(Sender: TObject);
begin
  PopupMenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm11.FormShow(Sender: TObject);
var i:integer;
    item:TMenuItem;
begin
  for i:=0 to DBGrid1.FieldCount-1 do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=DBGrid1.Columns[i].Title.Caption;
   if DBGrid1.Columns[i].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   PopupMenu1.Items.Add(item);
  end;
end;

procedure TForm11.RadioGroup2Click(Sender: TObject);
var i:Integer;
begin
 for i:=0 to DBGrid1.FieldCount-1 do
  if RadioGroup2.ItemIndex=0 then
  begin     //²»º¬°å±ß
   if DBGrid1.Columns[i].FieldName='mianji_1' then
    DBGrid1.Columns[i].FieldName:='mianji';
   if DBGrid1.Columns[i].FieldName='MJ_1' then
    DBGrid1.Columns[i].FieldName:='MJ';
  end else
  begin                                //º¬°å±ß
   if DBGrid1.Columns[i].FieldName='mianji' then
    DBGrid1.Columns[i].FieldName:='mianji_1';
   if DBGrid1.Columns[i].FieldName='MJ' then
    DBGrid1.Columns[i].FieldName:='MJ_1';
   end;
end;

end.
