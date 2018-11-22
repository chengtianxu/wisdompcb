unit stat;

interface

uses
  Classes, Controls, Forms, udm,
  DB, DBGrids, ADODB, Grids;

type
  Tsfrm = class(TForm)
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sfrm: Tsfrm;

implementation

{$R *.dfm}

end.
