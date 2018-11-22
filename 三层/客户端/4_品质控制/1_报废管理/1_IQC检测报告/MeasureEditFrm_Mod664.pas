unit MeasureEditFrm_Mod664;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmMeasureEdit_Mod664 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtMeasure_1: TEdit;
    edtMeasure_2: TEdit;
    edtMeasure_3: TEdit;
    edtMeasure_4: TEdit;
    edtMeasure_5: TEdit;
    edtMeasure_6: TEdit;
    edtMeasure_7: TEdit;
    edtMeasure_8: TEdit;
    edtCount: TEdit;
    procedure edtMeasure_1Exit(Sender: TObject);
    procedure edtMeasure_1KeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMeasureEdit_Mod664: TfrmMeasureEdit_Mod664;

implementation

{$R *.dfm}

procedure TfrmMeasureEdit_Mod664.btnSaveClick(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  for i:=0 to pnl2.ControlCount-1 do
  begin
    if (pnl2.Controls[i] is TEdit) and (Trim((pnl2.Controls[i] as TEdit).Text)='') then
    begin
      (pnl2.Controls[i] as TEdit).Text:='0';
    end;
  end;
  ModalResult:= mrOk;
end;

procedure TfrmMeasureEdit_Mod664.edtMeasure_1Exit(Sender: TObject);
var
   tmp:Extended;
begin
  inherited;
  if Trim((Sender as TEdit).Text) = '' then Exit;

  if TryStrToFloat(Trim((Sender as TEdit).Text),tmp) = False then
  begin
    ShowMessage('输入的数据格式不对，请重新输入');
    (Sender as TEdit).SetFocus;
    Exit;
  end;
  (Sender as TEdit).Text:= FormatFloat('0.000',tmp);
end;

procedure TfrmMeasureEdit_Mod664.edtMeasure_1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
     if pos('.',(Sender as TEdit).Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

end.
