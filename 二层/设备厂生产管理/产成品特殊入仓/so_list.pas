unit so_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  TForm_solist = class(TForm)
    DataSource1: TDataSource;
    AqD63: TADODataSet;
    AqD63PROD_CODE: TStringField;
    AqD63PRODUCT_NAME: TStringField;
    AqD63CODE: TStringField;
    AqD63remark: TStringField;
    AqD63UNIT_NAME: TStringField;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    AqD63qvl_qty: TBCDField;
    AqD63prod_ptr: TIntegerField;
    AqD63location_ptr: TIntegerField;
    AqD63LOCATION: TStringField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_solist: TForm_solist;

implementation

uses damo;

{$R *.dfm}

procedure TForm_solist.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(aqd63.CommandText);
 if (key=13) and (not aqd63.IsEmpty) then ModalResult:=mrOk; 
end;

procedure TForm_solist.DBGrid1DblClick(Sender: TObject);
begin
if not aqd63.IsEmpty then  ModalResult:=mrOk;
end;

end.
