unit quoteinvt_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TForm_quoteinvt = class(TForm)
    ads28: TADODataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    ads28CODE: TStringField;
    ads28ABBR_NAME: TStringField;
    ads28INV_PART_NUMBER: TStringField;
    ads28INV_NAME: TStringField;
    ads28INV_DESCRIPTION: TStringField;
    ads28TDATE: TDateTimeField;
    ads28RKEY: TIntegerField;
    ads28d0017_rkey: TIntegerField;
    ads28UNIT_NAME: TStringField;
    ads28CURR_NAME: TStringField;
    ads28BASE_TO_OTHER: TFloatField;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    ads28QTE_PRICE: TFloatField;
    ads28price1: TFloatField;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
  public
    { Public declarations }
  end;

var
  Form_quoteinvt: TForm_quoteinvt;

implementation

uses damo;

{$R *.dfm}

procedure TForm_quoteinvt.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  if radiogroup1.ItemIndex=0 then
   ADs28.Filter := field_name+' like '''+trim(edit1.text)+'%'''
  else
   ADs28.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  ADs28.filter := '';
if ADs28.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_quoteinvt.FormCreate(Sender: TObject);
begin
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TForm_quoteinvt.DBGrid1DblClick(Sender: TObject);
begin
if not ADs28.IsEmpty then ModalResult:=mrok;
end;

procedure TForm_quoteinvt.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not ADs28.IsEmpty) then ModalResult:=mrok;
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ads28.CommandText);
end;

procedure TForm_quoteinvt.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName<>ADs28.IndexFieldNames) then
 ADs28.IndexFieldNames:=column.FieldName;

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

procedure TForm_quoteinvt.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TForm_quoteinvt.RadioGroup1Click(Sender: TObject);
begin
 edit1.SetFocus;
end;

end.


