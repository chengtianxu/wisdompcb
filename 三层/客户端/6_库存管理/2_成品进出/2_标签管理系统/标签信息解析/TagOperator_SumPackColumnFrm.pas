unit TagOperator_SumPackColumnFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrm, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmTagOperator_SumPackColumn = class(TfrmBase)
    pnl1: TPanel;
    btn1: TButton;
    btn2: TButton;
    pnl2: TPanel;
    eh1: TDBGridEh;
    cds1: TClientDataSet;
    ds1: TDataSource;
    cds1Checked: TBooleanField;
    cds1SumColumn: TStringField;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmTagOperator_SumPackColumn.btn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmTagOperator_SumPackColumn.btn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmTagOperator_SumPackColumn.FormCreate(Sender: TObject);
begin
  inherited;
  cds1.CreateDataSet;
end;

end.
