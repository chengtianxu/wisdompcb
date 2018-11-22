unit part_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, Db, DBTables, ComCtrls,
  Menus, ADODB;

type
  TFrmCustPart = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1manu_part_number: TStringField;
    ADOQuery1manu_part_desc: TStringField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    ADOQuery1customer_ptr: TIntegerField;
    ADOQuery1abbr_name: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
   private
    { Private declarations }
   PreColumn: TColumn;
   field_name: string;
  public
    { Public declarations }
  end;

var
  FrmCustPart: TFrmCustPart;

implementation
uses Demo;
{$R *.DFM}

procedure TFrmCustPart.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   Adoquery1.Filter := field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  Adoquery1.Filter := '';
end;

procedure TFrmCustPart.BitBtn3Click(Sender: TObject);
begin
  Edit1.text:='';
  Edit1.SetFocus ;
end;

procedure TFrmCustPart.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then ModalResult := mrOk;
end;

procedure TFrmCustPart.FormCreate(Sender: TObject);
begin
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TFrmCustPart.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not adoquery1.IsEmpty) then ModalResult := mrOk;
if (chr(key)='V') and (ssalt in shift) then
 showmessage(ADOQuery1.SQL.Text);
end;

procedure TFrmCustPart.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TFrmCustPart.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
