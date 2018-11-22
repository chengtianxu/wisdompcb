unit fgtransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, ADODB, Menus,ComObj, Excel2000,ClipBrd,
  Buttons;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADO113: TADOQuery;
    ADO113TDATE: TDateTimeField;
    ADO113EMPLOYEE_NAME: TStringField;
    ADO113CUST_CODE: TStringField;
    ADO113custcode_in: TStringField;
    ADO113QUANTITY: TFloatField;
    ADO113MANU_PART_NUMBER: TStringField;
    ADO113MANU_PART_DESC: TStringField;
    ADO113customerpart_in: TStringField;
    ADO113cprev_in: TStringField;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    ADO113mian_ji: TFloatField;
    Label2: TLabel;
    Edit2: TEdit;
    ADO113REFERENCE_NUMBER: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

uses main,common;

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
  showmessage(ado113.SQL.Text);
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
 Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

end.
