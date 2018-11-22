unit custpart_search;

interface

uses
  SysUtils, Classes, Controls, Forms, 
  StdCtrls, Buttons, DBGrids, Db, 
  ADODB, ExtCtrls, Grids;

type
  TFrmCustPart = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1manu_part_number: TStringField;
    ADOQuery1manu_part_desc: TStringField;
    ADOQuery1customer_ptr: TIntegerField;
    ADOQuery1analysis_code_2: TStringField;
    ADOQuery1bath_former: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
   private
    { Private declarations }
    filter:string;
   public
    { Public declarations }
   end;

var
  FrmCustPart: TFrmCustPart;

implementation
 
{$R *.DFM}

procedure TFrmCustPart.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  Adoquery1.Filter := self.filter+' like '''+trim(edit1.Text)+'%'''
 else
  Adoquery1.Filter:='';
end;

procedure TFrmCustPart.BitBtn3Click(Sender: TObject);
begin
 Edit1.text:='';
 Edit1.SetFocus ;
end;

procedure TFrmCustPart.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
 ModalResult:=mrOk;
end;

procedure TFrmCustPart.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrOk;
end;

procedure TFrmCustPart.FormCreate(Sender: TObject);
begin
 filter:='Customer_part_number';
 adoquery1.Open;
end;

procedure TFrmCustPart.DBGrid1TitleClick(Column: TColumn);
begin
if filter<>column.fieldname then
begin
 filter:=column.FieldName;
 label1.Caption:=column.Title.Caption;
 edit1.SetFocus;
end; 
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
