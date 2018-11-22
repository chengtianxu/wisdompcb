unit invtransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, ADODB,ComObj,Excel2000, ClipBrd,
  Buttons;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ado27: TADOQuery;
    ado27EMPLOYEE_NAME: TStringField;
    ado27BARCODE_ID: TStringField;
    ado27INV_PART_NUMBER: TStringField;
    ado27INV_PART_DESCRIPTION: TStringField;
    ado27INV_NAME: TStringField;
    ado27form_ware: TStringField;
    ado27from_location: TStringField;
    ado27UNIT_NAME: TStringField;
    ado27TDATE: TDateTimeField;
    ado27QUANTITY: TFloatField;
    ado27to_ware: TStringField;
    ado27to_location: TStringField;
    ado27SUPPLIER_NAME: TStringField;
    ado27CODE: TStringField;
    ado27CURR_CODE: TStringField;
    ado27TAX_2: TBCDField;
    ado27tax_PRICE: TBCDField;
    ado27DSDesigner: TBCDField;
    ado27DSDesigner2: TFloatField;
    ado27DSDesigner3: TFloatField;
    ado27DSDesigner4: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses main;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm5.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado27.SQL.Text);
end;

procedure TForm5.Button2Click(Sender: TObject);

 begin
 form1.CopyDbDataToExcel([dbgrid1],self.Caption);
 end;
procedure TForm5.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
  if MessageBox(Handle,'确定导出EXCEL表吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
  
 form1.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

end.
