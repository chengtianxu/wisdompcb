unit custpart_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, Db, DBTables, ComCtrls,
  Menus, ADODB, ExtCtrls;

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
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1unit_code: TStringField;
    ADOQuery1unit_name: TStringField;
    ADOQuery1PRODUCT_DESC: TStringField;
    ADOQuery1new_price: TBCDField;
    ADOQuery1ttype: TStringField;
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
   field_name:string;
  public
    { Public declarations }
  end;

var
  FrmCustPart: TFrmCustPart;

implementation
 uses main, damo;
{$R *.DFM}

procedure TFrmCustPart.Edit1Change(Sender: TObject);
begin
 if Edit1.text<>'' then
  Adoquery1.Filter := self.field_name+' like ''%'+trim(edit1.Text)+'%'''
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
 self.field_name:='PROD_CODE';
// ADOQUERY1.Open;
end;

procedure TFrmCustPart.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name then
 begin
  self.field_name:=column.FieldName;
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
