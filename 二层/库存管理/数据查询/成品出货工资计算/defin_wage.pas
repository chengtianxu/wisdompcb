unit defin_wage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Grids, DBGrids, Menus;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADS34: TADODataSet;
    ADS34DEPT_CODE: TStringField;
    ADS34DEPT_NAME: TStringField;
    ADS34wage_flag: TBooleanField;
    ADS34DSDesigner: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses damo;

{$R *.dfm}

procedure TForm2.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;


procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.N1Click(Sender: TObject);
begin
self.ADS34.Edit;
self.ADS34wage_flag.Value:=true;
self.ADS34.Post;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
self.ADS34.Edit;
self.ADS34wage_flag.Value:=false;
self.ADS34.Post;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if self.ADS34.IsEmpty then
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
 end
else
 begin
  if self.ADS34wage_flag.Value=true then
   begin
    n1.Enabled:=false;
    n2.Enabled:=true;
   end
  else
   begin
    n1.Enabled:=true;
    n2.Enabled:=false;
   end;
 end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 self.ADS34.Open;
 field_name:='dept_code';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  ads34.Filter := field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  ads34.Filter := '';
end;

procedure TForm2.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if ads34.IndexFieldNames<>column.FieldName then
 ads34.IndexFieldNames:=column.FieldName;
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;

end.
