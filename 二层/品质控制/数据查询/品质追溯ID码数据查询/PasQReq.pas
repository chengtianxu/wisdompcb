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
    grpDate: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    rgQryMode: TRadioGroup;
    grpWHW: TGroupBox;
    Label3: TLabel;
    cbbWH: TComboBox;
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
  dtpk2.date:= getsystem_date(DM.adoTmp,1);
  dtpk1.Date:= IncMonth(dtpk2.Date,-1);
//  DecodeDate(dtpk2.DateTime,Year,Month,Day);
//  dtpk1.date:= EncodeDate(Year,Month,01);

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
end;


procedure TfrmQRep.btnOkClick(Sender: TObject);
begin
  if cbbWH.ItemIndex=-1 then
  begin
    ShowMessage('请先选择工厂！');
    Exit;
  end;
  frmReport:=TfrmReport.Create(nil);
  try
    frmReport.LWHoure:= Integer(cbbWH.Items.Objects[cbbWH.ItemIndex]);
    frmReport.LMode:=rgMode.ItemIndex;       //汇总模式  以周
    frmreport.LData:= rgQryMode.ItemIndex;      //以线别汇总
    frmReport.LSDate:= dtpk1.Date;
    frmReport.LEDate:= dtpk2.Date;
    frmReport.ShowModal;
  finally
    frmReport.Free;
  end;

end;

end.
