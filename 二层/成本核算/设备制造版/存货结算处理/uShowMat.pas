unit uShowMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Menus, DB;

type
  TfrmshowMat = class(TForm)
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
  frmshowMat: TfrmshowMat;

implementation

uses uDM, uMain, uEditMAT;

{$R *.dfm}


procedure TfrmshowMat.BitBtn2Click(Sender: TObject);
begin
frmmain.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

end.
