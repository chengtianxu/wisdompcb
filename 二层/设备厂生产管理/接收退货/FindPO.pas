unit FindPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmFindPO = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    rdgStatus: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure rdgStatusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);    
  end;

var
  frmFindPO: TfrmFindPO;

implementation

uses damo, Detail,common;

{$R *.dfm}

procedure TfrmFindPO.NewGridWnd(var Message: TMessage);
var
  IsNeg : Boolean;
begin
  if Message.Msg = WM_MOUSEWHEEL then
  begin
    IsNeg := Short(Message.WParamHi) < 0;
    if IsNeg then
      dbgrid1.DataSource.DataSet.MoveBy(1)
    else
      dbgrid1.DataSource.DataSet.MoveBy(-1);
  end
  else
    OldGridWnd(Message);
end;

procedure TfrmFindPO.BitBtn1Click(Sender: TObject);
begin
  edit1.Text:='';
  edit1.SetFocus;
end;

procedure TfrmFindPO.Edit1Change(Sender: TObject);
begin

  if Trim(Edit1.text)<>'' then
  case RadioGroup1.ItemIndex of
    0: dm.aqFindPO.Filter :='sales_order like ''%'+Trim(Edit1.Text)+'%''';
    1: dm.aqFindPO.Filter :='PROD_CODE like ''%'+Trim(Edit1.Text)+'%''';
    2: dm.aqFindPO.Filter :='PRODUCT_NAME like ''%'+Trim(Edit1.Text)+'%''';
    3: dm.aqFindPO.Filter :='PRODUCT_DESC like ''%'+Trim(Edit1.Text)+'%''';
  end
  else
    dm.aqFindPO.filter:='';
end;

procedure TfrmFindPO.DBGrid1DblClick(Sender: TObject);
begin
  if (not dm.aqFindPO.IsEmpty) then ModalResult:= mrok;
end;

procedure TfrmFindPO.RadioGroup1Click(Sender: TObject);
begin
  label1.Caption:= RadioGroup1.Items[RadioGroup1.ItemIndex];
  edit1.Text:='';
  edit1.SetFocus;
end;

procedure TfrmFindPO.dtpk1Exit(Sender: TObject);
begin
  dm.aqFindPO.Close;
  dm.aqFindPO.Parameters[0].Value:=dtpk1.Date;
  dm.aqFindPO.Parameters[1].Value:=dtpk2.Date+1;
  dm.aqFindPO.Open;
end;

procedure TfrmFindPO.rdgStatusClick(Sender: TObject);
begin
  dm.aqFindPO.Close;
  dm.aqFindPO.Parameters[4].Value:= rdgStatus.ItemIndex;
  dm.aqFindPO.Parameters[5].Value:= rdgStatus.ItemIndex;
  dm.aqFindPO.Open;
end;

procedure TfrmFindPO.FormShow(Sender: TObject);
begin
  dtpk1.Date:=getsystem_date(dm.aqTmp,1)-30;
  dtpk2.Date:=getsystem_date(dm.aqTmp,1);
  dm.aqFindPO.Close;
  dm.aqFindPO.Parameters[0].Value:= dtpk1.Date;
  dm.aqFindPO.Parameters[1].Value:= dtpk2.Date+1;
  dm.aqFindPO.Parameters[2].Value:= dm.aq98CUSTOMER_PTR.value;
  dm.aqFindPO.Parameters[3].Value:= dm.aq98CUSTOMER_PTR.value;
  dm.aqFindPO.Parameters[4].Value:= rdgStatus.ItemIndex;
  dm.aqFindPO.Parameters[5].Value:= rdgStatus.ItemIndex;
  dm.aqFindPO.Open;
//  dm.aqFindPO.Filtered := False;
  dm.aqFindPO.filter:='';
end;

procedure TfrmFindPO.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
   showmessage(DM.aqFindPO.SQL.Text);
end;

end.
