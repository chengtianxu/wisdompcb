unit TrainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, damo, StdCtrls, ExtCtrls;

type
  TFrmTrain = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblEmpCode: TLabel;
    lblEmpName: TLabel;
    lblDepartment: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrain: TFrmTrain;

implementation

{$R *.dfm}

procedure TFrmTrain.FormCreate(Sender: TObject);
begin
  DM.qryTrain.Close;
  DM.qryTrain.Parameters[0].Value := DM.qrychosieEmp.fieldByname('Rkey').Value;
  DM.qryTrain.Open;
  lblEmpCode.Caption := DM.qrychosieEmp.FieldValues['employeecode'];
  lblEmpName.Caption := DM.qrychosieEmp.FieldValues['chinesename'];
  lblDepartment.Caption := DM.qrychosieEmp.FieldValues['departmentname'];
end;

procedure TFrmTrain.DBGridEh1DblClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

end.
