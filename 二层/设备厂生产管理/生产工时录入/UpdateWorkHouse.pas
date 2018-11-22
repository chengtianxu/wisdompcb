unit UpdateWorkHouse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, common, DM;

type
  TFrmUpdateWorkHouse = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUpdateWorkHouse: TFrmUpdateWorkHouse;

implementation

{$R *.dfm}

procedure TFrmUpdateWorkHouse.FormCreate(Sender: TObject);
begin
  Edit1.Text := damo.qry1.FieldValues['工号'];
  Edit2.Text := damo.qry1.FieldValues['姓名'];
  Edit3.Text := damo.qry1.FieldValues['产品编码'];
  Edit4.Text := damo.qry1.FieldValues['工时日期'];
  Edit5.Text := damo.qry1.FieldValues['工时'];
end;

procedure TFrmUpdateWorkHouse.FormShow(Sender: TObject);
begin
  Edit5.SetFocus();
end;

procedure TFrmUpdateWorkHouse.BitBtn1Click(Sender: TObject);
begin
  with damo.qryTemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'update wzcp0073 set workhouse = '+ Trim(Edit5.Text)
      + ' where rkey_cp72 = ' + IntToStr(damo.qry1.FieldValues['rkey_cp72'])
      + ' and usr_ptr = ' + IntToStr(damo.qry1.FieldValues['usr_ptr']);
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Text := 'update wzcp0072 set TOTAL_WORKHOUSE =(select sum(workhouse) '
      + ' from wzcp0073 where rkey_cp72= '
      + IntToStr(damo.qry1.FieldValues['rkey_cp72']) + ')'
      + ' where wzcp0072.rkey = '
      + IntToStr(damo.qry1.FieldValues['rkey_cp72']);
    ExecSQL;
  end;
  damo.qry1.Close;
  damo.qry1.Open;
  damo.qry1.Locate('rkey_cp72; usr_ptr', damo.qry1['rkey_cp72; usr_ptr'] , []);
  Close;
end;

procedure TFrmUpdateWorkHouse.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
