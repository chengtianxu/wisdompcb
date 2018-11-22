unit supplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids;

type
  Tfrm_supplier = class(TForm)
    ads23: TADOQuery;
    ads23DSDesigner: TStringField;
    ads23DSDesigner2: TStringField;
    ads23DSDesigner3: TStringField;
    ads23AVL: TStringField;
    ads23DSDesigner4: TDateTimeField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_supplier: Tfrm_supplier;

implementation

uses DM_u;

{$R *.dfm}

procedure Tfrm_supplier.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ads23.SQL.Text);
end;

procedure Tfrm_supplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ads23.Close;
end;

end.
