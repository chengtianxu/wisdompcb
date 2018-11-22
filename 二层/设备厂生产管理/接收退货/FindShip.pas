unit FindShip;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TfrmFindShip = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    rdgStatus: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure rdgStatusClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFindShip: TfrmFindShip;

implementation

uses damo,common,DB;

{$R *.dfm}

procedure TfrmFindShip.BitBtn1Click(Sender: TObject);
begin
  edit1.Text:='';
  edit1.SetFocus;
end;

procedure TfrmFindShip.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.text)<>'' then
    case RadioGroup1.ItemIndex of
      0: dm.aqFindShip.Filter :='OUTNUMBER like ''%'+Trim(Edit1.Text)+'%''';
      1: dm.aqFindShip.Filter :='PROD_CODE like ''%'+Trim(Edit1.Text)+'%''';
      2: dm.aqFindShip.Filter :='PRODUCT_NAME like ''%'+Trim(Edit1.Text)+'%''';
      3: dm.aqFindShip.Filter :='PRODUCT_DESC like ''%'+Trim(Edit1.Text)+'%''';
    end
  else
    dm.aqFindShip.filter:='';
end;

procedure TfrmFindShip.DBGrid1DblClick(Sender: TObject);
begin
  if (not dm.aqFindShip.IsEmpty) then ModalResult:= mrok;
end;

procedure TfrmFindShip.RadioGroup1Click(Sender: TObject);
begin
  label1.Caption:= RadioGroup1.Items[RadioGroup1.ItemIndex];
  edit1.Text:='';
  edit1.SetFocus;
end;

procedure TfrmFindShip.dtpk1Exit(Sender: TObject);
begin
  dm.aqFindShip.Close;
  dm.aqFindShip.Parameters[0].Value:=dtpk1.Date;
  dm.aqFindShip.Parameters[1].Value:=dtpk2.Date+1;
  dm.aqFindShip.Open;
end;

procedure TfrmFindShip.rdgStatusClick(Sender: TObject);
begin
  dm.aqFindShip.Close;
  dm.aqFindShip.Parameters[6].Value:= rdgStatus.ItemIndex;
  dm.aqFindShip.Parameters[7].Value:= rdgStatus.ItemIndex;
  dm.aqFindShip.Open;
end;

procedure TfrmFindShip.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssAlt in Shift)  and  (Key=86) then
   showmessage(DM.aqFindShip.SQL.Text);
end;

procedure TfrmFindShip.FormShow(Sender: TObject);
begin
  dtpk1.Date:=getsystem_date(dm.aqTmp,1)-30;
  dtpk2.Date:=getsystem_date(dm.aqTmp,1);
  dm.aqFindShip.Close;

  dm.aqFindShip.Parameters[0].Value:= dtpk1.Date;
  dm.aqFindShip.Parameters[1].Value:= dtpk2.Date+1;
  dm.aqFindShip.Parameters[2].Value:= dm.aq98CUSTOMER_PTR.value;
  dm.aqFindShip.Parameters[3].Value:= dm.aq98CUSTOMER_PTR.value;
  dm.aqFindShip.Parameters[4].Value:= dm.aq98SO_PTR.value;
  dm.aqFindShip.Parameters[5].Value:= dm.aq98SO_PTR.value;
  dm.aqFindShip.Parameters[6].Value:= rdgStatus.ItemIndex;
  dm.aqFindShip.Parameters[7].Value:= rdgStatus.ItemIndex;
  dm.aqFindShip.Open;
  dm.aqFindShip.filter:='';
end;

end.
