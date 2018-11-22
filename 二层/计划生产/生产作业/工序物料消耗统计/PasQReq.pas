unit PasQReq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, ExtCtrls, StdCtrls, Buttons, Menus;

type
  TfrmQRep = class(TForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    rgMode: TRadioGroup;
    rgData: TRadioGroup;
    grpDate: TGroupBox;
    Label1: TLabel;
    dtpStart: TDateTimePicker;
    Label2: TLabel;
    dtpEnd: TDateTimePicker;
    grpWHW: TGroupBox;
    cbbWH: TComboBox;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    cbbGS: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmQRep: TfrmQRep;

implementation

uses DAMO,DateUtils,common, PasReport;

{$R *.dfm}

procedure TfrmQRep.FormShow(Sender: TObject);
var
   i:Integer;
   Year,Month,Day:Word;
begin
  dtpEnd.DateTime:= getsystem_date(DM.adoTmp,1);
  DecodeDate(dtpEnd.DateTime,Year,Month,Day);
  dtpStart.DateTime:= EncodeDate(Year,Month,01);

  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT RKEY,ABBR_NAME FROM DATA0015 ORDER BY RKEY';
    Open;
    First;
    while not Eof do
    begin
      cbbWH.Items.AddObject(FieldByName('abbr_name').AsString,Pointer(FieldByName('rkey').AsInteger));
      Next;
    end;
  end;

  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='SELECT FORMULA_NUMBER FROM DATA0569 WHERE ttype=0';
    Open;
    First;
    while not Eof do
    begin
      cbbGS.Items.Add(FieldByName('FORMULA_NUMBER').AsString);
      Next;
    end;
  end;

end;


procedure TfrmQRep.btnOkClick(Sender: TObject);
begin
  if (cbbWH.ItemIndex=-1) or (cbbGS.ItemIndex=-1) then
  begin
    ShowMessage('请先选择工厂与公式代码！');
    Exit;
  end;
  frmReport:=TfrmReport.Create(nil);
  try
    frmReport.LWHoure:= Integer(cbbWH.Items.Objects[cbbWH.ItemIndex]);
    frmReport.LFormula:= Trim(cbbGS.Text);
    frmReport.LMode:=rgMode.ItemIndex;
    frmreport.LData:= rgData.ItemIndex;
    frmReport.LSDate:= dtpStart.Date;
    frmReport.LEDate:= dtpEnd.Date;
    frmReport.ShowModal;
  finally
    frmReport.Free;
  end;

end;

end.
