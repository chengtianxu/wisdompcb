unit voucher_dictionary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  TForm_dictionary = class(TForm)
    aq513: TADODataSet;
    aq513DSDesigner: TStringField;
    aq513DSDesigner2: TStringField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   field_name:string;
  public
    { Public declarations }
  end;

var
  Form_dictionary: TForm_dictionary;

implementation

uses damo;

{$R *.dfm}

procedure TForm_dictionary.Edit1Change(Sender: TObject);
begin
IF TRIM(EDIT1.TEXT)<>'' THEN
  aq513.Filter := field_name+' like ''%'+trim(EDIT1.TEXT)+'%'''
ELSE
  aq513.FILTER := '';

if aq513.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_dictionary.FormCreate(Sender: TObject);
begin
self.aq513.Open;
self.field_name:='ÕªÒªÀàÐÍ';
if aq513.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_dictionary.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.aq513.IndexFieldNames then
begin
 self.field_name:=column.FieldName;
 aq513.IndexFieldNames:=column.FieldName;
 label1.Caption:=column.Title.Caption;
 edit1.SetFocus;
end;
end;

procedure TForm_dictionary.DBGrid1DblClick(Sender: TObject);
begin
if (not aq513.IsEmpty) then self.ModalResult:=mrok;
end;

procedure TForm_dictionary.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not aq513.IsEmpty) then self.ModalResult:=mrok;
end;

end.
