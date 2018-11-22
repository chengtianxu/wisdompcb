unit Unit_lotmb1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DBGridEh;

type
  TForm_lotmb1 = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_lotmb1: TForm_lotmb1;

implementation

uses  damo,common;

{$R *.dfm}

procedure TForm_lotmb1.BitBtn1Click(Sender: TObject);
begin
   ModalResult := mrOK;
end;

procedure TForm_lotmb1.BitBtn2Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

end.
