unit layer_frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TForm_layer = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    ads93: TADODataSet;
    DataSource1: TDataSource;
    ads93RECORD_KEY: TAutoIncField;
    ads93CODE: TStringField;
    ads93DESCRIPTION: TStringField;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    ads94: TADODataSet;
    DataSource2: TDataSource;
    ads94SEQUENCE_NUMBER: TSmallintField;
    ads94TEXT_LINE: TStringField;
    ads94HEADER_POINTER: TIntegerField;
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
    field_name:string;    
  public
    { Public declarations }
  end;

var
  Form_layer: TForm_layer;

implementation

uses damo;

{$R *.dfm}

procedure TForm_layer.Edit1Change(Sender: TObject);
begin
  if Edit1.text<>'' then
   ads93.Filter :=field_name+' like ''%'+Trim(Edit1.Text)+'%'''
  else
   ads93.filter:='';
 if ads93.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;
end;

procedure TForm_layer.DBGrid1DblClick(Sender: TObject);
begin
if not ads93.IsEmpty then modalresult:=mrok;
end;

procedure TForm_layer.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not ads93.IsEmpty) then ModalResult:=mrOk;
end;

procedure TForm_layer.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>ads93.IndexFieldNames) then
 ads93.IndexFieldNames:=column.FieldName;

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

procedure TForm_layer.FormCreate(Sender: TObject);
begin
 ads94.Open;
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0]; 
end;

end.
