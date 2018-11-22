unit detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,DB, ADODB, ExtCtrls;

type
  Tdetail_form = class(TForm)
    rg1: TRadioGroup;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label4: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    tmp1 : Integer;
    { Public declarations }
  end;

var
  detail_form: Tdetail_form;

implementation

uses DM_u,Frm_main_u;

{$R *.dfm}

procedure Tdetail_form.BitBtn1Click(Sender: TObject);
begin
  if rg1.ItemIndex = -1 then
  begin
      ShowMessage('请选择抄表类型。');
      rg1.SetFocus;
      abort;
  end;
  Frm_main.de_tmp1 := Self.rg1.ItemIndex;
  Frm_main.de_tmp2 := Self.DateTimePicker1.Date;
  Frm_main.de_tmp3 := Self.Edit4.Text;
  ModalResult := mrOk;

end;

procedure Tdetail_form.FormShow(Sender: TObject);
var
  QueryTmp:TADOQuery;
begin
          QueryTmp :=TADOQuery.Create(Self);
          QueryTmp.Connection := DM.ADOCon;
          with QueryTmp do
          begin
              close;
              sql.Text:='select getdate() as sys_date';
              open;
              DateTimePicker1.DateTime := StrToDateTime(fieldvalues['sys_date']);
          end;
          QueryTmp.Free;
end;

end.
