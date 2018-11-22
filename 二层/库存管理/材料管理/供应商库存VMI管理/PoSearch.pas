unit PoSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB, ExtCtrls;

type
  TForm_PoSearch = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
        { Private declarations }
   v_colwidth: array of integer;
   dbgrid_width:integer;
   file_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_PoSearch: TForm_PoSearch;

implementation

uses demo,common, form_main_in;

{$R *.dfm}
procedure TForm_PoSearch.NewGridWnd(var Message: TMessage);
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


procedure TForm_PoSearch.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT)<>'' THEN
 dm.ADS70.Filter := self.file_name+' like ''%'+trim(edit1.text)+'%'''
 ELSE
 dm.ADS70.FILTER := '';
 
if dm.ADS70.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_PoSearch.BitBtn1Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm_PoSearch.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ADS70.IsEmpty then
 ModalResult := mrok;
end;

procedure TForm_PoSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not dm.ADS70.IsEmpty) then ModalResult := mrok;
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.ADS70.CommandText);
end;

procedure TForm_PoSearch.FormCreate(Sender: TObject);
begin
 file_name:='PO_NUMBER';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
 dbgrid_width:=dbgrid1.Width;
end;


procedure TForm_PoSearch.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>dm.ADS70.IndexFieldNames) and
   (column.FieldName<>'v_type') then
 dm.ADS70.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (column.FieldName<>file_name) then
 begin
  file_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end;
end;

procedure TForm_PoSearch.FormShow(Sender: TObject);
//var
//i:byte;
begin
dm.ADS70.Close;
dm.ADS70.Open;
setlength(v_colwidth,dbgrid1.FieldCount);
{for i:=0 to high(v_colwidth) do v_colwidth[i] := dbgrid1.Columns[i].Width;
if (strtoint(vprev) < 3) then
 begin

  dbgrid2.Columns[4].Visible:=false;
  dbgrid2.Columns[5].Visible:=false;

 end;}
end;

end.
