unit AcctSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, DBTables, StdCtrls, Grids, DBGrids, ADODB, ExtCtrls;

type
  TFrmAcctSearch = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    Button2: TButton;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ADOData0103: TADODataSet;
    RadioGroup1: TRadioGroup;
    ADOData0103RKEY: TAutoIncField;
    ADOData0103CURR_TP: TWordField;
    ADOData0103CURR_PTR: TIntegerField;
    ADOData0103DSDesigner: TStringField;
    ADOData0103DSDesigner2: TStringField;
    ADOData0103GL_ACC_NUMBER: TStringField;
    ADOData0103description_2: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  FrmAcctSearch: TFrmAcctSearch;

implementation
uses uDM;
{$R *.dfm}

procedure TFrmAcctSearch.Edit1Change(Sender: TObject);
begin
 if TRIM(EDIT1.TEXT)<>'' THEN
   if self.RadioGroup1.ItemIndex=1 then
    adodata0103.Filter := field_name+' like ''%'+trim(EDIT1.TEXT)+'%'''
  else
    adodata0103.Filter := field_name+' like '+''''+trim(EDIT1.TEXT)+'%'''
 else
  adodata0103.FILTER := '';
end;

procedure TFrmAcctSearch.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TFrmAcctSearch.FormCreate(Sender: TObject);
begin
 adodata0103.Open;
 field_name:='gl_acc_number';

end;

procedure TFrmAcctSearch.DBGrid1TitleClick(Column: TColumn);
begin
if (column.ReadOnly) and (column.FieldName<>self.field_name) then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  ADOData0103.Sort:=Column.FieldName;
  edit1.SetFocus;
 end;
end;

procedure TFrmAcctSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adodata0103.IsEmpty) then button1click(sender);
end;

procedure TFrmAcctSearch.DBGrid1DblClick(Sender: TObject);
begin
 if (not adodata0103.IsEmpty) then button1click(sender);
end;

procedure TFrmAcctSearch.Button1Click(Sender: TObject);
begin
ModalResult:=mrok;
end;

procedure TFrmAcctSearch.FormShow(Sender: TObject);
var
 vClo:TColumn;
begin
 vclo:=DBGrid1.Columns[0];
 DBGrid1TitleClick(vclo);
end;

procedure TFrmAcctSearch.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
if adodata0103.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

end.
