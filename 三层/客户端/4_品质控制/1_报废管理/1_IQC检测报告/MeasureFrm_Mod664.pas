unit MeasureFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls;

type
  TfrmMeasure_Mod664 = class(TfrmBaseMain)
    btnSave: TBitBtn;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniDel: TMenuItem;
    procedure mniEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GRkey391:Integer;
    procedure GetData;override;
  end;

var
  frmMeasure_Mod664: TfrmMeasure_Mod664;

implementation

{$R *.dfm}

uses MeasureEditFrm_Mod664;

{ TfrmMeasure_Mod664 }

procedure TfrmMeasure_Mod664.GetData;
begin
//  FMainFrmSql:= ' SELECT * FROM DATA0392 WHERE rkey391=' + IntToStr(GRkey391);
  inherited;
end;

procedure TfrmMeasure_Mod664.mniEditClick(Sender: TObject);
var
  LFrm:TfrmMeasureEdit_Mod664;
begin
  inherited;
  LFrm:= TfrmMeasureEdit_Mod664.Create(nil);
  try
    LFrm.edtCount.Text:= cdsMain.FieldByName('sr_no').AsString;
    LFrm.edtMeasure_1.Text:= cdsMain.FieldByName('value_1').AsString;
    LFrm.edtMeasure_2.Text:= cdsMain.FieldByName('value_2').AsString;
    LFrm.edtMeasure_3.Text:= cdsMain.FieldByName('value_3').AsString;
    LFrm.edtMeasure_4.Text:= cdsMain.FieldByName('value_4').AsString;
    LFrm.edtMeasure_5.Text:= cdsMain.FieldByName('value_5').AsString;
    LFrm.edtMeasure_6.Text:= cdsMain.FieldByName('value_6').AsString;
    LFrm.edtMeasure_7.Text:= cdsMain.FieldByName('value_7').AsString;
    LFrm.edtMeasure_8.Text:= cdsMain.FieldByName('value_8').AsString;
    if LFrm.ShowModal = mrOk then
    begin
      cdsMain.Edit;
      cdsMain.FieldByName('value_1').AsString:=Trim(LFrm.edtMeasure_1.Text);
      cdsMain.FieldByName('value_2').AsString:=Trim(LFrm.edtMeasure_2.Text);
      cdsMain.FieldByName('value_3').AsString:=Trim(LFrm.edtMeasure_3.Text);
      cdsMain.FieldByName('value_4').AsString:=Trim(LFrm.edtMeasure_4.Text);
      cdsMain.FieldByName('value_5').AsString:=Trim(LFrm.edtMeasure_5.Text);
      cdsMain.FieldByName('value_6').AsString:=Trim(LFrm.edtMeasure_6.Text);
      cdsMain.FieldByName('value_7').AsString:=Trim(LFrm.edtMeasure_7.Text);
      cdsMain.FieldByName('value_8').AsString:=Trim(LFrm.edtMeasure_8.Text);
      cdsMain.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

end.
