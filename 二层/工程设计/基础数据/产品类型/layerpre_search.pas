unit layerpre_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TForm_layerpre = class(TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADODataSet;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1layers: TWordField;
    ADOQuery1PRECHAR1: TStringField;
    ADOQuery1PRECHAR2: TStringField;
    ADOQuery1sufchar: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_layerpre: TForm_layerpre;

implementation

uses main;

{$R *.dfm}

procedure TForm_layerpre.FormCreate(Sender: TObject);
begin
self.ADOQuery1.Open;
end;

procedure TForm_layerpre.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then  modalresult:=mrok;
end;

end.
