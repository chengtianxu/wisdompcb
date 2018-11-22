unit Dictionary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DB, ADODB, DBGrids;

type
  TFrmDictionary = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn7: TBitBtn;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    ADOData0513: TADOQuery;
    ADOData0512: TADOQuery;
    procedure ADOData0512AfterScroll(DataSet: TDataSet);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDictionary: TFrmDictionary;

implementation

uses datamodule;

{$R *.dfm}

procedure TFrmDictionary.ADOData0512AfterScroll(DataSet: TDataSet);
begin
  with Adodata0513 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from data0513 where grp_ptr='+Adodata0512.fieldbyname('rkey').asstring);
    sql.Add('order by description');
    prepared;
    open;
  end;
end;

procedure TFrmDictionary.DBGrid2DblClick(Sender: TObject);
begin
  modalresult:=mrok;
end;

procedure TFrmDictionary.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then   modalresult:=mrok;
end;

procedure TFrmDictionary.FormCreate(Sender: TObject);
begin
  Adodata0512.Open;
  Adodata0513.Open;
end;

end.
