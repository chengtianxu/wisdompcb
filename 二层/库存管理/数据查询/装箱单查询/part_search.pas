unit part_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, Db, DBTables, ComCtrls,
  Menus, ADODB, ExtCtrls;

type
  TForm_CustPart = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1manu_part_number: TStringField;
    ADOQuery1manu_part_desc: TStringField;
    ADOQuery1customer_ptr: TIntegerField;
    ADOQuery1bath_former: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1TitleClick(Column: TColumn);
   private
    { Private declarations }
   fieldname:string; 
  public
    { Public declarations }
  end;

var
  Form_CustPart: TForm_CustPart;

implementation
uses main;
{$R *.DFM}

procedure TForm_CustPart.Edit1Change(Sender: TObject);
begin
  if Edit1.text<>'' then
   Adoquery1.Filter:=fieldname+' like '''+trim(edit1.Text)+'%'''
  else
   Adoquery1.Filter:='';

end;

procedure TForm_CustPart.BitBtn3Click(Sender: TObject);
begin
 Edit1.text:='';
 Edit1.SetFocus ;
end;

procedure TForm_CustPart.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrOk;
end;

procedure TForm_CustPart.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrOk;
end;

procedure TForm_CustPart.FormCreate(Sender: TObject);
begin
 adoquery1.Open;
 fieldname:='manu_part_number';
end;

procedure TForm_CustPart.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;   
end;

procedure TForm_CustPart.DBGrid1TitleClick(Column: TColumn);
begin
if self.fieldname<>column.FieldName then
 begin
  self.fieldname:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
 end;
end;

end.
