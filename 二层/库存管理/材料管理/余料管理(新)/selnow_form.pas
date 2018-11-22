unit selnow_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Grids, DBGrids, ComCtrls;

type
  TForm_selnow = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    lblFilter: TLabel;
    edtFilter: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edtFilterChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    field_name:string;
    PreColumn: TColumn;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_selnow: TForm_selnow;

implementation

uses damo,main;
{$R *.dfm}

procedure TForm_selnow.BitBtn3Click(Sender: TObject);
begin
 form1.CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_selnow.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssalt in shift)and((key=ord('s'))or (KEY=ord('S')))then showmessage(dm.ADOD558.CommandText);
end;

procedure TForm_selnow.BitBtn1Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_selnow.DBGrid1TitleClick(Column: TColumn);
 var
 i :byte;
begin
dm.ADOD558.Sort:=column.FieldName;
  for i:=0 to DBGrid1.FieldCount-1 do
   if DBGrid1.Columns[i].Title.Color= clred then
   begin
    DBGrid1.Columns[i].Title.Color:= clbtnface;
    break;
   end;
  column.Title.Color:=clred;

    if (column.FieldName <>'LEN_SIZE') and
   (column.FieldName <> 'WEI_SIZE') and
   (column.FieldName <> 'QUAN_ON_HAND') then
 dm.ADOD558.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  lblFilter.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edtFilter.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edtFilter.SetFocus;
 dm.ADOD558.Sort:=column.FieldName;
end;

procedure TForm_selnow.edtFilterChange(Sender: TObject);
begin
 if trim(edtFilter.text)<>'' then
  dm.ADOD558.Filter := field_name+' like ''%'+trim(edtFilter.text)+'%'''
 else
  dm.ADOD558.filter := '';
end;

procedure TForm_selnow.FormShow(Sender: TObject);
begin
PreColumn := DBGrid1.Columns[0];  // add by lms


end;

end.
