unit UpdateLZDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, damo, main,IBQuery, ADODB;

type
  TFrmUpdateLZDate = class(TForm)
    lb_code: TLabel;
    lb_dept: TLabel;
    dbt_dept: TDBEdit;
    dbt_code: TDBEdit;
    dbt_alt: TDBEdit;
    lb_oper: TLabel;
    lb_1: TLabel;
    chinesename: TDBEdit;
    lb_11: TLabel;
    dtp1: TDateTimePicker;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    lb_alt: TLabel;
    dbt_ondutytime: TDBEdit;
    procedure bbt_1Click(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUpdateLZDate: TFrmUpdateLZDate;

implementation

{$R *.dfm}

procedure TFrmUpdateLZDate.bbt_1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmUpdateLZDate.bbt_2Click(Sender: TObject);
begin
  if messagedlg('你确定要将员工 '+ chinesename.Text +' 的离职日期修改为 '+ DateTimeToStr(dtp1.DateTime ), mtconfirmation, [mbyes,mbno],1) = mryes then
  begin
    dm.qry_info.Edit;
    dm.qry_info.fieldByName('alterdate').AsDateTime := dtp1.DateTime ;
    close;                  
    dm.qry_info.Post;
    ShowMessage('修改成功！');
  end;
end;

end.
