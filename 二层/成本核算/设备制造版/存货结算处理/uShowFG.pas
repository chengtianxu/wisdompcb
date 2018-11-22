unit uShowFG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, DB, StdCtrls, Buttons;

type
  TfrmshowFG = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmshowFG: TfrmshowFG;

implementation

uses uDM, uEditFG, uMain;

{$R *.dfm}

procedure TfrmshowFG.BitBtn2Click(Sender: TObject);
begin
frmmain.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

end.
