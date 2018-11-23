unit qk20001EditFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseEditVGridFrm, Data.DB, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBVertGridsEh, Vcl.ExtCtrls, RzButton, RzPanel,
  Vcl.StdCtrls, Vcl.DBCtrls, RzDBEdit;

type
  Tfrmqk20001Edit = class(Tfrmqkbaseeditvgrid)
    mmoSqltxt: TRzDBMemo;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmqk20001Edit:Tfrmqk20001Edit = nil;

implementation

uses
  qkFunc.Commfunc;

{$R *.dfm}

procedure Tfrmqk20001Edit.btnSaveClick(Sender: TObject);
begin
  qkCommfunc.SetCurrIDKey(DataSet,True);
  inherited;

end;

end.
