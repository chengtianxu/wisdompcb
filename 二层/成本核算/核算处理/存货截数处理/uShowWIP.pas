unit uShowWIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, Menus, StdCtrls, Buttons;

type
  TfrmshowWIP = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmshowWIP: TfrmshowWIP;

implementation

uses uDM, uEditWIP, uMain;

{$R *.dfm}

procedure TfrmshowWIP.BitBtn2Click(Sender: TObject);
begin
frmmain.CopyDbDataToExcel([dbgrid1],self.Caption);
end;

end.
