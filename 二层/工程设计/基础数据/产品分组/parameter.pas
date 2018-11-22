unit parameter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, Buttons, ADODB, ExtCtrls;

type
  TFrmParameter = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1PARAMETER_NAME: TStringField;
    ADOQuery1parameter_desc: TStringField;
    ADOQuery1category_name: TStringField;
    ADOQuery1category_type: TSmallintField;
    ADOQuery1data_type: TSmallintField;
    ADOQuery1DataType: TStringField;
    Label1: TLabel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1unit_name: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParameter: TFrmParameter;

implementation
USES Main;

{$R *.DFM}

procedure TFrmParameter.BitBtn1Click(Sender: TObject);
begin
EDIT1.TEXT:='';
edit1.SetFocus;
end;

procedure TFrmParameter.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
   AdoQUERY1.Filter:='PARAMETER_Name like '''+trim(EDIT1.TEXT)+'%'''
  ELSE
  AdoQUERY1.FILTER:='';
  
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TFrmParameter.DBGrid1DblClick(Sender: TObject);
begin
if  (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TFrmParameter.ADOQuery1CalcFields(DataSet: TDataSet);
begin
case Adoquery1.FieldByName('data_type').asinteger of
  1: Adoquery1.FieldByName('datatype').asstring:='ÊýÖµ';
  2: Adoquery1.FieldByName('datatype').asstring:='×Ö·û';
end;
end;

procedure TFrmParameter.FormCreate(Sender: TObject);
begin
  Adoquery1.Open;
 if adoquery1.IsEmpty then
  button1.Enabled:=false
 else
  button1.Enabled:=true;   
end;

procedure TFrmParameter.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then  ModalResult:=mrok;
end;

end.
